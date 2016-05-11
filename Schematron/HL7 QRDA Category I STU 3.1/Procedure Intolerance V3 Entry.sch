<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Intolerance-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Intolerance-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Intolerance-pattern-errors">
        <sch:rule id="Procedure-Intolerance-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62']]">
            <sch:assert id="a-2228-11433-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11433).</sch:assert>
            <sch:assert id="a-2228-11434-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11434).</sch:assert>
            <sch:assert id="a-2228-11435-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11435) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.62" (CONF:2228-11436). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27020).</sch:assert>
            <sch:assert id="a-2228-11437-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-11437).</sch:assert>
            <sch:assert id="a-2228-14574-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14574).</sch:assert>
            <sch:assert id="a-2228-11601-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11601) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11602). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11603). SHALL contain exactly one [1..1] Procedure Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.64:2016-02-01) (CONF:2228-27148).</sch:assert>
          </sch:rule>
        
        <sch:rule id="Procedure-Intolerance-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62']]/cda:value[@xsi:type='CD']">
            <sch:assert id="a-2228-16421-error" test="@code='102460003'">This value SHALL contain exactly one [1..1] @code="102460003" Decreased tolerance (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16421). </sch:assert>
        </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="Procedure-Intolerance-pattern-warnings">
    </sch:pattern>
    
</sch:schema>