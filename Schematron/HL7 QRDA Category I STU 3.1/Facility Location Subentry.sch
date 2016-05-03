<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Facility-Location-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Facility-Location-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Facility-Location-pattern-errors">
        <sch:rule id="Facility-Location-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]">
            <sch:assert id="a-67-13374" test="@typeCode='LOC'">SHALL contain exactly one [1..1] @typeCode="LOC" location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:67-13374).</sch:assert>
            <sch:assert id="a-67-13375" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-13375) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.100" (CONF:67-13376).</sch:assert>
            <sch:assert id="a-67-13371" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:67-13371).</sch:assert>
            <sch:assert id="a-67-13372" test="count(cda:participantRole)=1">SHALL contain exactly one [1..1] participantRole (CONF:67-13372).</sch:assert>
         </sch:rule>
        
        <sch:rule id="Facility-Location-participantRole-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:participantRole">
            <sch:assert id="a-67-13373" test="@classCode='SDLOC'">This participantRole SHALL contain exactly one [1..1] @classCode="SDLOC" service delivery location (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:67-13373).</sch:assert>
            <sch:assert id="a-67-13378" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:67-13378).</sch:assert>
          </sch:rule>
 
        <sch:rule id="Facility-Location-participantRole-playingEntity-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:participantRole/cda:playingEntity">
            <sch:assert id="a-67-13382" test="@classCode='PLC'">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" place (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:67-13382).</sch:assert>
        </sch:rule>
            
        <sch:rule id="Facility-Location-time-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:time">
            <sch:assert id="a-67-13384" test="count(cda:low)=1">This time SHALL contain exactly one [1..1] low (CONF:67-13384).</sch:assert>
            <sch:assert id="a-67-13385" test="count(cda:high)=1">This time SHALL contain exactly one [1..1] high (CONF:67-13385).</sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    <sch:pattern id="Facility-Location-pattern-warnings">
        <sch:rule id="Facility-Location-participantRole-warnings" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:participantRole">
            <sch:assert id="a-67-13379" test="count(cda:addr)=1">This participantRole SHOULD contain zero or more [0..*] addr (CONF:13379). </sch:assert>
            <sch:assert id="a-67-13380" test="count(cda:telecom)=1">This participantRole SHOULD contain zero or more [0..*] telecom (CONF:13380). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>