<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Principal-Diagnosis-pattern-errors" />
    </sch:phase>
    
    
    <sch:pattern id="Principal-Diagnosis-pattern-errors">
        <sch:rule id="Principal-Diagnosis-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.152'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-29004-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-29004).</sch:assert>
            <sch:assert id="a-3343-29005-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-29005).</sch:assert>
            <sch:assert id="a-3343-29006-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-29006).</sch:assert>
            <sch:assert id="a-3343-28998-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.152'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28998) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.152" (CONF:3343-29001). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29002).</sch:assert>
            <sch:assert id="a-3343-28997-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28997).</sch:assert>
            <sch:assert id="a-3343-29003-error" test="count(cda:value[@xsi:type='CD'])=1"> SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-29003).</sch:assert>
		</sch:rule>        
        <sch:rule id="Principal-Diagnosis-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.152'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-28999-error" test="@code='8319008'">This code SHALL contain exactly one [1..1] @code="8319008" Principal Diagnosis (CONF:3343-28999).</sch:assert>
            <sch:assert id="a-3343-29000-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-29000).</sch:assert>
        </sch:rule>               
    </sch:pattern>
    
    
</sch:schema>