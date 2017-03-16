<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Patient_Characteristic_Payer-pattern-errors" />
	</sch:phase>

	<sch:phase id="warnings">
		<sch:active pattern="Patient_Characteristic_Payer-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Patient_Characteristic_Payer-pattern-errors">
		<sch:rule id="Patient_Characteristic_Payer-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
			<sch:assert id="a-67-14213-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-14213).			
			</sch:assert>
			<sch:assert id="a-67-14214-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-14214).			
			</sch:assert>
			<sch:assert id="a-67-12561-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55'][not(@extension)]) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:67-12561) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.55" (CONF:67-12562).
			</sch:assert>
			<sch:assert id="a-67-12564-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:67-12564).
			</sch:assert>
			<sch:assert id="a-67-12565-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:67-12565).
			</sch:assert>
			<sch:assert id="a-67-26933-error" test="count(cda:effectiveTime) = 1">
				SHALL contain exactly one [1..1] effectiveTime (CONF:67-26933).
			</sch:assert>
			<sch:assert id="a-67-16710-error" test="count(cda:value[@xsi:type='CD']) = 1">
				SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:67-16710).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Patient_Characteristic_Payer-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]/cda:code">
			<sch:assert id="a-67-14029-error" test="@code='48768-6'">
				This code SHALL contain exactly one [1..1] @code="48768-6" Payment source (CONF:67-14029).
			</sch:assert>
			<sch:assert id="a-67-27009-error" test="@codeSystem='2.16.840.1.113883.6.1'">
				This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27009).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Patient_Characteristic_Payer-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]/cda:effectiveTime">
			<sch:assert id="a-67-26934-error" test="count(cda:low)=1">
				This effectiveTime SHALL contain exactly one [1..1] low (CONF:67-26934).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Patient_Characteristic_Payer-pattern-warnings">
		<sch:rule id="Patient_Characteristic_Payer-effectiveTime-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]/cda:effectiveTime">
			<sch:assert id="a-67-26935-warning" test="count(cda:high)=1">
				This effectiveTime SHOULD contain zero or one [0..1] high (CONF:67-26935).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>