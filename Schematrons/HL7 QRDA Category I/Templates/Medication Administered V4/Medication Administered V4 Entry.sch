<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Administered-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Medication_Administered-pattern-errors">
		<sch:rule id="Medication_Administered-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-12444-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" Substance Administration (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-12444).</sch:assert>
			<sch:assert id="a-3343-12445-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12445).</sch:assert>
			<sch:assert id="a-3343-12446-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12446) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.42" (CONF:3343-12447). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27023).</sch:assert>
			<sch:assert id="a-3343-12452-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:3343-12452).	</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Administered-statuscode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2017-08-01']]/cda:statusCode">
			<sch:assert id="a-3343-13241-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-13241).</sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>