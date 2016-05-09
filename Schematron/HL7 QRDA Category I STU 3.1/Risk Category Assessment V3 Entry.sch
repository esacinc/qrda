<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Risk-Category-Assessment-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Risk-Category-Assessment-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Risk-Category-Assessment-pattern-errors">
        <sch:rule id="Risk-Category-Assessment-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]">
            <sch:assert id="a-2228-28104-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28104).</sch:assert>
            <sch:assert id="a-2228-28105-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28105).</sch:assert>
            <sch:assert id="a-2228-12496-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12496) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.69" (CONF:2228-12497). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27299).</sch:assert>
            <sch:assert id="a-2228-27660-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27660).</sch:assert>
            <sch:assert id="a-2228-28407-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-28407).</sch:assert>
        </sch:rule>
        <sch:rule id="Risk-Category-Assessment-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]/cda:code">
            <sch:assert id="a-2228-27661-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27661).</sch:assert>
        </sch:rule>               
        <sch:rule id="Risk-Category-Assessment-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]/cda:effectiveTime">
            <sch:assert id="a-2228-28408-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28408).</sch:assert>
        </sch:rule>               
    </sch:pattern>
    
    <sch:pattern id="Risk-Category-Assessment-pattern-warnings">
    </sch:pattern>
</sch:schema>