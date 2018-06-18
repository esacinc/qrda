<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->
<!-- JIRA https://tracker.esacinc.com/browse/QRDA-444 -->

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
            <sch:assert id="a-CMS_64-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_64) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.3" (CONF:CMS_65). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_66). </sch:assert>
        </sch:rule>   
    </sch:pattern>
    <sch:pattern id="QRDA_Category_III_Measure_Section_CMS-pattern-errors">
        <sch:let name="intendedRecipient-Measure-CMS" value="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:id/@extension" />    
        <sch:rule id="QRDA_Category_III_Measure_Section_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-05-01']]">
            <!--   <sch:report id="recipient-value" test="1 = 1">The Recipient is <sch:value-of select="$intendedRecipient-Measure-CMS"/></sch:report> -->
            <sch:assert id="a-3338-17906-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2018-05-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:3338-17906) such that it SHALL contain exactly one [1..1] Measure Reference and Results - CMS (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.17:2018-05-01) (CONF:3338-17907_C01). </sch:assert>
            <sch:assert id="a-CMS_68-error" test="$intendedRecipient-Measure-CMS != 'MIPS_INDIV'   or ($intendedRecipient-Measure-CMS='MIPS_INDIV' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_INDIV", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_68). </sch:assert>
            <sch:assert id="a-CMS_69-error" test="$intendedRecipient-Measure-CMS != 'MIPS_GROUP'   or ($intendedRecipient-Measure-CMS='MIPS_GROUP' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_GROUP", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_69). </sch:assert>
            <sch:assert id="a-CMS_85-error" test="$intendedRecipient-Measure-CMS != 'MIPS_VIRTUALGROUP' or ($intendedRecipient-Measure-CMS='MIPS_VIRTUALGROUP' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_VIRTUALGROUP", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_85). </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>