<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Problem-Concern-Act-pattern-errors" />
    </sch:phase>
 
	<sch:phase id="warnings">
		<sch:active pattern="Problem-Concern-Act-pattern-warnings" />
	</sch:phase>
	
    <sch:pattern id="Problem-Concern-Act-pattern-errors">
    	<sch:rule id="Problem-Concern-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]">
			  <sch:assert id="a-1198-9024-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9024).</sch:assert>
			  <sch:assert id="a-1198-9025-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9025).</sch:assert>
			  <sch:assert id="a-1198-16772-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-16772) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.3" (CONF:1198-16773). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32509).</sch:assert>
			  <sch:assert id="a-1198-9026-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1198-9026).</sch:assert>
			  <sch:assert id="a-1198-9027-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-9027).</sch:assert>
			  <sch:assert id="a-1198-9029-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-9029).</sch:assert>
			  <sch:assert id="a-1198-9030-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9030).</sch:assert>
    		<sch:assert id="a-1198-9034-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']])=1]) &gt;= 1">SHALL contain at least one [1..*] entryRelationship (CONF:1198-9034) such that it SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15980). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-9035).</sch:assert>
		</sch:rule>        
    	<sch:rule id="Problem-Concern-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]/cda:code">
			  <sch:assert id="a-1198-19184-error" test="@code='CONC'">This code SHALL contain exactly one [1..1] @code="CONC" Concern (CONF:1198-19184).</sch:assert>
			  <sch:assert id="a-1198-32168-error" test="@codeSystem='2.16.840.1.113883.5.6'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.6" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-32168). </sch:assert>
        </sch:rule>               
    	<sch:rule id="Problem-Concern-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]/cda:statusCode">
		  <sch:assert id="a-1198-31525-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProblemAct statusCode urn:oid:2.16.840.1.113883.11.20.9.19 STATIC (CONF:1198-31525). </sch:assert>
        </sch:rule>               
    	<sch:rule id="Problem-Concern-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]/cda:effectiveTime">
 			  <sch:assert id="a-1198-9032-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-9032).</sch:assert>
		</sch:rule>        
    </sch:pattern>
 
	<sch:pattern id="Problem-Concern-Act-pattern-warnings">
		<sch:rule id="Problem-Concern-Act-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]">
			<sch:assert id="a-1198-31146-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;= 1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31146). </sch:assert>
		</sch:rule>
	</sch:pattern>
 </sch:schema>