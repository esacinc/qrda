<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Performance_Rate-pattern-errors" />
    </sch:phase>
 
    <sch:pattern id="Performance_Rate-pattern-errors">
        <sch:rule id="Performance_Rate-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01']]">
            <sch:assert id="a-3259-21303-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21303).</sch:assert>
            <sch:assert id="a-3259-21304-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21304).</sch:assert>
            <sch:assert id="a-3259-21298-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21298) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.30" (CONF:3259-21310). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21441).</sch:assert>
            <sch:assert id="a-3259-21294-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-21294).</sch:assert>
            <sch:assert id="a-3259-21297-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-21297).</sch:assert>
            <sch:assert id="a-3259-21307-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:3259-21307).</sch:assert>
         </sch:rule>
        
        <sch:rule id="Performance_Rate-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01']]/cda:code">
            <sch:assert id="a-3259-21305-error" test="@code='72510-1'">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:3259-21305).</sch:assert>
            <sch:assert id="a-3259-21306-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3259-21306).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Performance_Rate-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.30'][@extension='2016-09-01']]/cda:statusCode">
            <sch:assert id="a-3259-21309-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18422).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>