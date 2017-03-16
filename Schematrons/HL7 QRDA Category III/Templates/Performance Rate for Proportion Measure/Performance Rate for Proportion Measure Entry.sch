<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Performance_Rate_for_Proportion_Measure-pattern-errors" />
    </sch:phase>
 
    <sch:pattern id="Performance_Rate_for_Proportion_Measure-pattern-errors">
        <sch:rule id="Performance_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]">
            <sch:assert id="a-77-18395-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18395).</sch:assert>
            <sch:assert id="a-77-18396-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18396).</sch:assert>
            <sch:assert id="a-77-19649-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:77-19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:77-19650).</sch:assert>
            <sch:assert id="a-77-18397-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18397).</sch:assert>
            <sch:assert id="a-77-18421-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18421).</sch:assert>
            <sch:assert id="a-77-18399-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18399).</sch:assert>
         </sch:rule>
        
        <sch:rule id="Performance_Rate_for_Proportion_Measure-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:code">
            <sch:assert id="a-77-18398-error" test="@code='72510-1'">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:77-18398).</sch:assert>
            <sch:assert id="a-77-21170-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21170).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Performance_Rate_for_Proportion_Measure-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:statusCode">
            <sch:assert id="a-77-18422-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18422).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference">
            <sch:assert id="a-77-19652-error" test="@typeCode='REFR'">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:77-19652).</sch:assert>
            <sch:assert id="a-77-19653-error" test="count(cda:externalObservation)=1">The reference, if present, SHALL contain exactly one [1..1] externalObservation (CONF:77-19653).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation">
            <sch:assert id="a-77-19654-error" test="@classCode">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:77-19654).</sch:assert>
            <sch:assert id="a-77-19657-error" test="count(cda:code)=1">This externalObservation SHALL contain exactly one [1..1] code (CONF:77-19657).</sch:assert>
            <sch:assert id="a-77-19655-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-19655).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-id-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation/cda:id">
            <sch:assert id="a-77-19656-error" test="@root">This id SHALL contain exactly one [1..1] @root (CONF:77-19656).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation/cda:code">
            <sch:assert id="a-77-19658-error" test="@code='NUMER'">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:77-19658).</sch:assert>
            <sch:assert id="a-77-21165-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21165).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:referenceRange">
            <sch:assert id="a-77-18401-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18401).</sch:assert>
         </sch:rule>

        <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:referenceRange/cda:observationRange">
            <sch:assert id="a-77-18402-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18402).</sch:assert>
        </sch:rule>
    </sch:pattern>
             
</sch:schema>