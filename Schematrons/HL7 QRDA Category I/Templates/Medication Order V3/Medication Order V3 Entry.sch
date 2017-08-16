<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Order-pattern-errors" />
	</sch:phase>
	
	<sch:phase id="warnings">
		<sch:active pattern="Medication_Order-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Order-pattern-errors">
		<sch:rule id="Medication_Order-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-27377-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27377).</sch:assert>
			<sch:assert id="a-2228-12639-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12639).	</sch:assert>
			<sch:assert id="a-2228-12585-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2016-02-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2228-12585) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.47" (CONF:2228-12586). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27089).</sch:assert>
			<sch:assert id="a-2228-27740-error" test="count(cda:effectiveTime[count(cda:low)=1]) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-27740) such that it SHALL contain exactly one [1..1] low (CONF:2228-27742).</sch:assert>
			<sch:assert id="a-2228-27741-error" test="count(cda:effectiveTime[count(cda:period)=1]) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-27741) such that it SHALL contain exactly one [1..1] period (CONF:2228-27744).</sch:assert>
			<sch:assert id="a-2228-27745-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27745).</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Order-may-routeCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2016-02-01']]/cda:routeCode/cda:translation">
			<sch:assert id="a-2228-27737-error" test="@sdtc:valueSet">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27737).</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Medication_Order-pattern-warnings">
		<sch:rule id="Medication_Order-routeCode-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2016-02-01']]/cda:routeCode">
			<sch:assert id="a-2228-27736-warning" test="@sdtc:valueSet">The routeCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27736).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>