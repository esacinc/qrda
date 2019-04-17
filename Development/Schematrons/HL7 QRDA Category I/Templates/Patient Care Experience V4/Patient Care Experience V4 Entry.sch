<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Patient_care_experience-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Patient_care_experience-pattern-errors">
		<sch:rule id="Patient_care_experience-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-12464-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" observation, which SHALL be selected from CodeSystem HL7ActClass (urn:oid:2.16.840.1.113883.5.6) (CONF:3343-12464).</sch:assert>
			<sch:assert id="a-3343-12465-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12465).</sch:assert>
			<sch:assert id="a-3343-28085-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28085)</sch:assert>
			<sch:assert id="a-3343-12466-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12466) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.48" (CONF:3343-12467). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27290).  </sch:assert>
			<sch:assert id="a-3343-12469-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-12469).</sch:assert>
			<sch:assert id="a-3343-12470-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-12470).</sch:assert>
			<sch:assert id="a-3343-12471-error" test="count(cda:statusCode[@code='completed']) = 1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:3343-12471).</sch:assert>
			<sch:assert id="a-3343-13038-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-13038).</sch:assert>
			<sch:assert id="a-3343-28932-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-28932).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Patient_care_experience-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]/cda:code">
			<sch:assert id="a-3343-13037-error" test="@code='77218-6'">This code SHALL contain exactly one [1..1] @code="77218-6" Patient satisfaction with healthcare delivery (CONF:3343-13037).</sch:assert>
			<sch:assert id="a-3343-27555-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-27555).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Patient_care_experience-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]/cda:author">
			<sch:assert id="a-3343-29014-error" test="count(cda:time) = 1">This author SHALL contain exactly one [1..1] time (CONF:3343-29014). </sch:assert>
			<sch:assert id="a-3343-29013-error" test="count(cda:assignedAuthor) = 1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29013)</sch:assert>
		</sch:rule>
		
		<sch:rule id="Patient_care_experience-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
			<sch:assert id="a-3343-29015-error" test="count(cda:id) &gt;= 1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29015). </sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>