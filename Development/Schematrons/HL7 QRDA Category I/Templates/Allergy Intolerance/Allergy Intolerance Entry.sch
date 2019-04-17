<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Allergy-Intolerance-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Allergy-Intolerance-pattern-errors">
        <sch:rule id="Allergy-Intolerance-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28826-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3343-28826).</sch:assert>
            <sch:assert id="a-3343-28827-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3343-28827).</sch:assert>
            <sch:assert id="a-3343-28848-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28848).</sch:assert>
            <sch:assert id="a-3343-28816-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-28816) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.147" (CONF:3343-28828). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28829).</sch:assert>
            <sch:assert id="a-3343-28817-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28817).</sch:assert>
            <sch:assert id="a-3343-28819-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28819).</sch:assert>
            <sch:assert id="a-3343-28836-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28836).</sch:assert>
            <sch:assert id="a-3343-28820-error" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-28820) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:3343-28837). SHALL contain exactly one [1..1] participantRole (CONF:3343-28821).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy-Intolerance-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-28831-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28831).</sch:assert>
            <sch:assert id="a-3343-28832-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28832).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy-Intolerance-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-28834-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28834).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy-Intolerance-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:value[@xsi:type='CD']">
            <sch:assert id="a-3343-28849-error" test="@code='419199007'">This value SHALL contain exactly one [1..1] @code="419199007" Allergy to substance (CONF:3343-28849).</sch:assert>
            <sch:assert id="a-3343-28850-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-28850).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy-Intolerance-participant-participantRole-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:participant[@typeCode='CSM']/cda:participantRole">
            <sch:assert id="a-3343-28838-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:3343-28838).</sch:assert>
            <sch:assert id="a-3343-28822-error" test="count(cda:playingEntity)=1">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:3343-28822).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy-Intolerance-participant-participantRole-playingEntity-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:participant[@typeCode='CSM']/cda:participantRole[@classCode='MANU']/cda:playingEntity">
            <sch:assert id="a-3343-28839-error" test="@classCode='MMAT'">This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured Material (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:3343-28839).</sch:assert>
            <sch:assert id="a-3343-28840-error" test="count(cda:code)=1">This playingEntity SHALL contain exactly one [1..1] code (CONF:3343-28840).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>