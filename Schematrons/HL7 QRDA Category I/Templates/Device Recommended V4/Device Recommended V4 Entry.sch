<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Recommended-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Device-Recommended-pattern-errors">
        <sch:rule id="Device-Recommended-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27722-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27722). </sch:assert>
            <sch:assert id="a-3343-12368-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12368). </sch:assert>
            <sch:assert id="a-3343-12369-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.10" (CONF:3343-12370). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27094). </sch:assert>
            <sch:assert id="a-3343-27719-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27719).</sch:assert>
            <sch:assert id="a-3343-12374-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-12374) such that it SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12375).SHALL contain exactly one [1..1] participantRole (CONF:3343-12376). </sch:assert> 
            <sch:assert id="a-3343-28666-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131'][@extension='2017-08-01'])=1">This template SHALL be contained by a Device Recommended Act (V2) (CONF:3343-28666).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Device-Recommended-author-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29062-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29062). </sch:assert>
            <sch:assert id="a-3343-29061-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29061).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Device-Recommended-author-assignedAuthor-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29063-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29063).  </sch:assert>
        </sch:rule>
        
        <sch:rule id="Device-Recommended-participant-participantRole-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole">
            <sch:assert id="a-3343-12377-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem HL7RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12377).</sch:assert>
            <sch:assert id="a-3343-12378-error" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:3343-12378).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Device-Recommended-participant-participantRole-playingDevice-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole/cda:playingDevice">
            <sch:assert id="a-3343-12379-error" test="@classCode='DEV'">This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12379).</sch:assert>
            <sch:assert id="a-3343-12380-error" test="count(cda:code)=1">This playingDevice SHALL contain exactly one [1..1] code (CONF:3343-12380). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
</sch:schema>