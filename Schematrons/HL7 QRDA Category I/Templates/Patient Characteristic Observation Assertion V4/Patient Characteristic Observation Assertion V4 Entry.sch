<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Patient_Characteristic_Observation_Assertion-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Patient_Characteristic_Observation_Assertion-pattern-errors">
		<sch:rule id="Patient_Characteristic_Observation_Assertion-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-16536-error" test="@classCode='OBS'"> SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-16536).	 </sch:assert>
			<sch:assert id="a-3343-16537-error" test="@moodCode='EVN'"> SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-16537). </sch:assert>
			<sch:assert id="a-3343-28623-error" test="not(@negationInd)"> SHALL NOT contain [0..0] @negationInd (CONF:3343-28623). </sch:assert>
			<sch:assert id="a-3343-26962-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']) = 1"> SHALL contain exactly one [1..1] templateId (CONF:3343-26962) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.103" (CONF:3343-26963) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27781). </sch:assert>
			<sch:assert id="a-3343-16538-error" test="count(cda:id) &gt; 0"> SHALL contain at least one [1..*] id (CONF:3343-16538). </sch:assert>
			<sch:assert id="a-3343-16544-error" test="count(cda:code) = 1"> SHALL contain exactly one [1..1] code (CONF:3343-16544). </sch:assert>
			<sch:assert id="a-3343-16539-error" test="count(cda:statusCode[@code='completed']) = 1">  SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:3343-16539).</sch:assert>
			<sch:assert id="a-3343-16540-error" test="count(cda:effectiveTime) = 1"> SHALL contain exactly one [1..1] effectiveTime (CONF:3343-16540). </sch:assert>
			<sch:assert id="a-3343-16541-error" test="count(cda:value[@xsi:type='CD']) = 1"> SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-16541) </sch:assert>
		</sch:rule>
		
		<sch:rule id="Patient_Characteristic_Observation_Assertion-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']]/cda:code">
			<sch:assert id="a-3343-16545-error" test="@code='ASSERTION'"> This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:3343-16545). </sch:assert>
			<sch:assert id="a-3343-28135-error" test="@codeSystem='2.16.840.1.113883.5.4'"> This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28135). </sch:assert>
		</sch:rule>

		<sch:rule id="Patient_Characteristic_Observation_Assertion-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']]/cda:effectiveTime">
			<sch:assert id="a-3343-27670-error" test="count(cda:low)=1"> This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-27670). </sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>