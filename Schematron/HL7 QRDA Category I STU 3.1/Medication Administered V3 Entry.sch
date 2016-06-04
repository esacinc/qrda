<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Administered_V3-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Medication_Administered_V3-pattern-errors">
		<sch:rule id="Medication_Administered_V3-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]">
			<sch:assert id="a-2228-12444-error" test="@classCode='ACT'">
				SHALL contain exactly one [1..1] @classCode='ACT' (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-12444).
			</sch:assert>
			<sch:assert id="a-2228-12445-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode='EVN' (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12445).
			</sch:assert>
			<sch:assert id="a-2228-12446-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2016-02-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-12446) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.24.3.42' (CONF:2228-12447).
					SHALL contain exactly one [1..1] @extension='2016-02-01' (CONF:2228-27023).
			</sch:assert>
			<sch:assert id="a-2228-12448-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:2228-12448).
			</sch:assert>
			<sch:assert id="a-2228-12449-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:2228-12449).			
			</sch:assert>
			<sch:assert id="a-2228-12452-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:2228-12452).			
			</sch:assert>
			<sch:assert id="a-2228-26714-error" test="count(cda:effectiveTime) = 1">
				SHALL contain exactly one [1..1] effectiveTime (CONF:2228-26714).
					This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28552).
					Note: QDM Attribute: Start Datetime
					This effectiveTime MAY contain zero or one [0..1] high (CONF:2228-28553).
					Note: QDM Attribute: Stop Datetime
			</sch:assert>
			<sch:assert id="a-2228-12454-error" test="count(cda:entryRelationship[@typeCode='COMP'][cda:substanceAdministration[@moodCode='EVN'][cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16']]]) &gt; 0">
				SHALL contain at least one [1..*] entryRelationship (CONF:2228-12454) such that it
					SHALL contain exactly one [1..1] @typeCode='COMP' (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12455).
					SHALL contain exactly one [1..1] Medication Activity (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:2228-12456).
						This substanceAdministration SHALL contain exactly one [1..1] @moodCode='EVN' (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12457).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Medication_Administered_V3-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]/cda:code">
			<sch:assert id="a-2228-12450-error" test="@code = '416118004'">
				This code SHALL contain exactly one [1..1] @code='416118004' administration (CONF:2228-12450).			
			</sch:assert>
			<sch:assert id="a-2228-28129-error" test="@codeSystem='2.16.840.1.113883.6.96'">
				This code SHALL contain exactly one [1..1] @codeSystem='2.16.840.1.113883.6.96' (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28129).			
			</sch:assert>
		</sch:rule>
		<sch:rule id="Medication_Administered_V3-statuscode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]/cda:statusCode">
			<sch:assert id="a-2228-13241-error" test="@code='completed'">
				This statusCode SHALL contain exactly one [1..1] @code='completed' (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-13241).			
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>