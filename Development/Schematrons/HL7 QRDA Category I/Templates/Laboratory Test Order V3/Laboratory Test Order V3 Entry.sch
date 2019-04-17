<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Laboratory_Test_Order_V3-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Laboratory_Test_Order_V3-pattern-errors">
		<sch:rule id="Laboratory_Test_Order_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-27417-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27417).	
			</sch:assert>
			<sch:assert id="a-2228-11953-error" test="@moodCode='RQO'">
				SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11953).
			</sch:assert>
			<sch:assert id="a-2228-11954-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-11954) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.37" (CONF:2228-11955).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27075).
			</sch:assert>
			<sch:assert id="a-2228-11957-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:2228-11957).
			</sch:assert>
			<sch:assert id="a-2228-27344-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">
				SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27344).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Laboratory_Test_Order_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2016-02-01']]/cda:code">
			<sch:assert id="a-2228-27636-error" test="@sdtc:valueSet">
				This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27636).
			</sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>
