<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Physical_Exam_Order_V3-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Physical_Exam_Order_V3-pattern-errors">
		<sch:rule id="Physical_Exam_Order_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]">
			<sch:assert id="a-2228-27550-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode='OBS' Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27550).			
			</sch:assert>
			<sch:assert id="a-2228-12685-error" test="@moodCode='RQO'">
				SHALL contain exactly one [1..1] @moodCode='RQO' Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12685).			
			</sch:assert>
			<sch:assert id="a-2228-12686-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-12686) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.24.3.58' (CONF:2228-12687).
					SHALL contain exactly one [1..1] @extension='2016-02-01' (CONF:2228-27078).
			</sch:assert>
			<sch:assert id="a-2228-12689-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:2228-12689).
			</sch:assert>
			<sch:assert id="a-2228-13254-error" test="count(cda:value[@xsi:type='CD']) = 1">
				SHALL contain exactly one [1..1] value with @xsi:type='CD' (CONF:2228-13254).
			</sch:assert>
			<sch:assert id="a-2228-27345-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) = 1">
				SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27345).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Physical_Exam_Order_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]/cda:code">
			<sch:assert id="a-2228-13242-error" test="@code='29545-1'">
				This code SHALL contain exactly one [1..1] @code='29545-1' physical examination (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-13242).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Order_V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]/cda:value[@xsi:type='CD']">
			<sch:assert id="a-2228-27650-error" test="@sdtc:valueSet">
				This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27650).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>