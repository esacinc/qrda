<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Measure_data-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Measure_data-pattern-errors">
        <sch:rule id="Measure_data-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]">
            <sch:assert id="a-3259-17615-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-17615).</sch:assert>
            <sch:assert id="a-3259-17616-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-17616).</sch:assert>
            <sch:assert id="a-3259-17912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:3259-17913). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21161).</sch:assert>
            <sch:assert id="a-3259-17617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-17617).</sch:assert>
            <sch:assert id="a-3259-18199-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18199).</sch:assert>
            <sch:assert id="a-3259-17618-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3259-17618).</sch:assert>
            <sch:assert id="a-3259-17619-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-17619) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:3259-17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-17911). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-17620).</sch:assert>
            <sch:assert id="a-3259-18239-error" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:3259-18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:3259-18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:3259-18241).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure_data-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]/cda:code">
            <sch:assert id="a-3259-18198-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3259-18198).</sch:assert>
            <sch:assert id="a-3259-21164-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3259-21164).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure_data-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]/cda:statusCode">
            <sch:assert id="a-3259-19555-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3259-19555).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure_data-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]/cda:value[@xsi:type='CD']">
            <sch:assert id="a-3259-21162-error" test="@code">This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet PopulationInclusionObservationType urn:oid:2.16.840.1.113883.1.11.20476 DYNAMIC (CONF:3259-21162).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>