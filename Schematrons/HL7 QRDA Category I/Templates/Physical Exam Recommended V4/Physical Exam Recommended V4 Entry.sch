<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Physical_Exam_Recommended-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Physical_Exam_Recommended-pattern-errors">
		<sch:rule id="Physical_Exam_Recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-27556-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27556).</sch:assert>
			<sch:assert id="a-3343-12665-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12665).</sch:assert>
			<sch:assert id="a-3343-12666-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12666) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.60" (CONF:3343-12667). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27082). </sch:assert>
			<sch:assert id="a-3343-12669-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-12669). </sch:assert>
			<sch:assert id="a-3343-13275-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-13275). </sch:assert>
			<sch:assert id="a-3343-27351-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27351). </sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Recommended-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]/cda:code">
			<sch:assert id="a-3343-13274-error" test="@code='29545-1'">This code SHALL contain exactly one [1..1] @code="29545-1" physical examination (CONF:3343-13274). </sch:assert>
			<sch:assert id="a-3343-28132-error" test="@codeSystem='2.16.840.1.113883.6.1' ">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28132). </sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Recommended-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]/cda:author">
			<sch:assert id="a-3343-29053-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29053).	</sch:assert>
			<sch:assert id="a-3343-29052-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29052).	</sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Recommended-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
			<sch:assert id="a-3343-29054-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29054). </sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>