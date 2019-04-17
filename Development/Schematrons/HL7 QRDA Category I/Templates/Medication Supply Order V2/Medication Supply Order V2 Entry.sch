<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Supply_Order-pattern-errors" />
	</sch:phase>
	
	<sch:phase id="warnings">
		<sch:active pattern="Medication_Supply_Order-pattern-warnings" />
	</sch:phase>
	
	<sch:pattern id="Medication_Supply_Order-pattern-errors">
		<sch:rule id="Medication_Supply_Order-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]">
			<sch:assert id="a-1098-7427-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7427).	</sch:assert>
			<sch:assert id="a-1098-7428-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7428).</sch:assert>
			<sch:assert id="a-1098-7429-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-7429) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.17" (CONF:1098-10507). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32578).</sch:assert>
			<sch:assert id="a-1098-7430-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7430).</sch:assert>
			<sch:assert id="a-1098-7432-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7432).</sch:assert>
		</sch:rule>
		<sch:rule id="Medication_Supply_Order-statusCode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]/cda:statusCode">
			<sch:assert id="a-1098-32362-error" test="count(@code)=1">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32362).</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Supply_Order-may-entryRelationship-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]/cda:entryRelationship">
			<sch:assert id="a-1098-7444-error" test="@typeCode='SUBJ'">The entryRelationship, if present, SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7444).</sch:assert>
			<sch:assert id="a-1098-7445-error" test="@inversionInd='true'">The entryRelationship, if present, SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-7445).</sch:assert>
			<sch:assert id="a-1098-31391-error" test="count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20'][@extension='2014-06-09']])=1">The entryRelationship, if present, SHALL contain exactly one [1..1] Instruction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-31391).</sch:assert>
		</sch:rule>
	</sch:pattern>

	<sch:pattern id="Medication_Supply_Order-pattern-warnings">
		<sch:rule id="Medication_Supply_Order-effectiveTime-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]">
			<sch:assert id="a-1098-15143-warning" test="count(cda:effectiveTime[count(cda:high)=1]) = 1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-15143) such that it SHALL contain exactly one [1..1] high (CONF:1098-15144).</sch:assert>
			<sch:assert id="a-1098-7434-warning" test="count(cda:repeatNumber) = 1">SHOULD contain zero or one [0..1] repeatNumber (CONF:1098-7434).</sch:assert>
			<sch:assert id="a-1098-7436-warning" test="count(cda:quantity) = 1">SHOULD contain zero or one [0..1] quantity (CONF:1098-7436).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>