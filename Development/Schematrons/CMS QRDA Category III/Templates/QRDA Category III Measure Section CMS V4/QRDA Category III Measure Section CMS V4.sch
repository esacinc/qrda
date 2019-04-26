<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-575 -->
<!-- Updated template 2.16.840.1.113883.10.20.27.2.3 extension to 2019-05-01 throughout-->
<!-- Updated template 2.16.840.1.113883.10.20.27.2.17 extension to 2019-05-01 -->
<!-- Updated conformance id prefix from 3338 to 4427 in 4427-17906_C01 -->

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III_Measure_Section-template-pattern-errors" />
        <sch:active pattern="QRDA_Category_III_Measure_Section_CMS-pattern-errors" />
    </sch:phase>

    <sch:pattern id="QRDA_Category_III_Measure_Section-template-pattern-errors">
        <sch:rule id="QRDA_Category_III_Measure-template-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2017-06-01']]">
            <sch:assert id="a-CMS_64-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2019-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_64) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.3" (CONF:CMS_65). SHALL contain exactly one [1..1] @extension="2019-05-01" (CONF:CMS_66). </sch:assert>
        </sch:rule>   
    </sch:pattern>
    <sch:pattern id="QRDA_Category_III_Measure_Section_CMS-pattern-errors">
        <sch:let name="intendedRecipient-Measure-CMS" value="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:id/@extension" />    
        <sch:rule id="QRDA_Category_III_Measure_Section_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2019-05-01']]">
            <sch:assert id="a-4427-17906_C01-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2019-05-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:4427-17906_C01) such that it SHALL contain exactly one [1..1] Measure Reference and Results - CMS (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.17:2019-05-01) (CONF:4427-17907_C01). </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>