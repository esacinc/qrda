package com.esacinc.schematronvalidator.validator.xml;
/*
Copyright (c) 2016+, ESAC, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this 
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, 
   this list of conditions and the following disclaimer in the documentation 
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to 
   endorse or promote products derived from this software without specific 
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.

*/

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.Attributes;
import org.xml.sax.Locator;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.DefaultHandler;

import com.esacinc.schematronvalidator.validator.model.TestCase;

/**
 * A utility file that opens an XML file (either with or without line numbers noted), and provides methods for parsing that file
 * via xpath expressions.
 * 
 * @author Dan Donahue
 *
 */
public class XPathUtility {
	private static final Logger logger = LoggerFactory.getLogger(XPathUtility.class);
	
	public final static String LINE_NUMBER_KEY_NAME = "lineNumber";
	public final static String END_LINE_NUMBER_KEY_NAME = "endLineNumber";

	private static DocumentBuilderFactory docBuilderFactory = null;
	private static DocumentBuilder docBuilder = null;
	
	private static void init() {
		// Create a singleton docBuilderFactory and docBuilder instance if they do not yet exist.
	    if (docBuilderFactory == null) {
	    	docBuilderFactory = DocumentBuilderFactory.newInstance();
	    	docBuilderFactory.setNamespaceAware(true);
	    	try {
	    		docBuilder = docBuilderFactory.newDocumentBuilder();
	    	}
	    	catch (ParserConfigurationException err) {
				 logger.error ("** Error creating docBuildeFactory and/or docBuilder: " + ", " + err.getMessage(), err);
	    	}
	    }
	}
	
	static public  Document openXMLFile(InputStream file) {
		Document doc = null;
		try {
			// Open the file and prepare for use with xpath
		    init();
		    doc = docBuilder.parse (file);
		    doc.getDocumentElement().normalize();
		    return doc;
		}
		 catch (SAXParseException err) {
			 logger.error("** Parsing error" + ", line " + err.getLineNumber () + ", uri " + err.getSystemId (), err);
		} catch (SAXException err) {
			logger.error("** SAX error" + ", " + err.getMessage(), err);
		} catch (IOException err) {
			logger.error("** IO Error error" + ", " + err.getMessage(),err);
		} catch (Exception err) {
			logger.error("** Exception," + err.getMessage(),err);
		}
		return doc;
	}

	public static Document openXMLFileWithLineNumbers(final InputStream is) throws IOException, SAXException {
        final Document doc;
        SAXParser parser;
        // Open the file and prepare for use with xpath. The document returned contains start/end line numbers for each node.
        init();
        try {
            final SAXParserFactory factory = SAXParserFactory.newInstance();
            parser = factory.newSAXParser();
            doc = docBuilder.newDocument();
        } catch (final ParserConfigurationException e) {
            throw new RuntimeException("Can't create SAX parser / DOM builder.", e);
        }

        final Stack<Element> elementStack = new Stack<Element>();
        final StringBuilder textBuffer = new StringBuilder();
        final DefaultHandler handler = new DefaultHandler() {
        Locator locator;

            @Override
            public void setDocumentLocator(final Locator locator) {
                this.locator = locator; // Save the locator so that it can be used later for line tracking when traversing nodes.
            }

            @Override
            public void startElement(final String uri, final String localName, 
			final String qName, final Attributes attributes)
                    throws SAXException {
                addTextIfNeeded();
                final Element el = doc.createElement(qName);
                for (int i = 0; i < attributes.getLength(); i++) {
                	//logger.info("Doc attribute: " + i + ", " + attributes.getQName(i));
                    el.setAttribute(attributes.getQName(i), attributes.getValue(i));
                }
                el.setUserData(LINE_NUMBER_KEY_NAME, String.valueOf(this.locator.getLineNumber()), null);
                elementStack.push(el);
            }

            @Override
            public void endElement(final String uri,final String localName,final String qName){
                addTextIfNeeded();
                final Element closedEl = elementStack.pop();
                if (elementStack.isEmpty()) { // Is this the root element?
                    doc.appendChild(closedEl);
                } else {
                    final Element parentEl =  elementStack.peek();
                    parentEl.appendChild(closedEl);
                }
                closedEl.setUserData(END_LINE_NUMBER_KEY_NAME, String.valueOf(this.locator.getLineNumber()), null);
            }

            @Override
            public void characters(final char ch[], final int start, final int length) throws SAXException {
                textBuffer.append(ch, start, length);
            }

            // Outputs text accumulated under the current node
            private void addTextIfNeeded() {
                if (textBuffer.length() > 0) {
                    final Element el =  elementStack.peek();
                    final Node textNode = doc.createTextNode(textBuffer.toString());
                    el.appendChild(textNode);
                    textBuffer.delete(0, textBuffer.length());
                }
            }
        };
        parser.parse(is, handler);

        return doc;
    }
	
