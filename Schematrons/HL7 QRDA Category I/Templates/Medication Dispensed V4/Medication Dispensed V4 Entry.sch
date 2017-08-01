<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Dispensed-pattern-errors" />
	</sch:phase>

	<sch:pattern id="Medication_Dispensed-pattern-errors">
		<sch:rule id="Medication_Dispensed-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-27528-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27528).</sch:assert>
			<sch:assert id="a-3343-27529-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-27529).</sch:assert>
			<sch:assert id="a-3343-13851-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']) = 1"> SHALL contain exactly one [1..1] templateId (CONF:3343-13851) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.45" (CONF:3343-13852). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26555).</sch:assert>
			<sch:assert id="a-3343-19440-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:3343-19440).</sch:assert>
			<sch:assert id="a-3343-28910-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-28910).</sch:assert>
			<sch:assert id="a-3343-28669-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139']) = 1">This template SHALL be contained by a Medication Dispensed Act (V2) (CONF:3343-28908).</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Dispensed-author-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:author">
			<sch:assert id="a-3343-29011-error" test="count(cda:time) = 1">This author SHALL contain exactly one [1..1] time (CONF:3343-29011).</sch:assert>
			<sch:assert id="a-3343-29010-error" test="count(cda:assignedAuthor) = 1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29010).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Dispensed-author-assignedAuthor-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
			<sch:assert id="a-3343-29012-error" test="count(cda:id) &gt;= 1"> This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29012).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Dispensed-statuscode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:statusCode">
			<sch:assert id="a-3343-19441-error" test="@code='completed'">
				This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-19441).
			</sch:assert>
		</sch:rule>
		<sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration">
			<sch:assert id="a-3343-28226-error" test="@classCode='SBADM'">This substanceAdministration SHALL contain exactly one [1..1] @classCode="SBADM" Substance Administration (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28226).	</sch:assert>
			<sch:assert id="a-3343-28227-error" test="@moodCode='EVN'">This substanceAdministration SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28227).</sch:assert>
			<sch:assert id="a-3343-28229-error" test="count(cda:consumable)=1">This substanceAdministration SHALL contain exactly one [1..1] consumable (CONF:3343-28229).</sch:assert>
		</sch:rule>
		<sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-consumable-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:consumable">
			<sch:assert id="a-3343-28230-error" test="count(cda:manufacturedProduct)=1">This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:3343-28230).</sch:assert>
		</sch:rule>
		<sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-consumable-manufacturedProduct-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct">
			<sch:assert id="a-3343-28231-error" test="count(cda:manufacturedMaterial)=1">This manufacturedProduct SHALL contain exactly one [1..1] manufacturedMaterial (CONF:3343-28231).</sch:assert>
		</sch:rule>
		<sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-consumable-manufacturedProduct-manufacturedMaterial-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">
			<sch:assert id="a-3343-28232-error" test="@nullFlavor='NA'">This manufacturedMaterial SHALL contain exactly one [1..1] @nullFlavor="NA" (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:3343-28232).</sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>