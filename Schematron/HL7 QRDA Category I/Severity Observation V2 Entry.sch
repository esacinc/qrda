<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Severity-Observation-pattern-errors" />
    </sch:phase>

    <sch:pattern id="Severity-Observation-pattern-errors">
        <sch:rule id="Severity-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09']]">
            <sch:assert id="a-1098-7345-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7345). </sch:assert>
            <sch:assert id="a-1098-7346-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7346). </sch:assert>
            <sch:assert id="a-1098-7347-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7347) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.8" (CONF:1098-10525). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32577).</sch:assert>
            <sch:assert id="a-1098-19168-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19168). </sch:assert>
            <sch:assert id="a-1098-7352-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] code (CONF:1098-19168).  </sch:assert>
            <sch:assert id="a-1098-7356-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem Severity urn:oid:2.16.840.1.113883.3.88.12.3221.6.8 DYNAMIC (CONF:1098-7356).  </sch:assert>
        </sch:rule>
        <sch:rule id="Severity-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09']]/cda:code">
            <sch:assert id="a-1098-19169-error" test="@code='SEV'">This code SHALL contain exactly one [1..1] @code="SEV" Severity (CONF:1098-19169). </sch:assert>
            <sch:assert id="a-1098-32170-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32170). </sch:assert>
        </sch:rule>
        <sch:rule id="Severity-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09']]/cda:statusCode">
            <sch:assert id="a-1098-19115-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19115). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>