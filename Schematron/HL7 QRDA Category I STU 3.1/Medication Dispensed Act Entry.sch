<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Dispensed_Act-pattern-errors" />
	</sch:phase>

	<sch:pattern id="Medication_Dispensed_Act-pattern-errors">
		<sch:rule id="Medication_Dispensed_Act-errors" context='cda:act[cda:templateId[@root="2.16.840.1.113883.10.20.24.3.139"]]'>
			<sch:assert id="a-2228-28562-error" test='@classCode="ACT"'>
				SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28562).
			</sch:assert>
			<sch:assert id="a-2228-28563-error" test='@moodCode="EVN"'>
				SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28563).
			</sch:assert>
			<sch:assert id="a-2228-28558-error" test='count(cda:templateId[@root="2.16.840.1.113883.10.20.24.3.139"]) = 1'>
				SHALL contain exactly one [1..1] templateId (CONF:2228-28558) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.139" (CONF:2228-28560).
			</sch:assert>
			<sch:assert id="a-2228-28564-error" test='count(cda:id) &gt; 0'>
				SHALL contain at least one [1..*] id (CONF:2228-28564).
			</sch:assert>
			<sch:assert id="a-2228-28567-error" test='count(cda:code) = 1'>
				SHALL contain exactly one [1..1] code (CONF:2228-28567).
			</sch:assert>
			<sch:assert id="a-2228-28557-error" test='count(cda:entryRelationship[@typeCode="SUBJ"][count(cda:supply[cda:templateId[@root="2.16.840.1.113883.10.20.24.3.45"]])=1]) = 1'>
				SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28557) such that it
					SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28561).
					SHALL contain exactly one [1..1] Medication Dispensed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.45:2016-02-01) (CONF:2228-28566).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Dispensed_Act-code-errors" context='cda:act[cda:templateId[@root="2.16.840.1.113883.10.20.24.3.139"]]/cda:code'>
			<sch:assert id="a-2228-28568-error" test='@code="SPLY"'>
				This code SHALL contain exactly one [1..1] @code="SPLY" supply (CONF:2228-28568).
			</sch:assert>
			<sch:assert id="a-2228-28569-error" test='@codeSystem="2.16.840.1.113883.5.6"'>
				This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.6" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28569).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>