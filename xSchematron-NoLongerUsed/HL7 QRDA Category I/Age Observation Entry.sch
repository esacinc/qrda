<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Age-observation-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Age-observation-pattern-errors">
        <sch:rule id="Age-observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]">
            <sch:assert id="a-81-7613-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-7613).</sch:assert>
            <sch:assert id="a-81-7614-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-7614).</sch:assert>
            <sch:assert id="a-81-7899-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7899) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.31" (CONF:81-10487).</sch:assert>
            <sch:assert id="a-81-7615-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-7615).</sch:assert>
            <sch:assert id="a-81-15965-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-15965).</sch:assert>
            <sch:assert id="a-81-7617-error" test="count(cda:value[@xsi:type='PQ'])=1">SHALL contain exactly one [1..1] value with @xsi:type="PQ" (CONF:81-7617).</sch:assert>
        </sch:rule>
        <sch:rule id="Age-observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]/cda:code">
            <sch:assert id="a-81-16776-error" test="@code='445518008'">This code SHALL contain exactly one [1..1] @code="445518008" Age At Onset (CONF:81-16776).</sch:assert>
            <sch:assert id="a-81-26499-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:81-26499).</sch:assert>
        </sch:rule>
        <sch:rule id="Age-observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]/cda:statusCode">
            <sch:assert id="a-81-15966-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-15966).</sch:assert>
        </sch:rule>
        <sch:rule id="Age-observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]/cda:value[@xsi:type='PQ']">
            <sch:assert id="a-81-7618-error" test="@unit">This value SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet AgePQ_UCUM urn:oid:2.16.840.1.113883.11.20.9.21 DYNAMIC (CONF:81-7618).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>