<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III_Measure_CMS-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_III_Measure_CMS-pattern-errors">
        <sch:let name="intendedRecipient-Measure" value="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:id/@extension" />  
        <sch:rule id="QRDA_Category_III_Measure_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-06-01']]">
            <sch:assert id="a-4378-711276-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-711276) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.3" (CONF:4378-711277). SHALL contain exactly one [1..1] @extension="2018-06-01" (CONF:4378-711286).</sch:assert>
            <sch:assert id="a-4378-12801-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:4378-12802).</sch:assert>
            <sch:assert id="a-4378-17284-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:4378-17285). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:4378-711285).</sch:assert>
            <sch:assert id="a-4378-12798-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4378-12798).</sch:assert>
            <sch:assert id="a-4378-12799-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:4378-12799).</sch:assert>
            <sch:assert id="a-4378-12800-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:4378-12800).</sch:assert>
            <sch:assert id="a-4378-711283-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2018-06-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:4378-711283) such that it SHALL contain exactly one [1..1] Measure Reference and Results - CMS (V2.1) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.17:2018-06-01) (CONF:4378-711284).</sch:assert>
            <sch:assert id="a-378-711328-error" test="$intendedRecipient-Measure != 'CPCPLUS'   or ($intendedRecipient-Measure='CPCPLUS' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=1)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPCPLUS", then SHALL contain [1..1] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:4378-711328). </sch:assert>
            <sch:assert id="a-4378-711329-error" test="$intendedRecipient-Measure != 'MIPS_INDIV'   or ($intendedRecipient-Measure='MIPS_INDIV' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_INDIV", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:4378-711329). </sch:assert>
            <sch:assert id="a-4378-711330-error" test="$intendedRecipient-Measure != 'MIPS_GROUP'   or ($intendedRecipient-Measure='MIPS_GROUP' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_GROUP", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:4378-711330). </sch:assert>
            <sch:assert id="a-4378-711331-error" test="$intendedRecipient-Measure != 'MIPS_VIRTUALGROUP' or ($intendedRecipient-Measure='MIPS_VIRTUALGROUP' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_VIRTUALGROUP", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:4378-711331). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Measure_CMS-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-06-01']]/cda:code">
            <sch:assert id="a-4378-19230-error" test="@code='55186-1'">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4378-19230).</sch:assert>
            <sch:assert id="a-4378-711327-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4378-711327).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>