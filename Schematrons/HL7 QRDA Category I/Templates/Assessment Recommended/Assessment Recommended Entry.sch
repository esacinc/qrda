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
        <sch:rule id="Assessment_recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145']]">
            <sch:assert id="a-3265-28682-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3265-28682).</sch:assert>
            <sch:assert id="a-3265-28681-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3265-28681).</sch:assert>
            <sch:assert id="a-3265-28673-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-28673) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.145" (CONF:3265-28676).</sch:assert>
            <sch:assert id="a-3265-28674-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3265-28674).</sch:assert>
            <sch:assert id="a-3265-28680-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:3265-28680) SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28702).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_recommended-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145']]/cda:code">
            <sch:assert id="a-3265-28679-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3265-28679).</sch:assert>
        </sch:rule>
        <sch:rule id="Assessment_recommended-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145']]/cda:methodCode">
            <sch:assert id="a-3265-28700-error" test="@sdtc:valueSet">The methodCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3265-28700).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>