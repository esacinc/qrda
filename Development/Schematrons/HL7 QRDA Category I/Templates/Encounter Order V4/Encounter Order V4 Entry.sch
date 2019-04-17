<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Order-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Order-pattern-errors">
        <sch:rule id="Encounter-Order-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27534-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27534). </sch:assert>
            <sch:assert id="a-3343-11932-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11932).  </sch:assert>
            <sch:assert id="a-3343-11933-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11933) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.22" (CONF:3343-11934).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27064).   </sch:assert>
            <sch:assert id="a-3343-11936-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11936). </sch:assert>
            <sch:assert id="a-3343-27341-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27341). </sch:assert>
            <sch:assert id="a-3343-28668-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01'])=1">This template SHALL be contained by an Encounter Order Act (V2) (CONF:3343-28668).</sch:assert>
        </sch:rule>       
        <sch:rule id="Encounter-Order-author-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29023-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29023).  </sch:assert>
            <sch:assert id="a-3343-29022-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29022). </sch:assert>
        </sch:rule>
        <sch:rule id="Encounter-Order-author-assignedAuthor-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29024-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29024). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>