<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnostic-Study-Order-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Diagnostic-Study-Order-pattern-errors">
        <sch:rule id="Diagnostic-Study-Order-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27408-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27408). </sch:assert>
            <sch:assert id="a-3343-13411-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13411).</sch:assert>
            <sch:assert id="a-3343-13412-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-13412) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.17" (CONF:3343-13413). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27069). </sch:assert>
            <sch:assert id="a-3343-27615-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27615). </sch:assert>
            <sch:assert id="a-3343-27340-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27340) such that it  SHALL contain exactly one [1..1] time (CONF:3343-29041).  . SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29040).</sch:assert>     
        </sch:rule>       
        <sch:rule id="Diagnostic-Study-Order-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29042-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29042).  </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>