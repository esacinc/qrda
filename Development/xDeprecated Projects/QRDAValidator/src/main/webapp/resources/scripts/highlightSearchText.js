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

function searchDiv (divId, searchTxt, cntId) {
		// Search the given <div>'s innerHTML for the given text.  Report the number of matches in the <div> with the given cntId.'
		// Surround each matched instance of searchTxt with a <span> element of the class 'searchtext'.  Define that class in css or in
		// a <style> block in the header.
		clearSearchDiv("#" + divId + ", span");  // Remove any current instances of searchtext class in the div
		if (!searchTxt || searchTxt.trim().length == 0) {
			countDiv.innerHTML = '<p class="bg-danger">No search text provided</p>';
			return;
		}
		
		var contentDiv = document.getElementById(divId);
		var countDiv = document.getElementById(cntId);
		var orig = contentDiv.innerHTML;
		var replacementTxt = "<span class='searchtext'>" + searchTxt + "</span>";
		var res = orig.match(new RegExp(searchTxt,"g"));
		var cnt = 0;
		if (res) {
			cnt = res.length;
		}
		if (cnt > 0) {
			var newtxt  = orig.replace(new RegExp(searchTxt,"g"),replacementTxt);
			contentDiv.innerHTML = newtxt;
			countDiv.innerHTML = '<p class="bg-success">' + cnt + ' matches found</p>';
		}
		else {
			countDiv.innerHTML = '<p class="bg-danger">No matches found</p>';
		}
		
	}
	
	function clearSearchDiv (divSelector) {
		// Remove any instances of the searchtext class from elements located using the given jquery selector.
		// Example:   "#divID span"  will remove all searchtext classes from all span elements under the element with the given divID.
		$(divSelector).children().removeClass("searchtext");
	}
