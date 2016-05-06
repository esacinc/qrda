<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Patient-data-section-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Patient-data-section-pattern-errors">
        <sch:rule id="Patient-data-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]">
            <sch:assert id="a-67-12794-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4'])=1">SHALL contain exactly one [1..1] templateId (CONF:12794) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.4" (CONF:12795).</sch:assert>
            <sch:assert id="a-67-3865-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3865).</sch:assert>
            <sch:assert id="a-67-3866-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='patient data'])=1">SHALL contain exactly one [1..1] title="Patient Data" (CONF:3866).</sch:assert>
            <sch:assert id="a-67-3867-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:3867).</sch:assert>
            <sch:assert id="a-67-14567-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:14567).</sch:assert>
        </sch:rule>
        <sch:rule id="Patient-data-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]/cda:code">
            <sch:assert id="a-67-26548-error" test="@code='55188-7'">This code SHALL contain exactly one [1..1] @code="55188-7" (CONF:26548).</sch:assert>
            <sch:assert id="a-67-27013-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:27013).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>