package gov.cms.qrda.validator.web.form;
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

import org.springframework.web.multipart.MultipartFile;

/**
 * Spring MVC Form containing data enabling the uploading of a file to a subDirectory 
 * under the QRDA_HOME/qrda file space.
 * 
 * @author Dan Donahue
 *
 */
public class UploadFileForm {
	
    private MultipartFile path;  // The file to upload
    private String name;         // New name for the file, if present
    private String subDir;       // The subDirectory to place the file. (For example "HL7", "HQR", "CEC", or "PQRS")
    

	public void setPath(MultipartFile path) {
		this.path =  path;
    }
    
    public MultipartFile getPath() {
    	return path;
    }
    
	public String getName() {
		return name;
	}
	
 	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}
	
 	public String getSubDir() {
		return subDir;
	}
	
 	public void setSubDir(String val) {
		this.subDir = val == null ? null : val.trim();
	}
}
