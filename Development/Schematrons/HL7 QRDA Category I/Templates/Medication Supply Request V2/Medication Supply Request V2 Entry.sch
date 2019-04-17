<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Supply_Request-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Medication_Supply_Request-pattern-errors">
		<sch:rule id="Medication_Supply_Request-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99'][@extension='2014-04-05']]">
			<sch:assert id="a-1140-28373-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-28373).</sch:assert>
			<sch:assert id="a-1140-13820-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-13820).</sch:assert>
			<sch:assert id="a-1140-13821-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99'][@extension='2014-04-05']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1140-13821) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.99" (CONF:1140-13822). SHALL contain exactly one [1..1] @extension="2014-04-05" (CONF:1140-28374).</sch:assert>
			<sch:assert id="a-1140-13829-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:1140-13829).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>