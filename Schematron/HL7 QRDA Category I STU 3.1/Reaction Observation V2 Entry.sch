<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Reaction-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Reaction-Observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Reaction-Observation-pattern-errors">
        <sch:rule id="Reaction-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]">
            <sch:assert id="a-1098-7325-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7325).</sch:assert>
            <sch:assert id="a-1098-7326-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7326).</sch:assert>
            <sch:assert id="a-1098-7323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.9" (CONF:1098-10523). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32504).</sch:assert>
            <sch:assert id="a-1098-7329-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-7329).</sch:assert>
            <sch:assert id="a-1098-16851-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-16851).</sch:assert>
            <sch:assert id="a-1098-7328-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7328).</sch:assert>
            <sch:assert id="a-1098-7335-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1098-7335).</sch:assert>
            <sch:assert id="a-1098-11370-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-11370). </sch:assert>
         </sch:rule>
        <sch:rule id="Reaction-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]/cda:code">
            <sch:assert id="a-1098-31124-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:1098-31124).</sch:assert>
            <sch:assert id="a-1098-32169-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32169). </sch:assert>
        </sch:rule>               
        <sch:rule id="Reaction-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]/cda:statusCode">
            <sch:assert id="a-1098-19114-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19114).</sch:assert>
        </sch:rule>            
    </sch:pattern>
    
    <sch:pattern id="Reaction-Observation-pattern-warnings">
        <sch:rule id="Reaction-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]">
            <sch:assert id="a-1098-7332-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7332). </sch:assert>
         </sch:rule>        
        <sch:rule id="Reaction-Observation-effectiveTime-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]/cda:effectiveTime">
            <sch:assert id="a-1098-7333-warning" test="count(cda:low)=1">The effectiveTime, if present, SHOULD contain zero or one [0..1] low (CONF:1098-7333).</sch:assert>
            <sch:assert id="a-1098-7334-warning" test="count(cda:high)=1">The effectiveTime, if present, SHOULD contain zero or one [0..1] high (CONF:1098-7334).</sch:assert>
       </sch:rule>       
    </sch:pattern>
    
</sch:schema>