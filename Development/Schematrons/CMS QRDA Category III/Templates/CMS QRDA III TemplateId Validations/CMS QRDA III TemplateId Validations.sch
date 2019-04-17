<?xml version="1.0" encoding="UTF-8"?>

<!--        
    
    Title:  CMS TemplateId Validations for CMS QRDA Category IIII 
    Author: Dan Donahue
    Date:   08-01-2018
    JIRA:   https://tracker.esacinc.com/browse/QRDA-455
            https://oncprojectracking.healthit.gov/support/browse/QRDA-701
            https://oncprojectracking.healthit.gov/support/browse/QRDA-702
            https://oncprojectracking.healthit.gov/support/browse/QRDA-703
 -->
<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="p-CMS-QRDA-III-templateId-errors" />
    </sch:phase>
    
    <sch:pattern id="p-CMS-QRDA-III-templateId-errors" >
        <sch:rule id="r-CMS-QRDA-III-templateId-errors" context="cda:ClinicalDocument">
            <sch:assert id="a-CMS_QRDA-Category-III-Report-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'])=1">This document SHALL contain exactly one QRDA-Category-III-Report templateId (@root='2.16.840.1.113883.10.20.27.1.1') with appropriate @extension (version) of the form 'yyyy-mm-dd'.)</sch:assert>
            <sch:assert id="a-CMS_QRDA-Category-III-Report-CMS-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'])=1">This document SHALL contain exactly one QRDA Category IIII Report - CMS templateId (@root='2.16.840.1.113883.10.20.27.1.2') with appropriate @extension (version) of the form 'yyyy-mm-dd'.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>