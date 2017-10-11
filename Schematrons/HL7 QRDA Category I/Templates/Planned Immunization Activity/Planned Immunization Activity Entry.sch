<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Planned_Immunization_Activity-pattern-errors" />
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Planned_Immunization_Activity-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Planned_Immunization_Activity-pattern-errors">
		<sch:rule id="Planned_Immunization_Activity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]">
			<sch:assert id="a-1098-32091-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CONF:1098-32091).</sch:assert>
			<sch:assert id="a-1098-32097-error" test="@moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2014-09-01 (CONF:1098-32097).</sch:assert>
			<sch:assert id="a-1098-32098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-32098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.120" (CONF:1098-32099).</sch:assert>
			<sch:assert id="a-1098-32100-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-32100).</sch:assert>
			<sch:assert id="a-1098-32101-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32101).</sch:assert>
			<sch:assert id="a-1098-32103-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-32103).</sch:assert>
			<sch:assert id="a-1098-32131-error" test="count(cda:consumable) = 1">SHALL contain exactly one [1..1] consumable (CONF:1098-32131).</sch:assert>
		</sch:rule>

		<sch:rule id="Planned_Immunization_Activity-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]/cda:consumable">
			<sch:assert id="a-1098-32132-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']]) = 1">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:1098-32132).</sch:assert>
		</sch:rule>
		<sch:rule id="Planned_Immunization_Activity-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]/cda:statusCode">
			<sch:assert id="a-1098-32102-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32102).</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Planned_Immunization_Activity-pattern-warnings">
		<sch:rule id="Planned_Immunization_Activity-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]/cda:doseQuantity">
			<sch:assert id="a-1098-32130-warning" test="@unit">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32130).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>