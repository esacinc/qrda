<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Assessment_scale_supporting_observation-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Assessment_scale_supporting_observation-pattern-errors">
        <sch:rule id="Assessment_scale_supporting_observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]">
            <sch:assert id="a-81-16715-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-16715).</sch:assert>
            <sch:assert id="a-81-16716-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-16716).</sch:assert>
            <sch:assert id="a-81-16722-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-16722) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.86" (CONF:81-16723).</sch:assert>
            <sch:assert id="a-81-16724-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-16724).</sch:assert>
            <sch:assert id="a-81-19178-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19178).</sch:assert>
            <sch:assert id="a-81-16720-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-16720).</sch:assert>
            <sch:assert id="a-81-16754-error" test="count(cda:value) &gt; 0">SHALL contain at least one [1..*] value (CONF:81-16754).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_supporting_observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]/cda:code">
            <sch:assert id="a-81-19179-error" test="@code">This code SHALL contain exactly one [1..1] @code (CONF:81-19179).</sch:assert>
            <sch:assert id="a-81-19180-error" test="@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.6.96'">Such that the @code SHALL be from LOINC (CodeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) and represents components of the scale (CONF:81-19180).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_supporting_observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]/cda:statusCode">
            <sch:assert id="a-81-19089-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19089).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>