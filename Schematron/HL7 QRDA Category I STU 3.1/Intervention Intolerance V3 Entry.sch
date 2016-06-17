<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Intervention_Intolerance_V3-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Intervention_Intolerance_V3-pattern-errors">
		<sch:rule id="Intervention_Intolerance_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-13657-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-13657).			
			</sch:assert>
			<sch:assert id="a-2228-13658-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13658).
			</sch:assert>
			<sch:assert id="a-2228-13659-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-13659) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.30" (CONF:2228-13660).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27017).
			</sch:assert>
			<sch:assert id="a-2228-13661-error" test="count(cda:id) = 1">
				SHALL contain exactly one [1..1] id (CONF:2228-13661).			
			</sch:assert>
			<sch:assert id="a-2228-16414-error" test="cda:value[@xsi:type='CD']">
				SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16414).			
			</sch:assert>
			<sch:assert id="a-2228-13679-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][@extension='2016-02-01']])=1])=1">
				SHALL contain exactly one [1..1] entryRelationship (CONF:2228-13679) such that it
					SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-13680).
					SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-13681).
					SHALL contain exactly one [1..1] Intervention Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.32:2016-02-01) (CONF:2228-13683).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Intervention_Intolerance_V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30'][@extension='2016-02-01']]/value">
			<sch:assert id="a-2228-16415-error" test="@code='102460003'">
				This value SHALL contain exactly one [1..1] @code="102460003" Decreased tolerance (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16415).			
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
