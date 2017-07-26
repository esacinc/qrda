<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Patient_Characteristic_Coverage_Type-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Patient_Characteristic_Coverage_Type-pattern-errors">
		<sch:rule id="Patient_Characteristic_Observation_Coverage_Type-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-28974-error" test="@classCode='OBS'"> SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-29974).	 </sch:assert>
			<sch:assert id="a-3343-28975-error" test="@moodCode='EVN'"> SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28975). </sch:assert>
			<sch:assert id="a-3343-28978-error" test="not(@negationInd)"> SHALL NOT contain [0..0] @negationInd (CONF:3343-28978). </sch:assert>
			<sch:assert id="a-3343-28965-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']) = 1"> SHALL contain exactly one [1..1] templateId (CONF:3343-28965) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.154" (CONF:3343-28969) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28970).  </sch:assert>
			<sch:assert id="a-3343-28976-error" test="count(cda:id) &gt; 0"> SHALL contain at least one [1..*] id (CONF:3343-28976). </sch:assert>
			<sch:assert id="a-3343-28964-error" test="count(cda:code) = 1"> SHALL contain exactly one [1..1] code (CONF:3343-28964). </sch:assert>
			<sch:assert id="a-3343-28977-error" test="count(cda:statusCode[@code='completed']) = 1">  SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:3343-28977).</sch:assert>
			<sch:assert id="a-3343-28966-error" test="count(cda:effectiveTime) = 1"> SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28966). </sch:assert>
			<sch:assert id="a-3343-28973-error" test="count(cda:value[@xsi:type='CD']) = 1"> SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28973) </sch:assert>
		</sch:rule>
		
		<sch:rule id="Patient_Characteristic_Coverage_Type-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']]/cda:code">
			<sch:assert id="a-3343-28967-error" test="@code='ASSERTION'"> This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:3343-28967). </sch:assert>
			<sch:assert id="a-3343-28968-error" test="@codeSystem='2.16.840.1.113883.5.4'"> This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28968). </sch:assert>
		</sch:rule>

		<sch:rule id="Patient_Characteristic_Coverage_Type-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']]/cda:effectiveTime">
			<sch:assert id="a-3343-28971-error" test="count(cda:low)=1"> This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28971). </sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>