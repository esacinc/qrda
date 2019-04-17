<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Assessment_performed-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Assessment_performed-pattern-errors">
        <sch:rule id="Assessment_performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28670-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28670).</sch:assert>
            <sch:assert id="a-3343-28669-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28669).</sch:assert>
            <sch:assert id="a-3343-28652-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28652) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.144" (CONF:3343-28660) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28701).</sch:assert>
            <sch:assert id="a-3343-28656-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28656).</sch:assert>
            <sch:assert id="a-3343-28653-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28653).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]/cda:statusCode">
            <sch:assert id="a-3343-28662-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28662).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_performed-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-28986-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-28986).</sch:assert>
            <sch:assert id="a-3343-28985-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-28985).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_performed-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-28987-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-28987).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>