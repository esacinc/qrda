<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Free_Text_Sig-pattern-errors" />
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Medication_Free_Text_Sig-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Free_Text_Sig-pattern-errors">
		<sch:rule id="Medication_Free_Text_Sig-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]">
			<sch:assert id="a-1198-32770-error" test="@classCode='SBADM'">
				SHALL contain exactly one [1..1] @classCode='SBADM' (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-32770).
			</sch:assert>
			<sch:assert id="a-1198-32771-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">
				SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:1198-32771).
			</sch:assert>
			<sch:assert id="a-1198-32753-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:1198-32753) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.22.4.147' (CONF:1198-32772).
			</sch:assert>
			<sch:assert id="a-1198-32775-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32775).
			</sch:assert>
			<sch:assert id="a-1198-32754-error" test="count(cda:text) = 1">
				SHALL contain exactly one [1..1] text (CONF:1198-32754).
			</sch:assert>
			<sch:assert id="a-1198-32776-error" test="count(cda:consumable) = 1">
				SHALL contain exactly one [1..1] consumable (CONF:1198-32776).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Free_Text_Sig-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:code">
			<sch:assert id="a-1198-32780-error" test="@code='76662-6'">
				This code SHALL contain exactly one [1..1] @code='76662-6' Instructions Medication (CONF:1198-32780).
			</sch:assert>
			<sch:assert id="a-1198-32781-error" test="@codeSystem='2.16.840.1.113883.6.1'">
				This code SHALL contain exactly one [1..1] @codeSystem='2.16.840.1.113883.6.1' (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1198-32781).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Free_Text_Sig-text-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:text">
			<sch:assert id="a-1198-32755-error" test="count(cda:reference) = 1">
				This text SHALL contain exactly one [1..1] reference (CONF:1198-32755).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Free_Text_Sig-reference-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:text/cda:reference">
			<sch:assert id="a-1198-32774-error" test="starts-with(@value, '#')">
				This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1198-32774).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Free_Text_Sig-consumable-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:consumable">
			<sch:assert id="a-1198-32777-error" test="count(cda:manufacturedProduct) = 1">
				This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:1198-32777).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Free_Text_Sig-manufacturedProduct-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:consumable/cda:manufacturedProduct">
			<sch:assert id="a-1198-32778-error" test="count(cda:manufacturedLabeledDrug) = 1">
				This manufacturedProduct SHALL contain exactly one [1..1]  (CONF:1198-32778).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Free_Text_Sig-manufacturedLabeledDrug-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:consumable/cda:manufacturedProduct/cda:manufacturedLabeledDrug">
			<sch:assert id="a-1198-32779-error" test="@nullFlavor='NA'">
				This manufacturedLabeledDrug SHALL contain exactly one [1..1] @nullFlavor='NA' Not Applicable (CONF:1198-32779).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Medication_Free_Text_Sig-pattern-warnings">
		<sch:rule id="Medication_Free_Text_Sig-reference-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:text/cda:reference">
			<sch:assert id="a-1198-32756-warning" test="count(@value) = 1">
				This reference SHOULD contain zero or one [0..1] @value (CONF:1198-32756).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>