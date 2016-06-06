<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III_Reporting_Parameters_CMS-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_III_Reporting_Parameters_CMS-pattern-errors">
        <sch:rule id="QRDA_Category_III_Reporting_Parameters_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6']]">
            <sch:assert id="a-2233-711278-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6'][@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711278) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.6" (CONF:2233-711279). SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711306).</sch:assert>
            <sch:assert id="a-2233-14611-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-14611) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.1" (CONF:2233-14612).</sch:assert>
            <sch:assert id="a-2233-18323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-18323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.2" (CONF:2233-18324).</sch:assert>
            <sch:assert id="a-2233-18191-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-18191).</sch:assert>
            <sch:assert id="a-2233-4142-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='reporting parameters'])=1">SHALL contain exactly one [1..1] title="Reporting Parameters" (CONF:2233-4142).</sch:assert>
            <sch:assert id="a-2233-4143-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:2233-4143).</sch:assert>
            <sch:assert id="a-2233-711303-error" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:2233-711303) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-711304). SHALL contain exactly one [1..1] Reporting Parameters Act (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.23:2016-03-01) (CONF:2233-711175).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Reporting_Parameters_CMS-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]/cda:code">
            <sch:assert id="a-2233-19229-error" test="@code='55187-9'">This code SHALL contain exactly one [1..1] @code="55187-9" Reporting Parameters (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-19229).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>