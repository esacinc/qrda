<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Physical_Exam_Recommended_V3-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Physical_Exam_Recommended_V3-pattern-errors">
		<sch:rule id="Physical_Exam_Recommended_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]">
			<sch:assert id="a-2228-27556-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode='OBS' Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27556).			
			</sch:assert>
			<sch:assert id="a-2228-12665-error" test="@moodCode='INT'">
				SHALL contain exactly one [1..1] @moodCode='INT' Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12665).			
			</sch:assert>
			<sch:assert id="a-2228-12666-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-12666) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.24.3.60' (CONF:2228-12667).
					SHALL contain exactly one [1..1] @extension='2016-02-01' (CONF:2228-27082).
			</sch:assert>
			<sch:assert id="a-2228-12669-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:2228-12669).
			</sch:assert>
			<sch:assert id="a-2228-13275-error" test="count(cda:value[@xsi:type='CD']) = 1">
				SHALL contain exactly one [1..1] value with @xsi:type='CD' (CONF:2228-13275).
			</sch:assert>
			<sch:assert id="a-2228-27351-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) = 1">
				SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27351).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Recommended_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]/cda:code">
			<sch:assert id="a-2228-13274-error" test="@code='29545-1'">
				This code SHALL contain exactly one [1..1] @code='29545-1' physical examination (CONF:2228-13274).
			</sch:assert>
			<sch:assert id="a-2228-28132-error" test="@codeSystem='2.16.840.1.113883.6.1' ">
				This code SHALL contain exactly one [1..1] @codeSystem='2.16.840.1.113883.6.1' (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28132).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Recommended_V3-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]/cda:value[@xsi:type='CD']">
			<sch:assert id="a-2228-27653-error" test="@sdtc:valueSet">
				This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27653).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>