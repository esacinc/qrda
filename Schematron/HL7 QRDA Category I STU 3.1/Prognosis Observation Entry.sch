<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Prognosis-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Prognosis-Observation-pattern-errors">
        <sch:rule id="Prognosis-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]">
            <sch:assert id="a-1098-29035-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-29035).</sch:assert>
            <sch:assert id="a-1098-29036-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-29036).</sch:assert>
            <sch:assert id="a-1098-29037-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-29037) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.113" (CONF:1098-29038).</sch:assert>
            <sch:assert id="a-1098-29439-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] value (CONF:1098-29439).</sch:assert>
            <sch:assert id="a-1098-31350-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31350).</sch:assert>
            <sch:assert id="a-1098-31123-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31123).</sch:assert>
            <sch:assert id="a-1098-29469-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1098-29469). </sch:assert>
         </sch:rule>
        <sch:rule id="Prognosis-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]/cda:code">
            <sch:assert id="a-1098-29468-error" test="@code='75328-5'">This code SHALL contain exactly one [1..1] @code="75328-5" Prognosis (CONF:1098-29468). </sch:assert>
            <sch:assert id="a-1098-31349-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31349). </sch:assert>
        </sch:rule>       
        <sch:rule id="Prognosis-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]/cda:statusCode">
            <sch:assert id="a-1098-31351-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31351).</sch:assert>
        </sch:rule>       
     </sch:pattern>
   
</sch:schema>