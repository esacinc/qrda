<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Target-Outcome-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Target-Outcome-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Target-Outcome-pattern-errors">
        <sch:rule id="Target-Outcome-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119'][@extension='2014-12-01']]">
            <sch:assert id="a-1140-28033-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-28033). </sch:assert>
            <sch:assert id="a-1140-28034-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-28034). </sch:assert>
            <sch:assert id="a-1140-28025-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-28025) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.119" (CONF:1140-28028). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-28029). </sch:assert>
            <sch:assert id="a-1140-28035-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1140-28035). </sch:assert>
            <sch:assert id="a-1140-28026-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1140-28026).  </sch:assert>
            <sch:assert id="a-1140-28027-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1140-28027).</sch:assert>
        </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="Target-Outcome-pattern-warnings">
        <sch:rule id="Target-Outcome-code-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119'][@extension='2014-12-01']]/cda:code">
            <sch:assert id="a-1140-28390-warning" test="@sdtc:valueSet">This code SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:1140-28390).  </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>