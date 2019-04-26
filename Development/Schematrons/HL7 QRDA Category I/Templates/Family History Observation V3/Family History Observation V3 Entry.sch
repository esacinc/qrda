<?xml version="1.0" encoding="UTF-8"?>

<!-- 04-25-2019 Remove translation requirement 1198-32847,  https://tracker.esacinc.com/browse/QRDA-573 -->

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Family_History_Observation_V3-pattern-errors"/>
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Family_History_Observation_V3-pattern-warnings"/>
	</sch:phase>
	
	<sch:pattern id="Family_History_Observation_V3-pattern-errors">
		<sch:rule id="Family_History_Observation_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]">
			<sch:assert id="a-1198-8586-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8586).</sch:assert>
			<sch:assert id="a-1198-8587-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8587).</sch:assert>
			<sch:assert id="a-1198-8599-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8599) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.46" (CONF:1198-10496). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32605).</sch:assert>
			<sch:assert id="a-1198-8592-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-8592).</sch:assert>
			<sch:assert id="a-1198-32427-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-32427).</sch:assert>
			<sch:assert id="a-1198-8590-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-8590).</sch:assert>
			<sch:assert id="a-1198-8591-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1198-8591).</sch:assert>
		</sch:rule>
		
		<!-- 04-25-2019 Remove translation requirement 1198-32847,  https://tracker.esacinc.com/browse/QRDA-573 -->
		<!--
		<sch:rule id="Family_History_Observation_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]/cda:code">
			<sch:assert id="a-1198-32847-error" test="count(cda:translation) &gt; 0">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1198-32847).</sch:assert>
		</sch:rule>
		-->
		
		<sch:rule id="Family_History_Observation_V3-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]/cda:statusCode">
			<sch:assert id="a-1198-19098-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19098).</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Family_History_Observation_V3-pattern-warnings">
		<sch:rule id="Family_History_Observation_V3-code-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]/cda:code">
			<sch:assert id="a-1198-32427-v-warning" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.88.12.3221.7.2']/voc:code/@value">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-32427).</sch:assert>
		</sch:rule>
		<!-- 04-25-2019 Make translation valueSet warning separate from requirement 1198-32847,  https://tracker.esacinc.com/browse/QRDA-573 -->
		<sch:rule id="Family_History_Observation_V3-code-translation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]/cda:code/cda:translation">
			<sch:assert id="a-1198-32847-warning" test="@sdtc:valueSet='2.16.840.1.113883.3.88.12.3221.7.2'">This translation, if present, SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1198-32847).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Family_History_Observation_V3-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]">
			<sch:assert id="a-1198-8593-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1198-8593).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
