<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="External-Document-Reference-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="External-Document-Reference-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="External-Document-Reference-pattern-errors">
        <sch:rule id="External-Document-Reference-errors" context="cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115']]">
            <sch:assert id="a-1098-31931" test="@classCode='DOCCLIN'">encounter </sch:assert>
            <sch:assert id="a-1098-31932" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31932). </sch:assert>
            <sch:assert id="a-1098-32748" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-32748) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.115" (CONF:1098-32750).SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32749).</sch:assert>
            <sch:assert id="a-1098-32751" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:1098-32751). </sch:assert>
            <sch:assert id="a-1098-31933" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31933). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="External-Document-Reference-pattern-warnings">
        <sch:rule id="External-Document-Reference-warnings" context="cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115']]">
            <sch:assert id="a-1098-32752" test="count(cda:setId)=1"> SHOULD contain zero or one [0..1] setId (CONF:1098-32752).  </sch:assert>
            <sch:assert id="a-1098-32753" test="count(cda:versionNumber)=1">  SHOULD contain zero or one [0..1] versionNumber (CONF:1098-32753).  </sch:assert>
         </sch:rule>
    </sch:pattern>
    
</sch:schema>