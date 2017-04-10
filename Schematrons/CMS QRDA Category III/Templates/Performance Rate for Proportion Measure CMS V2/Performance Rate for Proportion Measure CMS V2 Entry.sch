<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Performance_Rate_for_Proportion_Measure_CMS_V2-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="Performance_Rate_for_Proportion_Measure_CMS_V2-pattern-errors">
		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]">
			<sch:assert id="a-2233-18395-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-18395).</sch:assert>
			<sch:assert id="a-2233-18396-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2233-18396).</sch:assert>
			<sch:assert id="a-2233-711255-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25'][@extension='2016-11-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711255) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.25" (CONF:2233-711256). SHALL contain exactly one [1..1] @extension="2016-11-01" (CONF:2233-711320).</sch:assert>
			<sch:assert id="a-2233-19649-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:2233-19650). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:2233-711321).</sch:assert>
			<sch:assert id="a-2233-711332-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711332) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.30" (CONF:2233-711334). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:2233-711335).</sch:assert>
			<sch:assert id="a-2233-21294-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-21294).</sch:assert>
			<sch:assert id="a-2233-21297-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2233-21297).</sch:assert>
			<sch:assert id="a-2233-21307-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:2233-21307).</sch:assert>
			<sch:assert id="a-2233-711203-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:2233-711203).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-code-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:code">
			<sch:assert id="a-2233-21305-error" test="@code='72510-1'">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:2233-21305).</sch:assert>
			<sch:assert id="a-2233-21306-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-21306).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-statusCode-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:statusCode">
			<sch:assert id="a-2233-21309-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2233-21309).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-value-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:value">
			<sch:assert id="a-2233-711294-error" test="not(@value) or ((@value &gt;= 0) and (@value &lt;= 1))">The value, if present, SHALL be greater than or equal to 0 and less than or equal to 1 (CONF:2233-711294).</sch:assert>
			<sch:assert id="a-2233-711295-error" test="not(@value) or (string-length(substring-after(@value,'.')) &lt;= 6)">The value, if present, SHALL contain no more than 6 digits to the right of the decimal (CONF:2233-711295).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-reference-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference">
			<sch:assert id="a-2233-19652-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2233-19652).</sch:assert>
			<sch:assert id="a-2233-19653-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:2233-19653).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-externalObservation-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference/cda:externalObservation">
			<sch:assert id="a-2233-19654-error" test="@classCode">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2233-19654).</sch:assert>
			<sch:assert id="a-2233-711204-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:2233-711204).</sch:assert>
			<sch:assert id="a-2233-19657-error" test="count(cda:code)=1">This externalObservation SHALL contain exactly one [1..1] code (CONF:2233-19657).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-id-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference/cda:externalObservation/cda:id">
			<sch:assert id="a-2233-19656-error" test="@root">This id SHALL contain exactly one [1..1] @root (CONF:2233-19656).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS_V2-externalObservation-code-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference/cda:externalObservation/cda:code">
			<sch:assert id="a-2233-19658-error" test="@code='NUMER'">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:2233-19658).</sch:assert>
			<sch:assert id="a-2233-711319-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2233-711319).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
