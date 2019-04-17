<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Intervention_Recommended-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Intervention_Recommended-pattern-errors">
		<sch:rule id="Intervention_Recommended-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-27355-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27355).</sch:assert>
			<sch:assert id="a-3343-13763-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13763).</sch:assert>
			<sch:assert id="a-3343-13764-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-13764) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.33" (CONF:3343-13765). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26557).</sch:assert>
			<sch:assert id="a-3343-13767-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-13767).</sch:assert>
			<sch:assert id="a-3343-27349-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27349).</sch:assert>
		</sch:rule>

		<sch:rule id="Intervention_Recommended-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']]/cda:author">
			<sch:assert id="a-3343-29020-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29020). </sch:assert>
			<sch:assert id="a-3343-29019-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29019). </sch:assert>
		</sch:rule>
		
		<sch:rule id="Intervention_Recommended-author-assignedAuthor-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
			<sch:assert id="a-3343-29021-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29021). </sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>
