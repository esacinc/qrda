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
        <sch:rule id="QRDA_Category_III_Measure_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]">
            <sch:assert id="a-2233-711276-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711276) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.3" (CONF:2233-711277). SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711286).</sch:assert>
            <sch:assert id="a-2233-12801-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:2233-12802).</sch:assert>
            <sch:assert id="a-2233-17284-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:2233-17285). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2233-21171).</sch:assert>
            <sch:assert id="a-2233-12798-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-12798).</sch:assert>
            <sch:assert id="a-2233-12799-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:2233-12799).</sch:assert>
            <sch:assert id="a-2233-12800-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:2233-12800).</sch:assert>
            <sch:assert id="a-2233-711283-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2016-03-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:2233-711283) such that it SHALL contain exactly one [1..1] Measure Reference and Results (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.17:2016-03-01) (CONF:2233-711284).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Measure_CMS-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]/cda:code">
            <sch:assert id="a-2233-19230-error" test="@code='55186-1'">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-19230).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>