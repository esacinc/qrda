<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Allergy_intolerance_V2-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Allergy_intolerance_V2-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Allergy_intolerance_V2-pattern-errors">
        <sch:rule id="Allergy_intolerance_V2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
            <sch:assert id="a-1098-7379-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7379).</sch:assert>
            <sch:assert id="a-1098-7380-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7380).</sch:assert>
            <sch:assert id="a-1098-7381-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7381) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.7" (CONF:1098-10488). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32526).</sch:assert>
            <sch:assert id="a-1098-7382-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7382).</sch:assert>
            <sch:assert id="a-1098-15947-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-15947).</sch:assert>
            <sch:assert id="a-1098-19084-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-19084).</sch:assert>
            <sch:assert id="a-1098-7387-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7387).</sch:assert>
            <sch:assert id="a-1098-7390-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:1098-7390).</sch:assert>
            <sch:assert id="a-1098-7402-error" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole[@classCode='MANU'][count(cda:playingEntity[@classCode='MMAT'][count(cda:code)=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:1098-7402) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1098-7403). SHALL contain exactly one [1..1] participantRole (CONF:1098-7404). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-7405). This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-7406). This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured Material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1098-7407). This playingEntity SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Substance-Reactant for Intolerance urn:oid:2.16.840.1.113762.1.4.1010.1 DYNAMIC (CONF:1098-7419).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_intolerance_V2-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:code">
            <sch:assert id="a-1098-15948-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-15948).</sch:assert>
            <sch:assert id="a-1098-32153-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32153).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_intolerance_V2-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:statusCode">
            <sch:assert id="a-1098-19085-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19085).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_intolerance_V2-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:effectiveTime">
            <sch:assert id="a-1098-31538-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-31538).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Allergy_intolerance_V2-pattern-warnings">
        <sch:rule id="Allergy_intolerance_V2-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
            <sch:assert id="a-1098-31143-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31143).</sch:assert>
            <sch:assert id="a-1098-7447-warning" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9' and @extension = '2014-06-09']])=1]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:1098-7447) such that it SHALL contain exactly one [1..1] @typeCode="MFST" Is Manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7907). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-7449). SHALL contain exactly one [1..1] Reaction Observation (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:1098-15955).</sch:assert>
            <sch:assert id="a-1098-9961-warning" test="not(count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8' and @extension = '2014-06-09']])=1])=1)">SHOULD NOT contain zero or one [0..1] entryRelationship (CONF:1098-9961) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-9962). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-9964). SHALL contain exactly one [1..1] Severity Observation (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.8:2014-06-09) (CONF:1098-15956).</sch:assert>
            <sch:assert id="a-1098-32910-warning" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-32910) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32911). SHALL contain exactly one [1..1] Criticality Observation  (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.145) (CONF:1098-32913).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>