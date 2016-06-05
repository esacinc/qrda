<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />

	<sch:phase id="errors">
		<sch:active pattern="Medication_Active_V3-pattern-errors" />
	</sch:phase>
	
	<sch:phase id="warnings">
		<sch:active pattern="Medication_Active_V3-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Active_V3-pattern-errors">
		<sch:rule id="Medication_Active_V3-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]">
			<sch:assert id="a-2228-28656-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode='EVN' (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28656).
			</sch:assert>
			<sch:assert id="a-2228-28079-error" test="not(@negationInd)">
				SHALL NOT contain [0..0] @negationInd (CONF:2228-28079).
			</sch:assert>
			<sch:assert id="a-2228-28651-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-28651) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.24.3.41' (CONF:2228-28653).
					SHALL contain exactly one [1..1] @extension='2016-02-01' (CONF:2228-28654).
			</sch:assert>
			<sch:assert id="a-2228-28652-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:2228-28652).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Active_V3-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]/cda:statusCode">
			<sch:assert id="a-2228-28655-error" test="@code='active'">
				This statusCode SHALL contain exactly one [1..1] @code='active' (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28655).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Active_V3-may-translation-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]/cda:routeCode/cda:translation">
			<sch:assert id="a-2228-27645-error" test="@sdtc:valueSet">
				The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27645).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Medication_Active_V3-pattern-warnings">
		<sch:rule id="Medication_Active_V3-routeCode-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]/cda:routeCode">
			<sch:assert id="a-2228-27644-error" test="@sdtc:valueSet">
				The routeCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27644).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>