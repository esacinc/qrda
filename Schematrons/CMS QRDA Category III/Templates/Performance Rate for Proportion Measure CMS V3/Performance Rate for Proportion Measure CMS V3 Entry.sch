<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->
<!-- JIRA https://tracker.esacinc.com/browse/QRDA-444 -->


<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Performance_Rate_for_Proportion_Measure-pattern-errors"/>
		<sch:active pattern="Performance_Rate_for_Proportion_Measure_CMS-pattern-errors"/>
	</sch:phase>

	<sch:pattern id="Performance_Rate_for_Proportion_Measure-pattern-errors">
		<sch:rule id="Performance_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'][@extension='2016-09-01']]">
			<sch:assert id="a-CMS_59-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_59) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.25" (CONF:CMS_60). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_61). </sch:assert>
		</sch:rule>	
	</sch:pattern>
	<sch:pattern id="Performance_Rate_for_Proportion_Measure_CMS-pattern-errors">
		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25'][@extension = '2018-05-01']]">
			<sch:assert id="a-3259-21307_C01-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:3259-21307_C01).</sch:assert>
			<sch:assert id="a-3259-19651_C01-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:3259-19651_C01). </sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS-value-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25'][@extension = '2018-05-01']]/cda:value[@xsi:type='REAL']">
			<sch:assert id="a-CMS_62-error" test="not(@value) or ((@value &gt;= 0) and (@value &lt;= 1))">The value, if present, SHALL be greater than or equal to 0 and less than or equal to 1 (CONF:CMS_62).</sch:assert>
			<sch:assert id="a-CMS_63-error" test="not(@value) or (string-length(substring-after(@value,'.')) &lt;= 6)">The value, if present, SHALL contain no more than 6 digits to the right of the decimal (CONF:CMS_63).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS-reference-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25'][@extension = '2018-05-01']]/cda:reference">
			<sch:assert id="a-3259-19652_C01-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3259-19652_C01).</sch:assert>
			<sch:assert id="a-3259-19653_C01" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:3259-19653_C01).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS-externalObservation-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25'][@extension = '2018-05-01']]/cda:reference/cda:externalObservation">
			<sch:assert id="a-3259-19654-error" test="@classCode">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3259-19654).</sch:assert>
			<sch:assert id="a-3259-19655-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:3259-19655).</sch:assert>
			<sch:assert id="a-3259-19657-error" test="count(cda:code)=1">This externalObservation SHALL contain exactly one [1..1] code (CONF:3259-19657).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS-id-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25'][@extension = '2018-05-01']]/cda:reference/cda:externalObservation/cda:id">
			<sch:assert id="a-3259-19656-error" test="@root">This id SHALL contain exactly one [1..1] @root (CONF:3259-19656).</sch:assert>
		</sch:rule>

		<sch:rule id="Performance_Rate_for_Proportion_Measure_CMS-externalObservation-code-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25'][@extension = '2018-05-01']]/cda:reference/cda:externalObservation/cda:code">
			<sch:assert id="a-3259-19658-error" test="@code='NUMER'">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:3259-19658).</sch:assert>
			<sch:assert id="a-3259-21180-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3259-21180).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
