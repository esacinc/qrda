// Source w3schools.com - XML Display
// Parses an XML file (or a string containing the contents of an XML file), generating html for use in displaying on a web page.

			function displayXML(file,divId) {
				  var xhttp = new XMLHttpRequest();
				  xhttp.onreadystatechange = function() {
				    if (xhttp.readyState == 4 && xhttp.status == 200) {
				      displayXMLResponse(xhttp,divId);
				    }
				  };
				  xhttp.open("GET", file, true);
				  xhttp.send();
				}
			
			function displayXMLResponse(xml,divId) {
				  var x, parser, xmlDoc, txt, etxt;
				  try { 
					displayXMLString(xml.responseText,divId);
				  } catch(err) {
				    //txt = err.message
					  txt = "<span class='bg-danger'>Error parsing file. XML-format expected. (" + err.message + ")</span><br/>"+xmlStr;
				  }
				}

			function displayXMLString(xmlStr,divId) {
				  var x, parser, xmlDoc, txt, etxt;
				  try { 
				    parser = new DOMParser();
				    xmlDoc = parser.parseFromString(xmlStr,"text/xml");
				    x = xmlDoc.documentElement;
				    txt = "<span  style='color:brown'>&lt;" + x.nodeName + "&gt;</span>"
				    level = 1;
				    txt += aggregateResult(x);
				    level = 0; 
				    txt += "<br><span  style='color:brown'>&lt;/" + x.nodeName + "&gt;</span>"
				    if (xmlDoc.getElementsByTagName("parsererror").length > 0) {
				      etxt = xmlDoc.getElementsByTagName("parsererror")[0].innerHTML;
				      if (etxt != undefined) {
				        txt = xmlDoc.getElementsByTagName("parsererror")[0].innerHTML + txt;
				      }
				    } 
				  } catch(err) {
				    txt = "<span class='bg-danger'>Error parsing file. XML-format expected. (" + err.message + ")</span><br/>"+xmlStr;
				  }
				  document.getElementById(divId).innerHTML = txt;
				}

			function aggregateResult(x) {
				  var i, j, y, z, txt;
				  txt = "";
				  z = x.childNodes;
				   for (i = 0; i < z.length; i++) {
				    y = z[i];
				    if (y.nodeType == 1) {
				      if (y.nodeName != "parsererror") {
				        txt += "<br>" + makeSpace(level);
				        txt += "<span style='color:brown'>&lt;" +
				        y.nodeName + "</span>" + getAttributes(y) + "<span style='color:brown'>&gt;</span>";
				        level++;
				        txt += aggregateResult(y);
				        level--;
				        txt += "<span style='color:brown'>&lt;/" +
				        y.nodeName + "&gt;</span>";
				      }
				    } else {
				      if (y.nodeType == 3) {
				        txt += y.nodeValue;
				      } else {
				        //txt += y.nodeType + y.nodeValue;
				      }
				    }
				  }
				  return txt;
				}
			
				function getAttributes(xml) {
				  var i;
				  var txt = "";
				  var x = xml.attributes;
				   for (i = 0; i < x.length; i++) {
				    if (x[i].name == "style") {return txt;}
				    txt += " <span style='color:red'>" + x[i].name + "=" + "</span>" +
				    "<span style='color:blue'>" + '"' + x[i].value + '"' + "</span>";
				  }
				  return txt;
				}
				
				function makeSpace(x) {
				  var i, txt = "";
				  for (i = 0; i < level; i++) {
				    txt += " &nbsp;&nbsp;&nbsp;";
				  }
				  return txt;
				}
