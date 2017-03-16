<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Planned_Coverage-pattern-errors" />
	</sch:phase>
	
	<sch:pattern id="Planned_Coverage-pattern-errors">
		<sch:rule id="Planned_Coverage-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]">
			<sch:assert id="a-1098-31945-error" test="@classCode='ACT'">
				SHALL contain exactly one [1..1] @classCode="ACT" act (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31945).
			</sch:assert>
			<sch:assert id="a-1098-31946-error" test="@moodCode='INT'">
				SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31946).			
			</sch:assert>
			<sch:assert id="a-1098-31947-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129'][not(@extension)]) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:1098-31947) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.129" (CONF:1098-31948).
			</sch:assert>
			<sch:assert id="a-1098-31950-error" test="count(cda:id) &gt; 0">
				SHALL contain at least one [1..*] id (CONF:1098-31950).
			</sch:assert>
			<sch:assert id="a-1098-31951-error" test="count(cda:code) = 1">
				SHALL contain exactly one [1..1] code (CONF:1098-31951).
			</sch:assert>
			<sch:assert id="a-1098-31954-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:1098-31954).		
			</sch:assert>
			<sch:assert id="a-1098-31967-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:act)=1]) = 1">
				SHALL contain exactly one [1..1] entryRelationship (CONF:1098-31967) such that it
					SHALL contain exactly one [1..1] @typeCode="COMP" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31968).
					SHALL contain exactly one [1..1] act (CONF:1098-31969).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Planned_Coverage-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:code">
			<sch:assert id="a-1098-31952-error" test="@code='48768-6'">
				This code SHALL contain exactly one [1..1] @code="48768-6" Payment Sources (CONF:1098-31952).
			</sch:assert>
			<sch:assert id="a-1098-31953-error" test="@codeSystem='2.16.840.1.113883.6.1'">
				This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31953).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Planned_Coverage-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:statusCode">
			<sch:assert id="a-1098-31955-error" test="@code='active'">
				This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31955).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Planned_Coverage-act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:entryRelationship/cda:act">
			<sch:assert id="a-1098-31970-error" test="@classCode='ACT'">
				This act SHALL contain exactly one [1..1] @classCode="ACT" ACT (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31970).
			</sch:assert>
			<sch:assert id="a-1098-31971-error" test="@moodCode='INT'">
				This act SHALL contain exactly one [1..1] @moodCode="INT" intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31971).
			</sch:assert>
			<sch:assert id="a-1098-31972-error" test="count(cda:id) &gt; 0">
				This act SHALL contain at least one [1..*] id (CONF:1098-31972).
			</sch:assert>
			<sch:assert id="a-1098-31973-error" test="count(cda:code) = 1">
				This act SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:1098-31973).
			</sch:assert>
			<sch:assert id="a-1098-31974-error" test="count(cda:statusCode) = 1">
				This act SHALL contain exactly one [1..1] statusCode (CONF:1098-31974).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Planned_Coverage-act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:entryRelationship/cda:act/cda:statusCode">
			<sch:assert id="a-1098-31975-error" test="@code='active'">
				This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31975).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>