<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Adverse-Event-V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Device-Adverse-Event-V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Device-Adverse-Event-V3-pattern-errors">
        <sch:rule id="Device-Adverse-Event-V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]">
            <sch:assert id="a-2228-28048-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28048). </sch:assert>
            <sch:assert id="a-2228-28047-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28047).  </sch:assert>
            <sch:assert id="a-2228-28049-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28049).</sch:assert>
            <sch:assert id="a-2228-12106-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12106) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.5" (CONF:2228-26942) SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27029).</sch:assert>
            <sch:assert id="a-2228-12111-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12111). </sch:assert>
            <sch:assert id="a-2228-12112-error" test="count(cda:participant[@typeCode='PRD'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode][count(cda:code[@sdtc:valueSet])=1])=1])=1])=1"> SHALL contain exactly one [1..1] participant (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12112) such that it SHALL contain exactly one [1..1] @typeCode="PRD" product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12113). SHALL contain exactly one [1..1] participantRole (CONF:2228-12114). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12115). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12116). This playingDevice SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12117). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12118). This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27582).      </sch:assert> 
            <sch:assert id="a-2228-27123-error" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85'][@extension='2014-12-01']])=1])=1"> SHALL contain exactly one [1..1] entryRelationship (CONF:2228-12119) such that it  SHALL contain exactly one [1..1] @typeCode="MFST" is manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12122). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-12123).  SHALL contain exactly one [1..1] templateId (CONF:1140-11332) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.85" (CONF:1140-11333). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-27008).  </sch:assert>
        </sch:rule>
 
         <sch:rule id="Device-Adverse-Event-V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]/cda:value">
            <sch:assert id="a-2228-12189-error" test="@code='420134006'">This value SHALL contain exactly one [1..1] @code="420134006" propensity to adverse reactions, which SHALL be selected from CodeSystem SNOMED CT (urn:oid:2.16.840.1.113883.6.96) (CONF:2228-12189). </sch:assert>
        </sch:rule>
 
       </sch:pattern>
    
    <sch:pattern id="Device-Adverse-Event-V3-pattern-warnings">
    </sch:pattern>
    
</sch:schema>