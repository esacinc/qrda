<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Intolerance-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Device-Intolerance-pattern-errors">
        <sch:rule id="Device-Intolerance-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-28053-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28053). </sch:assert>
            <sch:assert id="a-2228-28054-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28054).  </sch:assert>
            <sch:assert id="a-2228-28055-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28055).</sch:assert>
            <sch:assert id="a-2228-12162-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12162) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.8" (CONF:2228-26940). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27034).</sch:assert>
            <sch:assert id="a-2228-12342-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12342). </sch:assert>
            <sch:assert id="a-2228-12170-error" test="count(cda:participant[@typeCode='PRD'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code[@sdtc:valueSet])=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12170) such that it SHALL contain exactly one [1..1] @typeCode="PRD" product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12171).  SHALL contain exactly one [1..1] participantRole (CONF:2228-12172). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12173). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12174). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12175). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12176). This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27585).       </sch:assert> 
        </sch:rule> 
        <sch:rule id="Device-Intolerance-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8'][@extension='2016-02-01']]/cda:value">
            <sch:assert id="a-2228-26936-error" test="@code='420134006'">This value SHALL contain exactly one [1..1] @code="420134006" propensity to adverse reactions (CONF:2228-26936).  </sch:assert>
            <sch:assert id="a-2228-26937-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26937).</sch:assert>
        </sch:rule>     
    </sch:pattern>
    
</sch:schema>