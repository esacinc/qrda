<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Laboratory_Test_Adverse_Event_V3-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Laboratory_Test_Adverse_Event_V3-pattern-errors">
		<sch:rule id="Laboratory_Test_Adverse_Event_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35']]">
			<sch:assert id="a-2228-14060-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-14060).
			</sch:assert>
			<sch:assert id="a-2228-14061-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-14061).
			</sch:assert>
			<sch:assert id="a-2228-14062-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-14062) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.35" (CONF:2228-14063).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27018).
			</sch:assert>
			<sch:assert id="a-2228-16416-error" test="count(cda:value[@xsi:type='CD']) = 1">
				SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16416).
			</sch:assert>
			<sch:assert id="a-2228-14072-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2016-02-01']])=1])=1">
				SHALL contain exactly one [1..1] entryRelationship (CONF:2228-14072) such that it
					SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-14073).
					SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-14074).
					SHALL contain exactly one [1..1] Laboratory Test Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.38:2016-02-01) (CONF:2228-27154).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Laboratory_Test_Adverse_Event_V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35']]/cda:value">
			<sch:assert id="a-2228-16417-error" test="@code='281647001'">
				This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16417)			
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
