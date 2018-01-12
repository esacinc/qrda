<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Continuous_variable_measure_value-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Continuous_variable_measure_value-pattern-errors">
        <sch:rule id="Continuous_variable_measure_value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
            <sch:assert id="a-77-17569-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17569).</sch:assert>
            <sch:assert id="a-77-17570-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17570).</sch:assert>
            <sch:assert id="a-77-18096-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18096) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.2" (CONF:77-18097).</sch:assert>
            <sch:assert id="a-77-17571-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17571).</sch:assert>
            <sch:assert id="a-77-17572-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:77-17572).</sch:assert>
            <sch:assert id="a-77-18242-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode, which SHALL be selected from ValueSet ObservationMethodAggregate urn:oid:2.16.840.1.113883.1.11.20450 DYNAMIC (CONF:77-18242).</sch:assert>
            <sch:assert id="a-77-18243-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18243).</sch:assert>
        </sch:rule>
        <sch:rule id="Continuous_variable_measure_value-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference">
            <sch:assert id="a-77-18244-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18244).</sch:assert>
        </sch:rule>
        <sch:rule id="Continuous_variable_measure_value-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference/cda:externalObservation">
            <sch:assert id="a-77-18245-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18245).</sch:assert>
        </sch:rule>
        <sch:rule id="Continuous_variable_measure_value-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange">
            <sch:assert id="a-77-18390-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18390).</sch:assert>
        </sch:rule>
        <sch:rule id="Continuous_variable_measure_value-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange/cda:observationRange">
            <sch:assert id="a-77-18391-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:77-18391).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>