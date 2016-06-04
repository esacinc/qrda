<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />

	<sch:phase id="errors">
		<sch:active pattern="Laboratory_Test_Performed_V3-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Laboratory_Test_Performed_V3-pattern-errors">
		<sch:rule id="Laboratory_Test_Performed_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38']]">
			<sch:assert id="a-2228-11705-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode='OBS' (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11705).
			</sch:assert>
			<sch:assert id="a-2228-11706-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode='EVN' (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11706).
			</sch:assert>
			<sch:assert id="a-2228-11721-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-11721) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.24.3.38' (CONF:2228-11722).
					SHALL contain exactly one [1..1] @extension='2016-02-01' (CONF:2228-27021).
			</sch:assert>
			<sch:assert id="a-2228-11707-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:2228-11707).
			</sch:assert>
			<sch:assert id="a-2228-27637-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:2228-27637).			
			</sch:assert>
			<sch:assert id="a-2228-27638-error" test="cda:code/@sdtc:valueSet">
				This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27638).			
			</sch:assert>
			<sch:assert id="a-2228-11709-error" test="count(cda:statusCode)=1">
				SHALL contain exactly one [1..1] statusCode (CONF:2228-11709).
			</sch:assert>
			<sch:assert id="a-2228-11710-error" test="cda:statusCode[@code='completed']">
				This statusCode SHALL contain exactly one [1..1] @code='completed' (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11710).			
			</sch:assert>
			<sch:assert id="a-2228-11711-error" test="count(cda:effectiveTime) = 1">
				SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11711).
					This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-11712).
					Note: QDM Attribute: Start Datetime
					This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-11713).
					Note: QDM Attribute: Stop Datetime
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
