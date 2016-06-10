<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Planned_Act_V2-pattern-errors" />
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Planned_Act_V2-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Planned_Act_V2-pattern-errors">
		<sch:rule id="Planned_Act_V2-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]">
			<sch:assert id="a-1098-8538-error" test="@classCode='ACT'">
				SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8538).
			</sch:assert>
			<sch:assert id="a-1098-8539-error" test="@moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">
				SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8539).			
			</sch:assert>
			<sch:assert id="a-1098-30430-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39'][@extension='2014-06-09']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:1098-30430) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.39" (CONF:1098-30431).
					SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32552).
			</sch:assert>
			<sch:assert id="a-1098-8546-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:1098-8546).
			</sch:assert>
			<sch:assert id="a-1098-31687-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:1098-31687).
			</sch:assert>
			<sch:assert id="a-1098-30432-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:1098-30432).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Planned_Act_V2-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]/cda:statusCode">
			<sch:assert id="a-1098-32019-error" test="@code='active'">
				This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32019).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Planned_Act_V2-pattern-warnings">
		<sch:rule id="Planned_Act_V2-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]">
			<sch:assert id="a-1098-32020-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) = 1">
				SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32020).
			</sch:assert>
			<sch:assert id="a-1098-30433-warning" test="count(cda:effectiveTime) = 1">
				SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30433).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Planned_Act_V2-code-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]/cda:code">
			<sch:assert id="a-1098-32030-warning" test="@codeSystem = '2.16.840.1.113883.6.96' or @codeSystem = '2.16.840.1.113883.6.1'">
				This code in a Planned Act SHOULD be selected from LOINC (CodeSystem: 2.16.840.1.113883.6.1) OR SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) (CONF:1098-32030).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
			
</sch:schema>