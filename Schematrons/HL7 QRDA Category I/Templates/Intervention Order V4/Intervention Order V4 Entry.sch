<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Intervention_Order-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="Intervention_Order-pattern-errors">
		<sch:rule id="Intervention_Order-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-27353-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27353).	</sch:assert>
			<sch:assert id="a-3343-13742-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13742).</sch:assert>
			<sch:assert id="a-3343-13743-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-13743) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.31" (CONF:3343-13744). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26556).</sch:assert>
			<sch:assert id="a-3343-13746-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-13746).</sch:assert>
			<sch:assert id="a-3343-27343-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27343).</sch:assert>
		</sch:rule>
		<sch:rule id="Intervention_Order-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']]/cda:author">
			<sch:assert id="a-3343-29017-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29017). </sch:assert>
			<sch:assert id="a-3343-29016-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29016).</sch:assert>
		</sch:rule>
		<sch:rule id="Intervention_Order-author-assignedAuthor-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
			<sch:assert id="a-3343-29018-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29018). </sch:assert>
		</sch:rule>
	</sch:pattern>
	
</sch:schema>
