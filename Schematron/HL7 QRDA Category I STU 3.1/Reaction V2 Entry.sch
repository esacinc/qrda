<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Reaction-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Reaction-pattern-errors">
        <sch:rule id="Reaction-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']]">
            <sch:assert id="a-1140-11332-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-11332) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.85" (CONF:1140-11333). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-27008). </sch:assert>
            <sch:assert id="a-1140-11370-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1140-11370). </sch:assert>
            <sch:assert id="a-1140-27306-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1140-27306). </sch:assert>
        </sch:rule>
        <sch:rule id="Reaction-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']]/cda:value">
            <sch:assert id="a-1140-27307-error" test="@sdtc:valueSet">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:1140-27307). </sch:assert>
        </sch:rule>                           
    </sch:pattern>
 
</sch:schema>