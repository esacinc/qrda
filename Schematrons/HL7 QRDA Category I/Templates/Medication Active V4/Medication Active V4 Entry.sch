<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />

	<sch:phase id="errors">
		<sch:active pattern="Medication_Active-pattern-errors" />
	</sch:phase>
	
	
	<sch:pattern id="Medication_Active-pattern-errors">
		
		<sch:rule id="Medication_Active-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-28861-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28861).</sch:assert>
			<sch:assert id="a-3343-28079-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28079).</sch:assert>
			<sch:assert id="a-3343-28858-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2017-08-01']) = 1"> SHALL contain exactly one [1..1] templateId (CONF:3343-28858) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.41" (CONF:3343-28860). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28654).</sch:assert>
			<sch:assert id="a-3343-28859-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28859).</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Active-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2017-08-01']]/cda:statusCode">
			<sch:assert id="a-3343-28655-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28655).</sch:assert>
		</sch:rule>

	</sch:pattern>
	
</sch:schema>