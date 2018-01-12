<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Patient_Characteristic_Expired_V3-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Patient_Characteristic_Expired_V3-pattern-errors">
		<sch:rule id="Patient_Characteristic_Expired_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-28087-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28087).			
			</sch:assert>
			<sch:assert id="a-2228-28088-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28088).			
			</sch:assert>
			<sch:assert id="a-2228-28089-error" test="not(@negationInd)">
				SHALL NOT contain [0..0] @negationInd (CONF:2228-28089).			
			</sch:assert>
			<sch:assert id="a-2228-12540-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-12540) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.54" (CONF:2228-12541).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27014).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>