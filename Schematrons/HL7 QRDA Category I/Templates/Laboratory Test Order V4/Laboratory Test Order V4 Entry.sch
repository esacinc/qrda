<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Laboratory_Test_Order-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="Laboratory_Test_Order-pattern-errors">
		<sch:rule id="Laboratory_Test_Order-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-27417-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27417).</sch:assert>
			<sch:assert id="a-3343-11953-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11953).</sch:assert>
			<sch:assert id="a-3343-11954-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-11954) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.37" (CONF:3343-11955). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27075).</sch:assert>
			<sch:assert id="a-3343-11957-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-11957).</sch:assert>
			<sch:assert id="a-3343-27344-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1])=1"> SHALL contain exactly one [1..1] author (CONF:3343-27344) such that it SHALL contain exactly one [1..1] time (CONF:3343-29089).  SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29088).	</sch:assert>
		</sch:rule>
		
		<sch:rule id="Laboratory_Test_Order-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2017-08-01']]/cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]/cda:assignedAuthor">
			<sch:assert id="a-3343-29090-error" test="count(cda:id) &gt;= 1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29090).</sch:assert>
		</sch:rule>
		
	</sch:pattern>
</sch:schema>
