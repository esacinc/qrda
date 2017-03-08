<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Activity_V2-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Medication_Activity_V2-pattern-errors">
		<sch:rule id="Medication_Activity_V2-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]">
			<sch:assert id="a-1098-7496-error" test="@classCode='SBADM'">
				SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7496).
			</sch:assert>
			<sch:assert id="a-1098-7497-v-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">
				SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:1098-7497).			
			</sch:assert>
			<sch:assert id="a-1098-7499-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:1098-7499) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.16" (CONF:1098-10504).
					SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32498).
			</sch:assert>
			<sch:assert id="a-1098-7500-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:1098-7500).
			</sch:assert>
			<sch:assert id="a-1098-7507-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:1098-7507).			
			</sch:assert>
			<sch:assert id="a-1098-7508-error" test="count(cda:effectiveTime) = 1 and (cda:effectiveTime[@value] or count(cda:effectiveTime[cda:low])=1) and not(cda:effectiveTime[@value] and cda:effectiveTime[cda:low])">
				SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7508) such that it
					SHALL contain either a low or a @value but not both (CONF:1098-32890).
			</sch:assert>
			<sch:assert id="a-1098-7516-error" test="count(cda:doseQuantity) = 1">
				SHALL contain exactly one [1..1] doseQuantity (CONF:1098-7516).
			</sch:assert>
			<sch:assert id="a-1098-7520-error" test="count(cda:consumable) = 1">
				SHALL contain exactly one [1..1] consumable (CONF:1098-7520).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Activity_V2-code-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:statusCode">
			<sch:assert id="a-1098-32360-error" test="@code">
				This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32360).			
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Activity_V2-may-rateQuantity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:rateQuantity">
			<sch:assert id="a-1098-7525-error" test="@unit">
				The rateQuantity, if present, SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-7525).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Activity_V2-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:consumable">
			<sch:assert id="a-1098-16085-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09']])=1">
				This consumable SHALL contain exactly one [1..1] Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-16085).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Activity_V2-may-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:precondition">
			<sch:assert id="a-1098-31882-error" test="@typeCode='PRCN'">
				The precondition, if present, SHALL contain exactly one [1..1] @typeCode="PRCN" (CONF:1098-31882).
			</sch:assert>
			<sch:assert id="a-1098-31883-error" test="count(cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25'][@extension='2014-06-09']]) = 1">
				The precondition, if present, SHALL contain exactly one [1..1] Precondition for Substance Administration (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1098-31883).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Medication_Activity_V2-pattern-warnings">
		<sch:rule id="Medication_Activity_V2-effectiveTime-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:effectiveTime">
			<sch:assert id="a-1098-7513-warning" test="parent::node()[count(cda:effectiveTime[@operator='A'][@xsi:type='PIVL_TS' or 'EIVL_TS'])=1]">
				SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7513) such that it
					SHALL contain exactly one [1..1] @operator="A" (CONF:1098-9106).
					SHALL contain exactly one [1..1] @xsi:type="PIVL_TS" or "EIVL_TS" (CONF:1098-28499).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Activity_V2-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:doseQuantity">
			<sch:assert id="a-1098-7526-warning" test="@unit">
				This doseQuantity SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-7526).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Activity_V2-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]">
			<sch:assert id="a-1098-7514-warning" test="count(cda:routeCode) = 1">
				SHOULD contain zero or one [0..1] routeCode, which SHALL be selected from ValueSet Medication Route FDA urn:oid:2.16.840.1.113883.3.88.12.3221.8.7 DYNAMIC (CONF:1098-7514).
			</sch:assert>
			<sch:assert id="a-1098-31150-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">
				SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31150).
			</sch:assert>
			
			<sch:assert id="a-1098-30800-warning" test="cda:doseQuantity or cda:rateQuantity">
				Medication Activity SHOULD include doseQuantity OR rateQuantity (CONF:1098-30800).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>