<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Recommended-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Recommended-pattern-errors">
        <sch:rule id="Encounter-Recommended-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27549-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27549). </sch:assert>
            <sch:assert id="a-3343-11911-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11911).</sch:assert>
            <sch:assert id="a-3343-11912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.24" (CONF:3343-11913).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27066). </sch:assert>
            <sch:assert id="a-3343-11915-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11915). </sch:assert>
            <sch:assert id="a-3343-27347-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27347).</sch:assert>
            <sch:assert id="a-3343-28813-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134'][@extension='2017-08-01'])=1"> This template SHALL be contained by an Encounter Recommended Act (V2) (CONF:3343-28813).</sch:assert> 
        </sch:rule>
        <sch:rule id="Encounter-Recommended-author-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29026-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29026). </sch:assert>
            <sch:assert id="a-3343-29025-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29025). </sch:assert>
        </sch:rule>    
        <sch:rule id="Encounter-Recommended-author-assignedAuthor-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29027-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29027). </sch:assert>
        </sch:rule>
            
    </sch:pattern>
    
</sch:schema>