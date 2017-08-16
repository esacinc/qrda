<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Order-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Device-Order-pattern-errors">
        <sch:rule id="Device-Order-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27723-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27723). </sch:assert>
            <sch:assert id="a-3343-12343-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12343).  </sch:assert>
            <sch:assert id="a-3343-12344-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12344) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.9" (CONF:3343-12345). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27091). </sch:assert>
            <sch:assert id="a-3343-27721-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27721).  </sch:assert>
            <sch:assert id="a-3343-12349-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-12349) such that it  SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12350). SHALL contain exactly one [1..1] participantRole (CONF:3343-12351). </sch:assert> 
            <sch:assert id="a-3343-28665-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130'][@extension='2017-08-01'])=1">This template SHALL be contained by a Device Order Act (V2) (CONF:3343-28665).</sch:assert> 
        </sch:rule>
        <sch:rule id="Device-Order-author-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29086-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29086).  </sch:assert>
            <sch:assert id="a-3343-29085-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29085).  </sch:assert>
        </sch:rule>
        <sch:rule id="Device-Order-author-assignedAuthor-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29087-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29087). </sch:assert>
         </sch:rule>  
        <sch:rule id="Device-Order-participant-participantRole-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole">
            <sch:assert id="a-3343-12353-error" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:3343-12353). </sch:assert>
        </sch:rule>
        <sch:rule id="Device-Order-participant-participantRole-playingDevice-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole/cda:playingDevice">
            <sch:assert id="a-3343-12354-error" test="@classCode='DEV'"> This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12354).</sch:assert>
            <sch:assert id="a-3343-12355-error" test="count(cda:code)=1"> his playingDevice SHALL contain exactly one [1..1] code (CONF:3343-12355). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
</sch:schema>