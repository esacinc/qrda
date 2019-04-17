<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Aggregate_count-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Aggregate_count-pattern-errors">
        <sch:rule id="Aggregate_count-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
            <sch:assert id="a-77-17563-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17563).</sch:assert>
            <sch:assert id="a-77-17564-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17564).</sch:assert>
            <sch:assert id="a-77-17565-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:77-17565) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.3" (CONF:77-18095).</sch:assert>
            <sch:assert id="a-77-17566-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17566).</sch:assert>
            <sch:assert id="a-77-17567-error" test="count(cda:value[@xsi:type='INT'])=1">SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-17567).</sch:assert>
            <sch:assert id="a-77-19509-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode (CONF:77-19509).</sch:assert>
        </sch:rule>
        <sch:rule id="Aggregate_count-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:code">
            <sch:assert id="a-77-19508-error" test="@code='MSRAGG'">This code SHALL contain exactly one [1..1] @code="MSRAGG" rate aggregation (CONF:77-19508).</sch:assert>
            <sch:assert id="a-77-21160-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21160).</sch:assert>
        </sch:rule>
        <sch:rule id="Aggregate_count-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:value[@xsi:type='INT']">
            <sch:assert id="a-77-17568-error" test="@value">This value SHALL contain exactly one [1..1] @value (CONF:77-17568).</sch:assert>
        </sch:rule>
        <sch:rule id="Aggregate_count-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:methodCode">
            <sch:assert id="a-77-19510-error" test="@code='COUNT'">This methodCode SHALL contain exactly one [1..1] @code="COUNT" Count (CONF:77-19510).</sch:assert>
            <sch:assert id="a-77-21161-error" test="@codeSystem='2.16.840.1.113883.5.84'">This methodCode SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.84" (CodeSystem: ObservationMethod urn:oid:2.16.840.1.113883.5.84) (CONF:77-21161).</sch:assert>
        </sch:rule>
        <sch:rule id="Aggregate_count-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange">
            <sch:assert id="a-77-18393-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18393).</sch:assert>
        </sch:rule>
        <sch:rule id="Aggregate_count-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange/cda:observationRange">
            <sch:assert id="a-77-18394-error" test="count(cda:value[@xsi:type='INT'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-18394).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>