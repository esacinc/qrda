<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Intolerance_V3-pattern-errors" />
	</sch:phase>
	
	<sch:phase id="warnings">
		<sch:active pattern="Medication_Intolerance_V3-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Intolerance_V3-pattern-errors">
		<sch:rule id="Medication_Intolerance_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]">
			<sch:assert id="a-2228-14086-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14086).			
			</sch:assert>
			<sch:assert id="a-2228-14087-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14087).			
			</sch:assert>
			<sch:assert id="a-2228-28083-error" test="not(@negationInd)">
				SHALL NOT contain [0..0] @negationInd (CONF:2228-28083).			
			</sch:assert>
			<sch:assert id="a-2228-14088-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-14088) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.46" (CONF:2228-27418).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27032).
			</sch:assert>
			<sch:assert id="a-2228-14162-error" test="count(cda:value[@xsi:type='CD']) = 1">
				SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-14162).
			</sch:assert>
			<sch:assert id="a-2228-27980-error" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole)=1])=1">
				SHALL contain exactly one [1..1] participant (CONF:2228-27980) such that it
					SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-27984).
					SHALL contain exactly one [1..1] participantRole (CONF:2228-27981).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Intolerance_V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]/cda:value">
			<sch:assert id="a-2228-27419-error" test="@code='59037007'">
				This value SHALL contain exactly one [1..1] @code="59037007" Drug intolerance (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-27419).			
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Intolerance_V3-participantRole-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]/cda:participant/cda:participantRole">
			<sch:assert id="a-2228-27985-error" test="@classCode='MANU'">
				This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-27985).
			</sch:assert>
			<sch:assert id="a-2228-27982-error" test="count(cda:playingEntity)=1">
				This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:2228-27982).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Intolerance_V3-playingEntity-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]/cda:participant/cda:participantRole/cda:playingEntity">
			<sch:assert id="a-2228-27986-error" test="@classCode='MMAT'">
				This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:2228-27986).
			</sch:assert>
			<sch:assert id="a-2228-27983-error" test="count(cda:code)=1">
				This playingEntity SHALL contain exactly one [1..1] code (CONF:2228-27983).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Intolerance_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]/cda:participant/cda:participantRole/cda:playingEntity/cda:code">
			<sch:assert id="a-2228-27987-error" test="@sdtc:valueSet">
				This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27987).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Medication_Intolerance_V3-pattern-warnings">
		<sch:rule id="Medication_Intolerance_V3-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]">
			<sch:assert id="a-2228-14106-warning" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']])=1]) = 1">
				SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-14106) such that it
					SHALL contain exactly one [1..1] @typeCode="MFST" (CONF:2228-14107).
					SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-14108).
					SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27128).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
</sch:schema>