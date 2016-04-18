<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Allergy-V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Device-Allergy-V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Device-Allergy-V3-pattern-errors">
        <sch:rule id="Device-Allergy-V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]">
            <sch:assert id="a-2228-28437" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28437). </sch:assert>
            <sch:assert id="a-2228-28438" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28438).  </sch:assert>
            <sch:assert id="a-2228-28439" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28439).</sch:assert>
            <sch:assert id="a-2228-12134" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12134) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.6" (CONF:2228-26941).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27033). </sch:assert>
            <sch:assert id="a-2228-12140" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12140).  </sch:assert>
            <sch:assert id="a-2228-12141" test="count(cda:participant[@typeCode='PRD'][count(cda:participantRole)=1])=1"> SHALL contain exactly one [1..1] participant (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12141) such that it  SHALL contain exactly one [1..1] @typeCode="PRD" product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12142).  SHALL contain exactly one [1..1] participantRole (CONF:2228-12143).  </sch:assert> 
            <sch:assert id="a-2228-12148" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85'][@extension='2014-12-01']])=1])=1"> SHALL contain exactly one [1..1] entryRelationship (CONF:2228-12148) such that it  SHALL contain exactly one [1..1] @typeCode="MFST" is manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12149). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-12150). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27127).  </sch:assert>
        </sch:rule>
        
        <sch:rule id="Device-Allergy-V3-participantRole-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]/cda:participant[@typeCode='PRD']/cda:participantRole">
            <sch:assert id="a-2228-12144" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12144).</sch:assert>
            <sch:assert id="a-2228-12145" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12145). </sch:assert>
        </sch:rule>
 
        <sch:rule id="Device-Allergy-V3-participantRole-playingDevice-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]/cda:participant[@typeCode='PRD']/cda:participantRole[@classCode='MANU']/cda:playingDevice">
            <sch:assert id="a-2228-12146" test="@classCode='DEV'">This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12146).</sch:assert>
            <sch:assert id="a-2228-12147" test="count(cda:code)=1">This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12147).  </sch:assert>
        </sch:rule>
 
        <sch:rule id="Device-Allergy-V3-participantRole-playingDevice-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]/cda:participant[@typeCode='PRD']/cda:participantRole[@classCode='MANU']/cda:playingDevice/cda:code">
            <sch:assert id="a-2228-27583" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27583). </sch:assert>        
        </sch:rule>
        
   
       </sch:pattern>
    
    <sch:pattern id="Device-Allergy-V3-pattern-warnings">
    </sch:pattern>
    
</sch:schema>