<?xml version="1.0" encoding="UTF-8"?>

<!--        
    
    Title:  CMS TemplateId Validations for CMS QRDA Category I 
    Author: Dan Donahue
    Date:   08-01-2018
    JIRA:   https://tracker.esacinc.com/browse/QRDA-455
            https://oncprojectracking.healthit.gov/support/browse/QRDA-701
            https://oncprojectracking.healthit.gov/support/browse/QRDA-702
            https://oncprojectracking.healthit.gov/support/browse/QRDA-703
            https://oncprojectracking.healthit.gov/support/browse/QRDA-795
 -->
<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />

	<sch:phase id="errors">
	    <sch:active pattern="p-CMS-QRDA-I-templateId-errors" />
 	</sch:phase>
     
    <sch:pattern id="p-CMS-QRDA-I-templateId-errors" >
        <sch:rule id="r-CMS-QRDA-I-templateId-errors" context="cda:ClinicalDocument">
            <!-- Fixed typo in assertion test, incorrect template root.  https://oncprojectracking.healthit.gov/support/browse/QRDA-795 -->
            <sch:assert id="a-CMS_US-Header-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'])=1">This document SHALL contain exactly one US Header templateId (@root='2.16.840.1.113883.10.20.22.1.1') with appropriate @extension (version) of the form 'yyyy-mm-dd'.</sch:assert>
            <sch:assert id="a-CMS_QRDA-Category-I-Framework-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'])=1">This document SHALL contain exactly one QRDA Category I framework templateId (@root='2.16.840.1.113883.10.20.24.1.1') with appropriate @extension (version) of the form 'yyyy-mm-dd'.</sch:assert>
            <sch:assert id="a-CMS_QDM-based-QRDA-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'])=1">This document SHALL contain exactly one QDM-based QRDA templateId (@root='2.16.840.1.113883.10.20.24.1.2') with appropriate @extension (version) of the form 'yyyy-mm-dd'.</sch:assert>
            <sch:assert id="a-CMS_QRDA-Category-I-Report-CMS-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'])=1">This document SHALL contain exactly one QRDA Category I Report - CMS templateId (@root='2.16.840.1.113883.10.20.24.1.3') with appropriate @extension (version) of the form 'yyyy-mm-dd'.</sch:assert>
        </sch:rule>
    </sch:pattern>
 
</sch:schema>