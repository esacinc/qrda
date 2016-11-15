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
    
    <sch:pattern id="Device-Allergy-V3-pattern-errors">
        <sch:rule id="Device-Allergy-V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-28437-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28437). </sch:assert>
            <sch:assert id="a-2228-28438-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28438).  </sch:assert>
            <sch:assert id="a-2228-28439-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28439).</sch:assert>
            <sch:assert id="a-2228-12134-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12134) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.6" (CONF:2228-26941).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27033). </sch:assert>
            <sch:assert id="a-2228-12140-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-12140).  </sch:assert>
            <sch:assert id="a-2228-12141-error" test="count(cda:participant[@typeCode='PRD'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code[@sdtc:valueSet])=1])=1])=1])=1"> SHALL contain exactly one [1..1] participant (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2228-12141) such that it  SHALL contain exactly one [1..1] @typeCode="PRD" product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12142). SHALL contain exactly one [1..1] participantRole (CONF:2228-12143). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12144). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12145). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12146). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12147). This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27583).        </sch:assert> 
            <sch:assert id="a-2228-12148-error" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85'][@extension='2014-12-01']])=1])=1"> SHALL contain exactly one [1..1] entryRelationship (CONF:2228-12148) such that it  SHALL contain exactly one [1..1] @typeCode="MFST" is manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12149). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-12150). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27127).  </sch:assert>
        </sch:rule>      
        <sch:rule id="Device-Allergy-V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6'][@extension='2016-02-01']]/cda:value">
            <sch:assert id="a-2228-12188-error" test="@code='419199007'">This value SHALL contain exactly one [1..1] @code="419199007" allergy to substance (CONF:2228-12188). </sch:assert>
            <sch:assert id="a-2228-28440-error" test="@codeSystem">This value SHALL contain exactly one [1..1] @codeSystem (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28440).  </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>