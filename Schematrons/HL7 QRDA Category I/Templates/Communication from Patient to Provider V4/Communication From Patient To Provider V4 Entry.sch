<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Communication-From-Patient-To-Provider-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Communication-From-Patient-To-Provider-pattern-errors">
        <sch:rule id="Communication-From-Patient-To-Provider-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-11484-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11484). </sch:assert>
            <sch:assert id="a-3343-11485-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11485). </sch:assert>
            <sch:assert id="a-3343-11486-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11486) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.2" (CONF:3343-11487). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27275).</sch:assert>
            <sch:assert id="a-3343-11619-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-11619).</sch:assert>
            <sch:assert id="a-3343-26946-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-26946). </sch:assert>
            <sch:assert id="a-3343-11620-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11620). </sch:assert>
            <sch:assert id="a-3343-28919-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-28919).</sch:assert>
            <sch:assert id="a-3343-11835-error" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11835) such that it SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12099). SHALL contain exactly one [1..1] participantRole (CONF:3343-11836). </sch:assert> 
            <sch:assert id="a-3343-11631-error" test="count(cda:participant[@typeCode='IRCP'] [count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11631) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11632). SHALL contain exactly one [1..1] participantRole (CONF:3343-11633).</sch:assert> 
        </sch:rule>
        <sch:rule id="Communication-From-Patient-To-Provider-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-28989-error" test="count(cda:time)=1"> This author SHALL contain exactly one [1..1] time (CONF:3343-28989).</sch:assert>
            <sch:assert id="a-3343-28988-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-28988).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Patient-To-Provider-author-assignedAuthor-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-28990-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-28990). </sch:assert>
        </sch:rule>   
        <sch:rule id="Communication-From-Patient-To-Provider-participant-participantRole-recipient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole">
            <sch:assert id="a-3343-12098-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12098).</sch:assert>
            <sch:assert id="a-3343-11651-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-11651).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Patient-To-Provider-participant-participantRole-recipient-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole/cda:code">
            <sch:assert id="a-3343-27272-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-27272).</sch:assert>
            <sch:assert id="a-3343-26945-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-26945).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Patient-To-Provider-participant-participantRole-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole">
            <sch:assert id="a-3343-12100-error" test="@classCode='PAT'">This participantRole SHALL contain exactly one [1..1] @classCode="PAT" patient (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12100).</sch:assert>
        </sch:rule>
         
     </sch:pattern>
    
</sch:schema>