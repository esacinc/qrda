<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Physical_Exam_Performed-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Physical_Exam_Performed-pattern-errors">
		<sch:rule id="Physical_Exam_Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-27559-error" test="@classCode='OBS'"> SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27559). </sch:assert>
			<sch:assert id="a-3343-12643-error" test="@moodCode='EVN'"> SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12643).	 </sch:assert>
			<sch:assert id="a-3343-12644-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']) = 1"> SHALL contain exactly one [1..1] templateId (CONF:3343-12644) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.59" (CONF:3343-12645). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27135). </sch:assert>
			<sch:assert id="a-3343-27651-error" test="count(cda:code) = 1"> SHALL contain exactly one [1..1] code (CONF:3343-27651). </sch:assert>
			<sch:assert id="a-3343-12649-error" test="count(cda:statusCode) = 1"> SHALL contain exactly one [1..1] statusCode (CONF:3343-12649). </sch:assert>
			<sch:assert id="a-3343-12651-error" test="count(cda:effectiveTime) = 1"> SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12651). </sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Performed-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']]/cda:effectiveTime">
			<sch:assert id="a-3343-12652-error" test="count(cda:low)=1"> This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-12652). </sch:assert>
			<sch:assert id="a-3343-12653-error" test="count(cda:high)=1"> This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-12653). </sch:assert>
		</sch:rule>
		<sch:rule id="Physical_Exam_Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']]/cda:statusCode">
			<sch:assert id="a-3343-12650-error" test="@code='completed'"> This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-12650). </sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>