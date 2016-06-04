<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Allergy_V3-pattern-errors" />
	</sch:phase>

	<sch:phase id="warnings">
		<sch:active pattern="Medication_Allergy_V3-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Allergy_V3-pattern-errors">
		<sch:rule id="Medication_Allergy_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]">
			<sch:assert id="a-2228-14136-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode='OBS' (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14136).
			</sch:assert>
			<sch:assert id="a-2228-14137-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode='EVN' (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14137).
			</sch:assert>
			<sch:assert id="a-2228-14138-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-14138) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.24.3.44' (CONF:2228-14139).
					SHALL contain exactly one [1..1] @extension='2016-02-01' (CONF:2228-27031).
			</sch:assert>
			<sch:assert id="a-2228-14159-error" test="count(cda:value[@xsi:type='CD']) = 1">
				SHALL contain exactly one [1..1] value with @xsi:type='CD' (CONF:2228-14159).
			</sch:assert>
			<sch:assert id="a-2228-27972-error" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole[@classCode='MANU'][count(cda:playingEntity[@classCode='MMAT'][count(cda:code[@sdtc:valueSet])=1])=1])=1]) = 1">
				SHALL contain exactly one [1..1] participant (CONF:2228-27972) such that it
					SHALL contain exactly one [1..1] @typeCode='CSM' Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-27976).
					SHALL contain exactly one [1..1] participantRole (CONF:2228-27973).
						This participantRole SHALL contain exactly one [1..1] @classCode='MANU' Manufactured product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-27977).
						This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:2228-27974).
							This playingEntity SHALL contain exactly one [1..1] @classCode='MMAT' Manufactured material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:2228-27978).
							This playingEntity SHALL contain exactly one [1..1] code (CONF:2228-27975).
								This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27979).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Allergy_V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]/cda:value[@xsi:type='CD']">
			<sch:assert id="a-2228-14160-error" test="@code='416098002'">
				This value SHALL contain exactly one [1..1] @code='416098002' Drug allergy (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-14160).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Medication_Allergy_V3-pattern-warnings">
		<sch:rule id="Medication_Allergy_V3-warning" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]">
			<sch:assert id="a-2228-14155-warning" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85'])=1])=1]) = 1">
				SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-14155) such that it
					SHALL contain exactly one [1..1] @typeCode='MFST' (CONF:2228-14156).
					SHALL contain exactly one [1..1] @inversionInd='true' (CONF:2228-14157).
					SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-27125).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>