<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Intervention_Recommended_V3-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Intervention_Recommended_V3-pattern-errors">
		<sch:rule id="Intervention_Recommended_V3-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33']]">
			<sch:assert id="a-2228-27355-error" test="@classCode='ACT'">
				SHALL contain exactly one [1..1] @classCode='ACT' Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27355).
			</sch:assert>
			<sch:assert id="a-2228-13763-error" test="@moodCode='INT'">
				SHALL contain exactly one [1..1] @moodCode='INT' Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13763).			
			</sch:assert>
			<sch:assert id="a-2228-13764-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-13764) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.24.3.33' (CONF:2228-13765).
					SHALL contain exactly one [1..1] @extension='2016-02-01' (CONF:2228-26557).
			</sch:assert>
			<sch:assert id="a-2228-13767-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:2228-13767).
			</sch:assert>
			<sch:assert id="a-2228-27635-error" test="cda:code/@sdtc:valueSet">
				This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27635).			
			</sch:assert>
			<sch:assert id="a-2228-27349-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) = 1">
				SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27349).			
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
