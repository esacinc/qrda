
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
POSSIBILITY OF SUCH DAMAGE
 */

package schemaVerification;


import java.util.List;
import java.util.ArrayList;
import java.util.Hashtable;
import org.jdom2.*;

// This calss is an encapsulation of a Schemetron file built atop the jdom2
// representation of of XML documents (Document)

// The representation  is a root hierarchy to  get the top call getRoot()
//

public class Schematron {

	// Mark the Document associated with the Schematron reference
	private Document document  = null;
	private Element rootNode = null;

	
	public Schematron(Document document) {
		this.document = document;
		Element e1 = this.rootNode = document.getRootElement();

		rootNode = e1;

		/*

		System.out.println("In Schematron constructor");

		System.out.println("root = " + rootNode);
		System.out.println("document = " + document);
		System.out.println();
		 */
	}
	
	// Return root of the tree of Eelements that is the internal representation of the Schmematron
	public Element getRoot(){
		return (rootNode) ;
	}

	// Removes parents so that the list can be merged
	static public List<Element> detachAll (List<Element> elems){
		//System.out.println("In detach");
		List<Element>newElems = new ArrayList<Element>();

		for (int temp = 0; temp < elems.size(); temp++) {  
			Element e1 = elems.get(temp).detach();
			e1.removeContent();
			newElems.add(e1);
		}
		return(newElems);
	}



	// Construct representation for the merged file
	public Hashtable<String,Element> makePatterns( ){

		// Table used to record elements
		Hashtable<String,Element> patternTable = new Hashtable<String,Element>();

		List<Element> eList = rootNode.getChildren();

		for (int temp = 0; temp < eList.size(); temp++) {    
			Element el = eList.get(temp);
			String eName = el.getName();

			if (eName.equals("pattern")) {

				List<Content> rules = el.getContent();
				String idAttribute = el.getAttribute("id").getValue();
				Element elp = makePatternElement(idAttribute );
				elp.detach();

				for (Content c : rules) {
					Content cc = c.clone();
					// System.out.println("Added rule " + cc);
					elp.addContent(cc.detach());
				}


				patternTable.put(idAttribute, elp.detach()); 


			}
		}

		/*
     	 System.out.println("Dumping Table");
     	 for (String s : patternTable.keySet()){
     		   System.out.println("Key  " + s);
     		   System.out.println("Value   " + patternTable.get(s).getChildren());
     	 }
		 */ 
		return (patternTable);
	}

	public Element makePhaseElement( String phaseId){

		Element rn = getRoot();

		String name = "phase";

		Element eToRet = new Element(name, rn.getNamespace()  );
		Attribute attrib = new Attribute("id", phaseId);

		eToRet.setAttribute(attrib);

		return (eToRet.detach() );
	}

	public  Element makePatternElement( String patName){

		Element rn = getRoot();

		String name = "pattern";

		Element eToRet = new Element(name, rn.getNamespace()  );
		Attribute attrib = new Attribute("id", patName);

		eToRet.setAttribute(attrib);

		return (eToRet );
	}


	public Hashtable<String,Element> makeNamespaces( ){


		Hashtable<String,Element> namespaceTable = new Hashtable<String,Element>();

		List<Element> eList = rootNode.getChildren();

		//System.out.println("In makeNamespaces( ) found " + eList.size() + " children");


		for (int temp = 0; temp < eList.size(); temp++) {    
			Element el = eList.get(temp);
			String eName = el.getName();

			//System.out.println(temp + " In makeNamespaces( ) ename =  " + eName);
			if (eName.equals("ns")) {

				String nameAttribute = el.getAttribute("prefix").getValue();

				//System.out.println(temp + " In makeNamespaces( ) added " + nameAttribute);
				namespaceTable.put(nameAttribute, el); 
				//System.out.println();
			}

		}


		//System.out.println("In makeNamespaces( ) added " + namespaceTable.size()     + " namespaces");   
		//System.out.println();
		return (namespaceTable);
	}


	// Returns a Hashtable the keys are the string used to name the error
	// The value is the Xml element

	public Hashtable<String,Element> makeErrors( ){


		List<Element> eList = rootNode.getChildren();

		//System.out.println("In makeErrors( ) found " + eList.size() + " children");

		Hashtable<String,Element> eTable = new Hashtable<String,Element>();

		for (int temp = 0; temp < eList.size(); temp++) {    
			Element el = eList.get(temp);
			String eName = el.getName();


			if (eName.equals("phase")){

				String phase = el.getAttribute("id").getValue();


				// look at the errors declared in the schematron
				if (phase.equals("errors")) {


					List<Element> eListChildren = el.getChildren();

					// loop over the children
					for (int temp2 = 0; temp2 < eListChildren.size(); temp2++) { 
						Element elP = eListChildren.get(temp2);

						String pattern = elP.getAttribute("pattern").getValue();

						//System.out.println("pattern = " + pattern);
						//System.out.println("elP = " + elP);

						eTable.put(pattern, elP);   
					}
				}
			}

		}

		//System.out.println("In makeErrors( ) found " + eTable.size() + " errors");
		return (eTable);
	}


	// Returns a HAshtable the keys are the string used to name the warning
	// The value is the Xml element
	public Hashtable<String,Element> makeWarnings( ){


		List<Element> eList = rootNode.getChildren();

		//System.out.println("In makeWarnings( ) found " + eList.size() + " children");

		Hashtable<String,Element> eTable = new Hashtable<String,Element>();

		for (int temp = 0; temp < eList.size(); temp++) {    
			Element el = eList.get(temp);
			String eName = el.getName();


			if (eName.equals("phase")){

				String phase = el.getAttribute("id").getValue();


				if (phase.equals("warnings")) {


					List<Element> eListChildren = el.getChildren();


					for (int temp2 = 0; temp2 < eListChildren.size(); temp2++) { 
						Element elP = eListChildren.get(temp2);

						String pattern = elP.getAttribute("pattern").getValue();

						//System.out.println("pattern = " + pattern);
						//System.out.println("elP = " + elP);

						eTable.put(pattern, elP);   
					}
				}
			}

		}

		//System.out.println("In makeWarnings( ) found " + eTable.size() + " errors");
		return (eTable);
	}


	public Element  makeMergedRoot(Element r){

		Namespace ns = r.getNamespace();
		Element m = new Element(r.getName(),ns );

		return(m);
	}



}