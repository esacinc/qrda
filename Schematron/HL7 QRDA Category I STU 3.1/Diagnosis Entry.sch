<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnosis-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Diagnosis-pattern-errors">
        <sch:rule id="Diagnosis-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135']]">
            <sch:assert id="a-2228-28510-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28510).</sch:assert>
            <sch:assert id="a-2228-28511-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28511).</sch:assert>
            <sch:assert id="a-2228-28512-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28512).</sch:assert>
            <sch:assert id="a-2228-28498-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28498) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.135" (CONF:2228-28503).</sch:assert>
            <sch:assert id="a-2228-28499-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28499).</sch:assert>
            <sch:assert id="a-2228-28500-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-28500).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Diagnosis-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135']]/cda:code">
            <sch:assert id="a-2228-28505-error" test="@code='29308-4'">This code SHALL contain exactly one [1..1] @code="29308-4" diagnosis (CONF:2228-28505). </sch:assert>
            <sch:assert id="a-2228-28506-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28506).</sch:assert>
        </sch:rule>

        <sch:rule id="Diagnosis-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135']]/cda:value">
            <sch:assert id="a-2228-28508-error" test="@sdtc:valueSet">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28508). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
</sch:schema>