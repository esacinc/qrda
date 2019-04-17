<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Patient_Characteristic_Clinical_Trial_Participant-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Patient_Characteristic_Clinical_Trial_Participant-pattern-errors">
		<sch:rule id="Patient_Characteristic_Clinical_Trial_Participant-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-16711-error" test="@classCode='OBS'"> SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-16711). </sch:assert>
			<sch:assert id="a-3343-12526-error" test="@moodCode='EVN'"> SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12526). </sch:assert>
			<sch:assert id="a-3343-28086-error" test="not(@negationInd)"> SHALL NOT contain [0..0] @negationInd (CONF:3343-28086).	 </sch:assert>
			<sch:assert id="a-3343-12537-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']) = 1"> SHALL contain exactly one [1..1] templateId (CONF:3343-12537) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.51" (CONF:3343-12538).SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27026).	</sch:assert>
			<sch:assert id="a-3343-26996-error" test="count(cda:id) &gt; 0"> SHALL contain at least one [1..*] id (CONF:3343-26996). </sch:assert>
			<sch:assert id="a-3343-13041-error" test="count(cda:code) = 1"> SHALL contain exactly one [1..1] code (CONF:3343-13041). </sch:assert>
			<sch:assert id="a-3343-13042-error" test="count(cda:statusCode[@code='active']) = 1"> SHALL contain exactly one [1..1] statusCode="active" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-13042). </sch:assert>
			<sch:assert id="a-3343-12536-error" test="count(cda:effectiveTime) = 1"> SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12536). </sch:assert>
			<sch:assert id="a-3343-16712-error" test="count(cda:value[@xsi:type='CD']) = 1"> SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-16712). </sch:assert>
		</sch:rule>

		<sch:rule id="Patient_Characteristic_Clinical_Trial_Participant-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']]/cda:code">
			<sch:assert id="a-3343-28130-error" test="@code='ASSERTION'"> This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28130). </sch:assert>
			<sch:assert id="a-3343-28131-error" test="@codeSystem='2.16.840.1.113883.5.4'"> This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28131).</sch:assert>
		</sch:rule>

		<sch:rule id="Patient_Characteristic_Clinical_Trial_Participant-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']]/cda:effectiveTime">
			<sch:assert id="a-3343-27668-error" test="count(cda:low)=1"> This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-27668). </sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>