	// Returns the actual xml text of the node that the given expression evaluates to
	static public  String getNodeText(Document doc, String xpathExpression) {
	    String res = null;
	    try {
		    XPath xpath = XPathFactory.newInstance().newXPath();        
        	logger.debug("Finding: " + xpathExpression);
        	XPathExpression expr =  xpath.compile(xpathExpression);
        	res = expr.evaluate(doc);
         }
        catch (XPathExpressionException e) {
        	logger.error("Parsing exception when evaluating " + xpathExpression + " in document. : " + e.getMessage(), e);
        }
	    return res;
	}  

	static public  Integer getNodeLineNumber(Document doc, String xpathExpression) {
	    Integer res = null;
	    try {
		    XPath xpath = XPathFactory.newInstance().newXPath();        
        	XPathExpression expr =  xpath.compile(xpathExpression);
        	Node node = (Node)expr.evaluate(doc,XPathConstants.NODE);
        	res = (Integer)node.getUserData("lineNumber");
        }
        catch (XPathExpressionException e) {
        	logger.error("Parsing exception on getNodeLineNumber of expression " + xpathExpression + ": " + e.getMessage(), e);
        	
        }
	    return (res == null)? -1 : res;
	}  

	static public Node getNode(Document doc, String xpathExpression, TestCase tc) {
	    Node res = null;
	    try {
	    	// QRDA-468 The version of XPathFactory expects xpathExpressions to be in xslt1 format.
	    	// If the schematron is using queryBinding='xslt2', then the expathExpressions are in a different format.
	    	// So, for now at least, the simplest thing to do is convert the xpathExpression to xslt1 format at all times.
	    	// This can be done by using two string replacements to keep the tags name the same, but replace the surrounding stuff...
            // xslt2 path example: "/:QualityMeasureDocument[namespace-uri()='urn:hl7-org:v3'][1]/:observationCriteria[namespace-uri()='urn:hl7-org:v3'][1]"
	    	// xslt1 path example: "/[local-name()='QualityMeasureDocument']/[local-name()='observationCriteria']"
	    	xpathExpression=xpathExpression.replace("/*:", "/*[local-name()='");
	    	xpathExpression=xpathExpression.replace("[namespace-uri()='urn:hl7-org:v3']", "']");
	    	//logger.info("New xpath: " + xpathExpression);
	    	XPath xpath = XPathFactory.newInstance().newXPath();        
        	XPathExpression expr =  xpath.compile(xpathExpression);
        	res = (Node)expr.evaluate(doc,XPathConstants.NODE);
         }
        catch (XPathExpressionException e) {
        	//String msgFormat = "<a href=\"\" onClick=\"javascript:return false;\" data-toggle=\"popover\" title=\"Node:\" data-content=\"%s\" ><span class=\"glyphicon glyphicon-info-sign\"></span></a>";
        	//tc.addStatusText("<span class='bg-danger' style='margin-left:20px;'>Error parsing report node</span> " + String.format(msgFormat, xpathExpression) + ": " + "<span >" + e.getMessage() +"</span>");
        	logger.error("Parsing exception on getNode of expression " + xpathExpression + ": " + e.getMessage(), e);
       	
        }
	    return res;
	} 
	
