<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Assessment_scale_observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Assessment_scale_observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Assessment_scale_observation-pattern-errors">
        <sch:rule id="Assessment_scale_observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]">
            <sch:assert id="a-81-14434" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:14434).</sch:assert>
            <sch:assert id="a-81-14435" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:14435).</sch:assert>
            <sch:assert id="a-81-14436" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69'])=1">SHALL contain exactly one [1..1] templateId (CONF:14436) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.69" (CONF:14437).</sch:assert>
            <sch:assert id="a-81-14438" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:14438).</sch:assert>
            <sch:assert id="a-81-14439" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:14439).</sch:assert>
            <sch:assert id="a-81-14444" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:14444).</sch:assert>
            <sch:assert id="a-81-14445" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:14445).</sch:assert>
            <sch:assert id="a-81-14450" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:14450).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]/cda:statusCode">
            <sch:assert id="a-81-19088" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:19088).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_observation-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]/cda:referenceRange">
            <sch:assert id="a-81-16800" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:16800).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_observation-referenceRange-observationRange-text-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]/cda:referenceRange/cda:observationRange/cda:text/cda:reference[@value]">
            <sch:assert id="a-81-16804" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:16804).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Assessment_scale_observation-pattern-warnings">
        <sch:rule id="Assessment_scale_observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]">
            <sch:assert id="a-81-14451" test="count(cda:entryRelationship[@typeCode='COMP'][cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:14451) such that it SHALL contain exactly one [1..1] @typeCode="COMP" has component (CONF:16741). SHALL contain exactly one [1..1] Assessment Scale Supporting Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.86) (CONF:16742).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_observation-code-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]/cda:code">
            <sch:assert id="a-81-14440" test="@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.6.96'">SHOULD be from LOINC (CodeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) identifying the assessment scale (CONF:14440).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_observation-referenceRange-observationRange-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]/cda:referenceRange/cda:observationRange">
            <sch:assert id="a-81-16801" test="count(cda:text)=1">This observationRange SHOULD contain zero or one [0..1] text (CONF:16801).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_scale_observation-referenceRange-observationRange-text-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]/cda:referenceRange/cda:observationRange/cda:text">
            <sch:assert id="a-81-16802" test="count(cda:reference)=1">The text, if present, SHOULD contain zero or one [0..1] reference (CONF:16802).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>