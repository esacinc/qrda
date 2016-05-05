<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:phase id="errors">
		<sch:active pattern="Family_History_Organizer_V3-pattern-errors"/>
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="Family_History_Organizer_V3-pattern-warnings"/>
	</sch:phase>
	<sch:pattern id="Family_History_Organizer_V3-pattern-errors">
		<sch:rule id="Family_History_Organizer_V3-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]">
			<sch:assert id="a-1198-8600-error" test="@classCode='CLUSTER'">
				SHALL contain exactly one [1..1] @classCode="CLUSTER" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8600).
			</sch:assert>
			<sch:assert id="a-1198-8601-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8601).
			</sch:assert>
			<sch:assert id="a-1198-8604-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01'])=1">
				SHALL contain exactly one [1..1] templateId (CONF:1198-8604) such that it 
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.45" (CONF:1198-10497). 
					SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32606).
			</sch:assert>
			<sch:assert id="a-1198-32485-error" test="count(cda:id)  &gt; 0">
				SHALL contain at least one [1..*] id (CONF:1198-32485).
			</sch:assert>
			<sch:assert id="a-1198-8602-error" test="count(cda:statusCode) = 1">
				SHALL contain exactly one [1..1] statusCode (CONF:1198-8602).
			</sch:assert>
			<sch:assert id="a-1198-19099-error" test="cda:statusCode[@code='completed']">
				This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19099).
			</sch:assert>
			<sch:assert id="a-1198-8609-error" test="count(cda:subject)  = 1">
				SHALL contain exactly one [1..1] subject (CONF:1198-8609).
			</sch:assert>
			<sch:assert id="a-1198-15244-error" test="count(cda:subject/cda:relatedSubject) = 1">
				This subject SHALL contain exactly one [1..1] relatedSubject (CONF:1198-15244).
			</sch:assert>
			<sch:assert id="a-1198-15245-error" test="cda:subject/cda:relatedSubject[@classCode='PRS']">
				This relatedSubject SHALL contain exactly one [1..1] @classCode="PRS" Person (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1198-15245).			
			</sch:assert>
			<sch:assert id="a-1198-15246-error" test="count(cda:subject/cda:relatedSubject/cda:code) = 1">
				This relatedSubject SHALL contain exactly one [1..1] code (CONF:1198-15246).			
			</sch:assert>
			<sch:assert id="a-1198-15247-error" test="cda:subject/cda:relatedSubject/cda:code/@code">
				This code SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Family Member Value Set urn:oid:2.16.840.1.113883.1.11.19579 DYNAMIC (CONF:1198-15247).			
			</sch:assert>
			<sch:assert id="a-1198-15974-error" test="count(cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode) = 1">
				The subject, if present, SHALL contain exactly one [1..1] administrativeGenderCode (CONF:1198-15974).			
			</sch:assert>
			<sch:assert id="a-1198-15975-error" test="cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode/@code">
				This administrativeGenderCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:1198-15975).
			</sch:assert>
			<sch:assert id="a-1198-32428-error" test="count(cda:component) &gt; 0">
				SHALL contain at least one [1..*] component (CONF:1198-32428).
			</sch:assert>
			<sch:assert id="a-1198-32429-error" test="count(cda:component/cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]) = 1">
				Such components SHALL contain exactly one [1..1] Family History Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.46:2015-08-01) (CONF:1198-32429).			
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="Family_History_Organizer_V3-pattern-may-subject-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject/cda:relatedSubject/cda:subject">
				<sch:assert id="a-1198-15981-error" test="count(sdtc:deceasedInd)=1">
					The subject MAY contain zero or one [0..1] sdtc:deceasedInd. The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the deceasedInd element (CONF:1198-15981).
				</sch:assert>
				<sch:assert id="a-1198-15982-error" test="count(sdtc:deceasedTime)=1">
					The subject MAY contain zero or one [0..1] sdtc:deceasedTime. The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the deceasedTime element (CONF:1198-15982).
				</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="Family_History_Organizer_V3-pattern-warnings">
		<sch:rule id="Family_History_Organizer_QDM_V2-subject-birthTime-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]">
			<sch:assert id="a-1198-15248-warning" test="count(cda:subject/cda:relatedSubject/cda:subject) = 1">
				This relatedSubject SHOULD contain zero or one [0..1] subject (CONF:1198-15248).			
			</sch:assert>
			<sch:assert id="a-1198-15976-warning" test="count(cda:subject/cda:relatedSubject/cda:subject/cda:birthTime) = 1">
				The subject, if present, SHOULD contain zero or one [0..1] birthTime (CONF:1198-15976).			
			</sch:assert>
			<sch:assert id="a-1198-15249-warning" test="count(cda:subject/cda:relatedSubject/cda:subject/sdtc:id) = 1">
				The subject SHOULD contain zero or more [0..*] sdtc:id. The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the id element (CONF:1198-15249).			
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
