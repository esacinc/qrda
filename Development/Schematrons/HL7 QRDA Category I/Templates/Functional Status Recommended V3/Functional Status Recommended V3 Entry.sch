<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:phase id="errors">
		<sch:active pattern="Functional_Status_Recommended-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Functional_Status_Recommended-pattern-errors">
		<sch:rule id="Functional_Status_Recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-27724-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27724).</sch:assert>
			<sch:assert id="a-2228-12814-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12814).</sch:assert>
			<sch:assert id="a-2228-12815-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27'][@extension='2016-02-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2228-12815) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.27" (CONF:2228-12816). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27072).</sch:assert>
			<sch:assert id="a-2228-27630-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:2228-27630)</sch:assert>
			<sch:assert id="a-2228-27348-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) = 1">SHALL contain exactly one [1..1] Author Participation author(identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27348).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Functional_Status_Recommended-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27'][@extension='2016-02-01']]/cda:code">
			<sch:assert id="a-2228-27631-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27631).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
