<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Adverse-Event-Cause-Observation-Assertion-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Adverse-Event-Cause-Observation-Assertion-pattern-errors">
        <sch:rule id="Adverse-Event-Cause-Observation-Assertion-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28741-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-28741).</sch:assert>
            <sch:assert id="a-3343-28742-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28742).</sch:assert>
            <sch:assert id="a-3343-28745-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28745).</sch:assert>
            <sch:assert id="a-3343-28731-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28731) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.148" (CONF:3343-28736). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28737).</sch:assert>
            <sch:assert id="a-3343-28730-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28730).</sch:assert>
            <sch:assert id="a-3343-28733-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28733).</sch:assert>		  
		</sch:rule> 
        
        <sch:rule id="Adverse-Event-Cause-Observation-Assertion-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-28734-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28734).</sch:assert>
            <sch:assert id="a-3343-28735-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28735).</sch:assert>
        </sch:rule>
</sch:schema>