	static public List<String> getElements(Document doc, String xpathExpression) {
        List<String> list = new ArrayList<String>();
        try {
            XPath xpath = XPathFactory.newInstance().newXPath();
            XPathExpression expr = xpath.compile(xpathExpression);
            NodeList nodes = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            for (int i = 0; i < nodes.getLength(); i++)
                 list.add(nodes.item(i).getNodeValue());
            	
        } catch (XPathExpressionException e) {
        	logger.error("Parsing exception: " + e.getMessage(), e);
        }
        return list;
	}  
	

	// Returns the xml of the given node in a String
	static public String nodeToString(Node node) {
        StringWriter sw = new StringWriter();
        try {
          Transformer t = TransformerFactory.newInstance().newTransformer();
          t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
          t.setOutputProperty(OutputKeys.INDENT, "yes");
          t.transform(new DOMSource(node), new StreamResult(sw));
        } catch (TransformerException te) {
          logger.error("nodeToString Transformer Exception",te);
        }
        return sw.toString();
      }

	
	 // Find the named subnode in a node's sublist.
	 // 
	 // Ignores comments and processing instructions.
	 // Ignores TEXT nodes (likely to exist and contain
	 //         ignorable whitespace, if not validating.
	 // Ignores CDATA nodes and EntityRef nodes.
	 // Examines element nodes to find one with
	 //        the specified name.
	 // 
	static public Node findSubNode(String name, Node node, TestCase tc) {
	    if (node.getNodeType() != Node.ELEMENT_NODE) {
	        logger.error("ERROR: Search node not of element type");
	        return null;
	    }

	    if (! node.hasChildNodes()) return null;

	    NodeList list = node.getChildNodes();
	    for (int i=0; i < list.getLength(); i++) {
	        Node subnode = list.item(i);
	        if (subnode.getNodeType() == Node.ELEMENT_NODE) {
	           if (subnode.getNodeName().equals(name)) 
	               return subnode;
	        }
	    }
	    return null;
	}
	
	 // Returns the previous sibling but only if it is an element. This handles the text
	 // nodes that may be in between them.
	 // 
	static public Node getPreviousSibling(Node node, TestCase tc) {
		if (node.getNodeType() != Node.ELEMENT_NODE) {
	        logger.error("ERROR: Search node not of element type");
	       // tc.addStatusText(wrapErrorSpan("ERROr: Report processing - Node " + node.getNodeName() + " not of ELEMENT_NODE type"));
	        return null;
	    }

		Node previous = node.getPreviousSibling();
	    if (previous == null) {
	    	return null;
	    }
	    
	    while (previous.getNodeType() != Node.ELEMENT_NODE) {
	    	previous = previous.getPreviousSibling();
	    }
	    
	    return previous;
	}
	
	  // Return the text that a node contains. This routine:
	  // 
	  // Ignores comments and processing instructions.
	  // Concatenates TEXT nodes, CDATA nodes, and the results of
	  //     recursively processing EntityRef nodes.
	  // Ignores any element nodes in the sublist.
	  //     (Other possible options are to recurse into element 
	  //      sublists or throw an exception.)
	  // 
	static public String getNodeText(Node node) {
	    StringBuffer result = new StringBuffer();
	    if (! node.hasChildNodes()) return "";

	    NodeList list = node.getChildNodes();
	    for (int i=0; i < list.getLength(); i++) {
	        Node subnode = list.item(i);
	        if (subnode.getNodeType() == Node.TEXT_NODE) {
	            result.append(subnode.getNodeValue());
	        }
	        else if (subnode.getNodeType() == Node.CDATA_SECTION_NODE) {
	            result.append(subnode.getNodeValue());
	        }
	        else if (subnode.getNodeType() == Node.ENTITY_REFERENCE_NODE) {
	            // Recurse into the subtree for text
	            // (and ignore comments)
	            result.append(getNodeText(subnode));
	        }
	    }

	    return result.toString();
	}

}
