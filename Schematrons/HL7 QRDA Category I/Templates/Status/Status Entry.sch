<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Status-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Status-pattern-errors">
        <sch:rule id="Status-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]">
            <sch:assert id="a-67-11879-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-11879).</sch:assert>
            <sch:assert id="a-67-11880-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-11880).</sch:assert>
            <sch:assert id="a-67-11881-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-11881) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.93" (CONF:67-11882).</sch:assert>
            <sch:assert id="a-67-11884-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:67-11884).</sch:assert>
            <sch:assert id="a-67-11885-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-11885).</sch:assert>
            <sch:assert id="a-67-11887-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:67-11887).</sch:assert>
         </sch:rule>
        <sch:rule id="Status-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]/cda:code">
            <sch:assert id="a-67-11886-error" test="@code='33999-4'">This code SHALL contain exactly one [1..1] @code="33999-4" status (CONF:67-11886).</sch:assert>
            <sch:assert id="a-67-27011-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27011).</sch:assert>
        </sch:rule>
     </sch:pattern>
    
</sch:schema>