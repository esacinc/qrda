<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Substance-Device-Allergy-Intolerance-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Substance-Device-Allergy-Intolerance-Observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Substance-Device-Allergy-Intolerance-Observation-pattern-errors">
        <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]">
            <sch:assert id="a-1098-16303-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-16303).</sch:assert>
            <sch:assert id="a-1098-16304-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-16304).</sch:assert>
            <sch:assert id="a-1098-16305-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-16305) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.90" (CONF:1098-16306).  SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32527). </sch:assert>
            <sch:assert id="a-1098-16307-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-16307).</sch:assert>
            <sch:assert id="a-1098-16345-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-16345).</sch:assert>
            <sch:assert id="a-1098-16308-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-16308).</sch:assert>
            <sch:assert id="a-1098-16309-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-16309).</sch:assert>
            <sch:assert id="a-1098-16312-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1098-16312).</sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]/cda:code">
            <sch:assert id="a-1098-16346-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-16346).</sch:assert>
            <sch:assert id="a-1098-32171-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32171).</sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]/cda:statusCode">
            <sch:assert id="a-1098-26354v" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-26354).</sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]/cda:effectiveTime">
            <sch:assert id="a-1098-31536-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-31536).</sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]/cda:value">
            <sch:assert id="a-1098-16317-error" test="@code">This value SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:1098-16317).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Substance-Device-Allergy-Intolerance-Observation-pattern-warnings">
        <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]">
            <sch:assert id="a-1098-31144-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31144). </sch:assert>
            <sch:assert id="a-1098-16318-warning" test="count(cda:participant[@typeCode='CSM']  [count(cda:participantRole[@classCode='MANU']  [count(cda:playingEntity[@classCode='MMAT']  [count(cda:code)=1])=1])=1])&gt;=1">SHOULD contain zero or more [0..*] participant (CONF:1098-16318) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1098-16319). SHALL contain exactly one [1..1] participantRole (CONF:1098-16320). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-16321). This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-16322). This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured Material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1098-16323).  This playingEntity SHALL contain exactly one [1..1] code, which MAY be selected from ValueSet Substance-Reactant for Intolerance urn:oid:2.16.840.1.113762.1.4.1010.1 DYNAMIC (CONF:1098-16324). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>