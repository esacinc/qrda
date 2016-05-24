<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Problem-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Problem-Observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Problem-Observation-pattern-errors">
		<sch:rule id="Problem-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]">
		  <sch:assert id="a-1198-9041-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9041).</sch:assert>
		  <sch:assert id="a-1198-9042-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9042).</sch:assert>
		  <sch:assert id="a-1198-14926-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14926) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.4" (CONF:1198-14927). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32508).</sch:assert>
		  <sch:assert id="a-1198-9043-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1198-9043).</sch:assert>
		  <sch:assert id="a-1198-9045-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-9045).</sch:assert>
		  <sch:assert id="a-1198-9049-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-9049).</sch:assert>
		  <sch:assert id="a-1198-9050-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9050).</sch:assert>
		  <sch:assert id="a-1198-9058-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1198-9058).</sch:assert>

		</sch:rule>
        
        <sch:rule id="Problem-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]/cda:code">
		  <sch:assert id="a-1198-32848-error" test="count(cda:translation) &gt;= 1">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 2014-09-02 (CONF:1198-32848).</sch:assert>
        </sch:rule>               
        <sch:rule id="Problem-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]/cda:statusCode">
		  <sch:assert id="a-1198-19112-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19112).</sch:assert>
        </sch:rule>               
       <sch:rule id="Problem-Observation-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]/cda:effectiveTime">
 		  <sch:assert id="a-1198-15603-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-15603).</sch:assert>
       </sch:rule>
         
    </sch:pattern>
    
    <sch:pattern id="Problem-Observation-pattern-warnings">
         
        <sch:rule id="Problem-Observation-participant-participantRole-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]">
 		  <sch:assert id="a-1198-28221-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31147). </sch:assert>
        </sch:rule>  
 
         
    </sch:pattern>
</sch:schema>