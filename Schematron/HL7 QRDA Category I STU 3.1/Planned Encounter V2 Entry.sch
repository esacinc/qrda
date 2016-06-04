<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Planned_Encounter_V2-pattern-errors" />
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Planned_Encounter_V2-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Planned_Encounter_V2-pattern-errors">
		<sch:rule id="Planned_Encounter_V2-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40']]">
			<sch:assert id="a-1098-8564-error" test="@classCode='ENC'">
				SHALL contain exactly one [1..1] @classCode='ENC' (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8564).
			</sch:assert>
			<sch:assert id="a-1098-8565-error" test="@moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">
				SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8565).			
			</sch:assert>
			<sch:assert id="a-1098-30437-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40'][@extension='2014-06-09']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:1098-30437) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.22.4.40' (CONF:1098-30438).
					SHALL contain exactly one [1..1] @extension='2014-06-09' (CONF:1098-32553).
			</sch:assert>
			<sch:assert id="a-1098-8567-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:1098-8567).
			</sch:assert>
			<sch:assert id="a-1098-30439-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:1098-30439).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Planned_Encounter_V2-statusCode-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40']]/cda:statusCode">
			<sch:assert id="a-1098-31880-error" test="@code='active'">
				This statusCode SHALL contain exactly one [1..1] @code='active' Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31880).			
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Planned_Encounter_V2-pattern-warnings">
		<sch:rule id="Planned_Encounter_V2-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40']]">
			<sch:assert id="a-1098-30440-warning" test="count(cda:effectiveTime) = 1">
				SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30440).
			</sch:assert>
			<sch:assert id="a-1098-32045-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">
				SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32045).
			</sch:assert>
			<sch:assert id="a-1098-31032-warning" test="count(cda:code) = 1">
				SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Encounter Planned urn:oid:2.16.840.1.113883.11.20.9.52 DYNAMIC (CONF:1098-31032).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>