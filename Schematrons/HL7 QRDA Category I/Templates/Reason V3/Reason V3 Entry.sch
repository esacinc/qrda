<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Reason-pattern-errors" />
    </sch:phase>
     
    <sch:pattern id="Reason-pattern-errors">
        <sch:rule id="Reason-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-11357-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11357).</sch:assert>
            <sch:assert id="a-3343-11358-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11358). </sch:assert>
            <sch:assert id="a-3343-11359-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11359) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.88" (CONF:3343-11360). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27027). </sch:assert>
            <sch:assert id="a-3343-11361-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11361). </sch:assert>
            <sch:assert id="a-3343-11367-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-11367). </sch:assert>
        </sch:rule>
        <sch:rule id="Reason-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-11362-error" test="@code='77301-0'">This code SHALL contain exactly one [1..1] @code="77301-0" Reason care action performed or not (CONF:3343-11362). </sch:assert>
            <sch:assert id="a-3343-27028-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-27028).</sch:assert>
        </sch:rule>               
        <sch:rule id="Reason-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']]/cda:statusCode">
            <sch:assert id="a-3343-11365-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11365). </sch:assert>
        </sch:rule>
        <sch:rule id="Reason-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-27551-error" test="count(cda:low)=1"> The effectiveTime, if present, SHALL contain exactly one [1..1] low (CONF:3343-27551).</sch:assert>
         </sch:rule>
    </sch:pattern>
    
 
</sch:schema>