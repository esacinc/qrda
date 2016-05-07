<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:phase id='errors'>
		<sch:active pattern='Intervention_Performed_V3-pattern-errors'/>
	</sch:phase>
	<sch:pattern id='Intervention_Performed_V3-pattern-errors'>
		<sch:rule id='Intervention_Performed_V3-errors' context='cda:act[cda:templateId[@root="2.16.840.1.113883.10.20.24.3.32"]]'>
			<sch:assert id='a-2228-27354-error' test='@classCode="ACT"'>
				SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27354).			
			</sch:assert>
			<sch:assert id='a-2228-13590-error' test='@moodCode="EVN"'>
				SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13590).			
			</sch:assert>
			<sch:assert id='a-2228-13591-error' test='count(cda:templateId[@root="2.16.840.1.113883.10.20.24.3.32"][@extension="2016-02-01"]) = 1'>
				SHALL contain exactly one [1..1] templateId (CONF:2228-13591) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.32" (CONF:2228-13592).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27144).
			</sch:assert>
			<sch:assert id='a-2228-27633-error' test='count(cda:code) = 1'>
				SHALL contain exactly one [1..1] code (CONF:2228-27633).
			</sch:assert>
			<sch:assert id='a-2228-27634-error' test='cda:code/@sdtc:valueSet'>
				This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27634).			
			</sch:assert>
			<sch:assert id='a-2228-27362-error' test='cda:statusCode'>
				SHALL contain exactly one [1..1] statusCode (CONF:2228-27362).			
			</sch:assert>
			<sch:assert id='a-2228-27363-error' test='cda:statusCode[@code="completed"]'>
				This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-27363).			
			</sch:assert>
			<sch:assert id='a-2228-13611-error' test='count(cda:effectiveTime) = 1'>
				SHALL contain exactly one [1..1] effectiveTime (CONF:2228-13611).
					This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-13612).
					Note: QDM Attribute: Start Datetime
					This effectiveTime MAY contain zero or one [0..1] high (CONF:2228-13613).
					Note: QDM Attribute: Stop Datetime
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
