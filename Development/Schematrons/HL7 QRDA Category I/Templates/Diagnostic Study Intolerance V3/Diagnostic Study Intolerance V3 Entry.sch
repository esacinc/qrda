<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnostic-Study-Intolerance-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Diagnostic-Study-Intolerance-pattern-errors">
        <sch:rule id="Diagnostic-Study-Intolerance-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-11733-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11733). </sch:assert>
            <sch:assert id="a-2228-11734-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11734).</sch:assert>
            <sch:assert id="a-2228-11735-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11735) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.16" (CONF:2228-11736). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27015). </sch:assert>
            <sch:assert id="a-2228-11737-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-11737).</sch:assert>
            <sch:assert id="a-2228-14572-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14572). </sch:assert>
            <sch:assert id="a-2228-11745-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18' ][@extension='2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11745) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11746). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11747).  SHALL contain exactly one [1..1] Diagnostic Study Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.18:2016-02-01) (CONF:2228-27150). </sch:assert>     
        </sch:rule>        
        <sch:rule id="Diagnostic-Study-Intolerance-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16'][@extension='2016-02-01']]/cda:value">
            <sch:assert id="a-2228-16411-error" test="@code='102460003'">This value SHALL contain exactly one [1..1] @code="102460003" Decreased tolerance (CONF:2228-16411). </sch:assert>
            <sch:assert id="a-2228-28406-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CONF:2228-28406). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>