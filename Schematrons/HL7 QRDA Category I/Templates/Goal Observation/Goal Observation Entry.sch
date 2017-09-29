<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:phase id="errors">
		<sch:active pattern="Goal_Observation-pattern-errors"/>
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Goal_Observation-pattern-warnings"/>
	</sch:phase>
	<sch:pattern id="Goal_Observation-pattern-errors">
		<sch:rule id="Goal_Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]">
			<sch:assert id="a-1098-30418-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30418).</sch:assert>
			<sch:assert id="a-1098-30419-error" test="@moodCode='GOL'">SHALL contain exactly one [1..1] @moodCode="GOL" Goal (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-30419).</sch:assert>
			<sch:assert id="a-1098-8583-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-8583) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.121" (CONF:1098-10512).</sch:assert>
			<sch:assert id="a-1098-32332-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-32332).</sch:assert>
			<sch:assert id="a-1098-30784-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30784).</sch:assert>
			<sch:assert id="a-1098-32333-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32333).</sch:assert>
			<sch:assert id="a-1098-30995-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) = 1">SHALL contain at least one [1..*] author (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-30995).</sch:assert>
		</sch:rule>
		<sch:rule id="Goal_Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]/cda:statusCode">
			<sch:assert id="a-1098-32334-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32334).</sch:assert>
		</sch:rule>
		<sch:rule id="Goal_Observation-may-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]/cda:reference">
			<sch:assert id="a-1098-32755-error" test="@typeCode='REFR'">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32755).</sch:assert>
			<sch:assert id="a-1098-32756-error" test="count(cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115'][@extension='2014-06-09']])=1">The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:1098-32756).</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Goal_Observation-pattern-warnings">
		<sch:rule id="Goal_Observation-codesystem-code-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]/cda:code">
			<sch:assert id="a-1098-30784-c-warning" test="@codeSystem='2.16.840.1.113883.6.1'">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30784).</sch:assert>
		</sch:rule>

		<sch:rule id="Goal_Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]">
			<sch:assert id="a-1098-32335-warning" test="count(cda:effectiveTime) = 1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-32335).</sch:assert>
			<sch:assert id="a-1098-30785-warning" test="count(cda:entryRelationship[@typeCode='REFR'][cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]]) = 1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-30785) such that it SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-30786). SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1098-30787).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
