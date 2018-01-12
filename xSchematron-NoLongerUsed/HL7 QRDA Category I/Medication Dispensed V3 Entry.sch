<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Dispensed_V3-pattern-errors" />
	</sch:phase>

	<sch:pattern id="Medication_Dispensed_V3-pattern-errors">
		<sch:rule id="Medication_Dispensed_V3-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-27528-error" test="@classCode='SPLY'">
				SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27528).
			</sch:assert>
			<sch:assert id="a-2228-27529-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27529).
			</sch:assert>
			<sch:assert id="a-2228-13851-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-13851) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.45" (CONF:2228-13852).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26555).
			</sch:assert>
			<sch:assert id="a-2228-19440-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:2228-19440).
			</sch:assert>
			<sch:assert id="a-2228-13856-error" test="count(cda:effectiveTime[@xsi:type='IVL_TS']) = 1">
				SHALL contain exactly one [1..1] effectiveTime (CONF:2228-13856).
			</sch:assert>
			<sch:assert id="a-2228-28669-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139']) = 1">This template SHALL be contained by a Medication Dispensed Act (CONF:2228-28669).</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Dispensed_V3-statuscode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2016-02-01']]/cda:statusCode">
			<sch:assert id="a-2228-19441-error" test="@code='completed'">
				This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-19441).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Medication_Dispensed_V3-effectivetime-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2016-02-01']]/cda:effectiveTime[@xsi:type='IVL_TS']">
			<sch:assert id="a-2228-28555-error" test="count(cda:low) = 1">
				This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28555).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>