<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Author-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Author-pattern-errors">
        <sch:rule id="Author-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-29151-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-29151) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.155" (CONF:3343-29160) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29161).</sch:assert>
            <sch:assert id="a-3343-29152-error" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:3343-29152). </sch:assert>
            <sch:assert id="a-3343-29146-error" test="count(cda:assignedAuthor)=1">SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29146).</sch:assert>
        </sch:rule>
        <sch:rule id="Author-assignedAuthor-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]/cda:assignedAuthor">
            <sch:assert id="a-3343-29147-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29147).</sch:assert>
            
        </sch:rule>
        
    </sch:pattern>
     
</sch:schema>