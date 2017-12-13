// 
// Parses an XML formatted string and generates pretty-printed (but not syntax highlighted) xml 
// This makes allowances for specific ELM elements: annotations, etc.
//

var level = 0;                 // Global variable used to control indentations in the generated text
var ignoreStyles = false;      // Global variable ignore style dictating whether to include styling (colors, etc.) to output
var writeFormat = "html";      // Global variable "text" or "html",  indicates how to output newlines, spaces, etc. depending on if writing plain text or html

// Stylings for displaying generic XML when ignoreStyles = false
var nodeNameStyle = "font-weight:bold;color: Crimson;";
var attrNameStyle = "font-weight:bold;color:DarkOrange;";
var attrValStyle = "color:Blue";
var commentStyle = "color:DimGray;";


// Global variables specific to EML formatted text (used in CQL Online II).
var ignoreAnnotations = true;  // ELM-specific Global variable controlling whether to include ELM annotation error elements in the generated text or not.
var loadingLib = false;         // ELM-specific Global variables for loading library
var errorFlag = true; 


function parseXMLString(xmlStr) {
	var x, parser, xmlDoc, txt, etxt;
	try {
		parser = new DOMParser();
		xmlDoc = parser.parseFromString(xmlStr, "text/xml");
		x = xmlDoc.documentElement;
		txt = ""; //<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		level = 0;
		txt += aggregateResults(txt, x);
		level = 0;
		// Now show the parse error elements, if any.
		if (xmlDoc.getElementsByTagName("parsererror").length > 0) {
			txt += writeNewLine() + writeNewLine() + writeParseError("Parse Errors Encountered:") + writeNewLine();
			etxt = xmlDoc.getElementsByTagName("parsererror")[0].innerHTML;
			if (etxt != undefined) {
				txt += writeParseError(xmlDoc.getElementsByTagName("parsererror")[0].innerHTML);
			}
		}
	} catch (err) {
		txt = writeParseError("Error parsing file. XML-format expected. (" + err.message + ")") + writeNewLine() + xmlStr;
	}
	return txt;
}

function aggregateResults(textSoFar, thisNode) {
    var i, j
    var childNode, kids, txt;
    txt = "";
    kids = thisNode.childNodes;
    // If this node has no children, then just create the element with its attributes, and return
    if (kids.length == 0) {
        textSoFar += writeNewLine() + writeSpaces(level) + "<" + writeNodeName(thisNode.nodeName) + getNodeAttributes(thisNode) + "/>";
        return textSoFar;
    }
    else {
        // This node has children, so create the element with attributes, then recurse for each child node
        textSoFar += writeNewLine() + writeSpaces(level) + "<" + writeNodeName(thisNode.nodeName) + getNodeAttributes(thisNode) + ">";
        for (i = 0; i < kids.length; i++) {
            childNode = kids[i];
			
            if (childNode.nodeType == 1) { // This node is an element node. Continue as long as its not a "parseerror" node
                // This is ELM specific:
                // Only process the node if either ignoreAnnotations = false OR if the node is not an annotation node
                if (!ignoreAnnotations || (childNode.nodeName != "annotation" && childNode.nodeName != "a:s")) {
                    if (childNode.nodeName != "parsererror") {
                        level++;
                        textSoFar = aggregateResults(textSoFar, childNode); // Recurse for this child
                        level--;
                    } // end if not pareserror
                }
			}
            else if (childNode.nodeType == 3) { // text
                    textSoFar += childNode.nodeValue;
            }
			else if (childNode.nodeType == 8) { // comment
					var fakeLevel = level + 1;
                    textSoFar += writeNewLine() + writeSpaces(fakeLevel) + writeComment(childNode.nodeValue);
            }			
			else { 
                    textSoFar += childNode.nodeType + childNode.nodeValue;
            } // end if not annotation
        } // end for loop
        textSoFar += writeNewLine() + writeSpaces(level) + "&lt;/" + writeNodeName(thisNode.nodeName) + ">";

    }
    return textSoFar;
}

// Collect the attributes (and values) of the given xml element
function getNodeAttributes(xml) {
    var i;
    var txt = "";
    var x = xml.attributes;
    for (i = 0; i < x.length; i++) {
        if (x[i].name == "style") {
            return txt;
        }
        txt += " " + writeAttributeName(x[i].name) + "=" + writeAttributeValue(x[i].value);
    }
    return txt;
}

// Add spaces to the current level (global variable). 
// The syntax of the space elements vary depending on the type of output we are generating.
function writeSpaces(x) {
    var i, txt = "";
    for (i = 0; i < x; i++) {
		switch (writeFormat) {
			case "text": txt += "      "; break;
			case "html": txt += "&nbsp;&nbsp;&nbsp;    "; break;
			default: txt += "&nbsp;&nbsp;&nbsp; "; break;
		}        
    }
    return txt;
}

// Generate a newline character in text or html
function writeNewLine() {
	switch(writeFormat) {
		case "text": return "\n";
		case "html": return "<br/>";
		default: return "<br/>";
	}
}

// Generate the given node name, possibly surrounded by style elements (<span> tag)
function writeNodeName(nodeName) {
	if (ignoreStyles == true) {
		return nodeName;
	}
	else {
		return "<span style='" + nodeNameStyle + "'>" + nodeName + "</span>";
	}
}

// Generate the given attribute name, possibly surrounded by style elements (<span> tag)
function writeAttributeName(attName) {
	if (ignoreStyles == true) {
		return attName;
	}
	else {
		return "<span style='" + attrNameStyle + "'>" + attName + "</span>";
	}
}

// Generate the given attriubute value, surrounded by double quotes, and possibly surrounded by style elements (<span> tag)
function writeAttributeValue(attValue) {
	if (ignoreStyles == true) {
		return '"' + attValue + '"';
	}
	else {
		return "<span style='" + attrValStyle + "'>" + '"' + attValue + '"' + "</span>";
	}
}

// Generate the given error message, possibly surrounded by style elements (<span> tag)
function writeParseError(msg) {
	if (ignoreStyles == true) {
		return msg;
	}
	else {
		return "<span class='bg-danger'>" + msg + "</span>";
	}
}

// Generate the given error message, possibly surrounded by style elements (<span> tag)
function writeComment(msg) {
	var txt = txt = "&lt;!-- ";;
	if (ignoreStyles == false) {
		txt = "<span style='" + commentStyle + "'>" + txt;
	}
	// When generating html, we have to jump through some hoops to get the correct new lines in the output comment...
	if (writeFormat == "html") {
		var splits = msg.split("\n");
		if (splits.length == 1) {
			txt += splits[0]; // No newlines, so just output the msg 
		}
		else {
			// Otherwise, output a newline then the next item.
			for (var i = 0; i < splits.length; i++) {
				txt += writeNewLine() + splits[i];
			}
		}
	}
	// Close the generated comment, adding the closing span if we're doing styles as well.
	if (ignoreStyles == true) {
		return txt + "--&gt;";
	}
	else {
		return txt += " --&gt;</span>";;		
	}
}

