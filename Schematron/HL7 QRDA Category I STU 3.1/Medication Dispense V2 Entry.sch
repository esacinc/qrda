<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Dispense_V2-pattern-errors" />
	</sch:phase>

	<sch:phase id="warnings">
		<sch:active pattern="Medication_Dispense_V2-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Dispense_V2-pattern-errors">
		<sch:rule id="Medication_Dispense_V2-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]">
			<sch:assert id="a-1098-7451-error" test="@classCode='SPLY'">
				SHALL contain exactly one [1..1] @classCode='SPLY' (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7451).	
			</sch:assert>
			<sch:assert id="a-1098-7452-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode='EVN' (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7452).
			</sch:assert>
			<sch:assert id="a-1098-7453-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:1098-7453) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.22.4.18' (CONF:1098-10505).
					SHALL contain exactly one [1..1] @extension='2014-06-09' (CONF:1098-32580).
			</sch:assert>
			<sch:assert id="a-1098-7454-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:1098-7454).
			</sch:assert>
			<sch:assert id="a-1098-7455-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:1098-7455).
			</sch:assert>
			<sch:assert id="a-1098-9333-error" test="count(cda:product) = 1">
				A supply act SHALL contain one product/Medication Information OR one product/Immunization Medication Information template (CONF:1098-9333).	
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Dispense_V2-statuscode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]/cda:statusCode">
			<sch:assert id="a-1098-32361-error" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.88.12.80.64']/voc:code/@value">
				This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Medication Fill Status urn:oid:2.16.840.1.113883.3.88.12.80.64 STATIC 2014-04-23 (CONF:1098-32361).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Dispense_V2-may-performer-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]/cda:performer">
			<sch:assert id="a-1098-7461-error" test="count(cda:assignedEntity) = 1">
				MAY contain zero or one [0..1] performer (CONF:1098-7461).
					The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-7467).
			</sch:assert>
		</sch:rule>
		
	</sch:pattern>
	
	<sch:pattern id="Medication_Dispense_V2-pattern-warnings">
		<sch:rule id="Medication_Dispense_V2-warning" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]">
			<sch:assert id="a-1098-7456-warning" test="count(cda:effectiveTime) = 1">
				SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7456).
			</sch:assert>
			<sch:assert id="a-1098-7457-warning" test="count(cda:repeatNumber) = 1">
				SHOULD contain zero or one [0..1] repeatNumber (CONF:1098-7457).
			</sch:assert>
			<sch:assert id="a-1098-7458-warning" test="count(cda:quantity) = 1">
				SHOULD contain zero or one [0..1] quantity (CONF:1098-7458).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Dispense_V2-may-performer-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]/cda:performer/cda:assignedEntity">
			<sch:assert id="a-1098-7468-warning" test="count(cda:addr) = 1">
				This assignedEntity SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1098-7468).
			</sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>