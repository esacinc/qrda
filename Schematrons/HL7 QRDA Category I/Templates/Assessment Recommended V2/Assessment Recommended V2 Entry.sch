<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Assessment_recommended-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Assessment_recommended-pattern-errors">
        <sch:rule id="Assessment_recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28682-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28682).</sch:assert>
            <sch:assert id="a-3343-28681-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28681).</sch:assert>
            <sch:assert id="a-3343-28673-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28673) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.145" (CONF:3343-28676). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28702).</sch:assert>
            <sch:assert id="a-3343-28674-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28674).</sch:assert>
            <sch:assert id="a-3343-28680-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1])=1">SHALL contain exactly one [1..1] author (CONF:3343-28680) such that it SHALL contain exactly one [1..1] time (CONF:3343-29038). SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29037).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_recommended-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2017-08-01']]/cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]/cda:assignedAuthor">
            <sch:assert id="a-3343-29039-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29039).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>