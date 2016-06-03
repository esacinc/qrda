<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:phase id='errors'>
		<sch:active pattern='Measure_Reference-pattern-errors'/>
	</sch:phase>
	<sch:pattern id='Measure_Reference-pattern-errors'>
		<sch:rule id='Measure_Reference-errors' context='cda:act[cda:templateId[@root="2.16.840.1.113883.10.20.24.3.98"]]'>
			<sch:assert id='a-67-12979-error' test='@classCode="CLUSTER"'>
				SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12979).			
			</sch:assert>
			<sch:assert id='a-67-12980-error' test='@moodCode="EVN"'>
				SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12980).
			</sch:assert>
			<sch:assert id='a-67-19532-error' test='count(cda:templateId[@root="2.16.840.1.113883.10.20.24.3.98"]) = 1'>
				SHALL contain exactly one [1..1] templateId (CONF:67-19532) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:67-19533).
			</sch:assert>
			<sch:assert id='a-67-26992-error' test='count(cda:id) &gt; 0'>
				SHALL contain at least one [1..*] id (CONF:67-26992).			
			</sch:assert>
			<sch:assert id='a-67-12981-error' test='cda:statusCode[@code="completed"]'>
				SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12981).
			</sch:assert>
			<sch:assert id='a-67-12982-error' test='count(cda:reference[@typeCode="REFR"][count(cda:externalDocument)=1])=1'>
				SHALL contain exactly one [1..1] reference (CONF:67-12982) such that it
					SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12983).
					SHALL contain exactly one [1..1] externalDocument (CONF:67-12984).
			</sch:assert>
		</sch:rule>
		<sch:rule id='Measure_Reference-externalDocument-errors' context='cda:act[cda:templateId[@root="2.16.840.1.113883.10.20.24.3.98"]]/cda:reference/cda:externalDocument'>
			<sch:assert id='a-67-19534-error' test='@classCode="DOC"'>
				This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-19534).
			</sch:assert>
			<sch:assert id='a-67-12985-error' test='count(cda:id[@root]) &gt; 0'>
				This externalDocument SHALL contain at least one [1..*] id (CONF:67-12985) such that it
					SHALL contain exactly one [1..1] @root (CONF:67-12986).
					This ID references an ID of the Quality Measure (CONF:67-27008).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
