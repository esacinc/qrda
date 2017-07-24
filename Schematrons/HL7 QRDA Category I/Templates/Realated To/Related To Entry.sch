<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Related-To-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Related-To-pattern-errors">
        <sch:rule id="Related-To-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28950-error" test="@classCode='OBS'"> SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28950).</sch:assert>
            <sch:assert id="a-3343-28951-error" test="@moodCode='EVN'"> SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28951).</sch:assert>
            <sch:assert id="a-3343-28945-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28945) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.150" (CONF:3343-28947) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28948). </sch:assert>
            <sch:assert id="a-3343-28946-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28946).</sch:assert>
            <sch:assert id="a-3343-28949-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:3343-28949). </sch:assert>
        </sch:rule>
     </sch:pattern>
 
</sch:schema>