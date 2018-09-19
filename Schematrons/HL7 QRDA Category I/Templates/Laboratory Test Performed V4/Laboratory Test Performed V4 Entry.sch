<?xml version="1.0" encoding="UTF-8"?>

<!-- Update: 09-19-2017 Fixed a-3343-29130-error test in schematron  JIRA: https://tracker.esacinc.com/browse/QRDA-482 -->

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />

	<sch:phase id="errors">
		<sch:active pattern="Laboratory_Test_Performed-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="Laboratory_Test_Performed-pattern-errors">
		<sch:rule id="Laboratory_Test_Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-11705-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11705).</sch:assert>
			<sch:assert id="a-3343-11706-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11706).</sch:assert>
			<sch:assert id="a-3343-11721-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-11721) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.38" (CONF:3343-11722). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27021).</sch:assert>
			<sch:assert id="a-3343-11707-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-11707).</sch:assert>
			<sch:assert id="a-3343-27637-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-27637).	</sch:assert>
			<sch:assert id="a-3343-11709-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-11709).</sch:assert>
			<sch:assert id="a-3343-11711-error" test="count(cda:effectiveTime[count(cda:low)=1] [count(cda:high)=1]) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-11711) such that it  SHALL contain exactly one [1..1] low (CONF:3343-11712).  SHALL contain exactly one [1..1] high (CONF:3343-11713). </sch:assert>
			<sch:assert id="a-3343-29134-error" test="count(cda:value)=0"> SHALL NOT contain [0..0] value (CONF:3343-29134). </sch:assert>
		</sch:rule>
		
		<sch:rule id="Laboratory_Test_Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:statusCode">
			<sch:assert id="a-3343-11710-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11710).	</sch:assert>
		</sch:rule>
		<sch:rule id="Laboratory_Test_Performed-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:author">
			<sch:assert id="a-3343-29125-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29125). </sch:assert>
			<sch:assert id="a-3343-29121-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29121).</sch:assert>
		</sch:rule>
		<sch:rule id="Laboratory_Test_Performed-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
			<sch:assert id="a-3343-29126-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29126).  </sch:assert>
		</sch:rule>
		<sch:rule id="Laboratory_Test_Performed-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:referenceRange">
			<sch:assert id="a-3343-29124-error" test="count(cda:observationRange)=1"> The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:3343-29124).</sch:assert>
		</sch:rule>
		<sch:rule id="Laboratory_Test_Performed-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:referenceRange/cda:observationRange">
			<sch:assert id="a-3343-29129-error" test="count(cda:code)=0"> This observationRange SHALL NOT contain [0..0] code (CONF:3343-29129).</sch:assert>
			<!-- Fix for https://tracker.esacinc.com/browse/QRDA-482,  changed =0 to =1 -->
			<sch:assert id="a-3343-29130-error" test="count(cda:value[@xsi:type='IVL_PQ'])=1"> This observationRange SHALL contain exactly one [1..1] value with @xsi:type="IVL_PQ" (CONF:3343-29130).</sch:assert>
		</sch:rule>
		
		
	</sch:pattern>
</sch:schema>
