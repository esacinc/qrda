<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Measure_Reference_and_Results_CMS_V2-pattern-errors"/>
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Measure_Reference_and_Results_CMS_V2-pattern-warnings"/>
	</sch:phase>
	
	<sch:pattern id="Measure_Reference_and_Results_CMS_V2-pattern-errors">
		<sch:rule id="Measure_Reference_and_Results_CMS_V2-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2018-06-01']]">
			<sch:assert id="a-4378-17887-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4378-17887).</sch:assert>
			<sch:assert id="a-4378-17888-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4378-17888).</sch:assert>
			<sch:assert id="a-4378-711268-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2018-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-711268) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.17" (CONF:4378-711269). SHALL contain exactly one [1..1] @extension="2018-06-01" (CONF:4378-711297).</sch:assert>
			<sch:assert id="a-4378-19532-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-19532) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:4378-19533).</sch:assert>
			<sch:assert id="a-4378-17908-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4378-17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:4378-17909). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:4378-21170).</sch:assert>
			<sch:assert id="a-4378-17889-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:4378-17889).</sch:assert>
			<sch:assert id="a-4378-17890-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:4378-17890) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:4378-17891). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4378-17892).</sch:assert>
			<sch:assert id="a-4378-18425-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2016-11-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:4378-18425) such that it SHALL contain exactly one [1..1] Measure Data - CMS (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.16:2016-11-01) (CONF:4378-711296).</sch:assert>
		</sch:rule>

		<sch:rule id="Measure_Reference_and_Results_CMS_V2-statusCode-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2018-06-01']]/cda:statusCode">
			<sch:assert id="a-4378-19552-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4378-19552).</sch:assert>
		</sch:rule>

		<sch:rule id="Measure_Reference_and_Results_CMS_V2-externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2018-06-01']]/cda:reference/cda:externalDocument">
			<sch:assert id="a-4378-19548-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4378-19548).</sch:assert>
			<sch:assert id="a-4378-18192-error" test="count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1">This externalDocument SHALL contain exactly one [1..1] id (CONF:4378-18192) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:4378-18193). SHALL contain exactly one [1..1] @extension (CONF:4378-711289).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Measure_Reference_and_Results_CMS_V2-externalDocument-code-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17']]/cda:reference/cda:externalDocument/cda:code">
			<sch:assert id="a-4378-19553-error" test="@code='57024-2'">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4378-19553).</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Measure_Reference_and_Results_CMS_V2-pattern-warnings">
		<sch:rule id="Measure_Reference_and_Results_CMS_V2-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2018-06-01']]/cda:reference/cda:externalDocument">
			<sch:assert id="a-4378-17896-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4378-17896).</sch:assert>
			<sch:assert id="a-4378-17897-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:4378-17897).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
