<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Component-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Component-pattern-errors">
        <sch:rule id="Component-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28788-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3343-28788).</sch:assert>
            <sch:assert id="a-3343-28789-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3343-28789). </sch:assert>
            <sch:assert id="a-3343-28786-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28786) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.149" (CONF:3343-28793).SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28796). </sch:assert>
            <sch:assert id="a-3343-28784-error" test="count(cda:code)=1"> SHALL contain exactly one [1..1] code (CONF:3343-28784). </sch:assert>
            <sch:assert id="a-3343-28797-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-28797).</sch:assert>
            <sch:assert id="a-3343-28785-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:3343-28785). </sch:assert>
        </sch:rule>
        <sch:rule id="Component-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01']]/cda:referenceRange">
            <sch:assert id="a-3343-28795-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:3343-28795).</sch:assert>
        </sch:rule>
        <sch:rule id="Component-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01']]/cda:referenceRange/cda:observationRange">
            <sch:assert id="a-3343-28798-error" test="count(cda:code)=0">This observationRange SHALL NOT contain [0..0] code (CONF:3343-28798).</sch:assert>
            <sch:assert id="a-3343-28799-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:3343-28799).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>