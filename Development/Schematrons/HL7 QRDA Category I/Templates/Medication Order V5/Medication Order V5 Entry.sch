<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />

	<!-- Update: 09-26-2018 for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460 
		 Updated prefixes and templateId extension
		 Added conformance 4388-29233: participantRole code
    -->
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Order-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Medication_Order-pattern-errors">
		
		<sch:rule id="Medication_Order-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2018-10-01']]">
			<sch:assert id="a-4388-27377-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4388-27377).</sch:assert>
			<sch:assert id="a-4388-12639-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4388-12639).	</sch:assert>
			<sch:assert id="a-4388-12585-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2018-10-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:4388-12585) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.47" (CONF:4388-12586). SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-27089).</sch:assert>
			<sch:assert id="a-4388-27740-error" test="count(cda:effectiveTime[count(cda:low)=1][count(cda:high)=1]) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:4388-27740) such that it SHALL contain exactly one [1..1] low (CONF:4388-27742) SHALL contain exactly one [1..1] high (CONF:4388-29141). </sch:assert>
			<sch:assert id="a-4388-27745-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2018-10-01) (CONF:4388-27745). </sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Order-participant-participantRole-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2018-10-01']]/cda:participant/cda:participantRole">
			<sch:assert id="a-4388-29233-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:4388-29233). </sch:assert>
		</sch:rule>	
		
	</sch:pattern>
	
</sch:schema>