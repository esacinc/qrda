<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Allergy_status_observation-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Allergy_status_observation-pattern-errors">
        <sch:rule id="Allergy_status_observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]">
            <sch:assert id="a-1098-7318" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7318).</sch:assert>
            <sch:assert id="a-1098-7319" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7319).</sch:assert>
            <sch:assert id="a-1098-7317" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7317) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.28" (CONF:1098-10490).</sch:assert>
            <sch:assert id="a-1098-7320" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-7320).</sch:assert>
            <sch:assert id="a-1098-7321" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7321).</sch:assert>
            <sch:assert id="a-1098-7322" test="count(cda:value[@xsi:type='CE'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CE", where the code SHALL be selected from ValueSet Problem Status urn:oid:2.16.840.1.113883.3.88.12.80.68 DYNAMIC (CONF:1098-7322).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_status_observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]/cda:code">
            <sch:assert id="a-1098-19131" test="@code='33999-4'">This code SHALL contain exactly one [1..1] @code="33999-4" Status (CONF:1098-19131).</sch:assert>
            <sch:assert id="a-1098-32155" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32155).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_status_observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]/cda:statusCode">
            <sch:assert id="a-1098-19087" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19087).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>