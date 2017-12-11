<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Communication-From-Provider-To-Patient-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Communication-From-Provider-To-Patient-pattern-errors">
        <sch:rule id="Communication-From-Provider-To-Patient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-11840-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11840). </sch:assert>
            <sch:assert id="a-3343-11841-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11841). </sch:assert>
            <sch:assert id="a-3343-11842-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11842) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.3" (CONF:3343-11843). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27280).</sch:assert>
            <sch:assert id="a-3343-11845-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-11845).</sch:assert>
            <sch:assert id="a-3343-11846-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11846). </sch:assert>
            <sch:assert id="a-3343-26947-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-26947).</sch:assert>
            <sch:assert id="a-3343-28920-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:3343-28920). </sch:assert>
            <sch:assert id="a-3343-11850-error" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole)=1])=1"> SHALL contain exactly one [1..1] participant (CONF:3343-11850) such that it SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11851). SHALL contain exactly one [1..1] participantRole (CONF:3343-11852). </sch:assert> 
            <sch:assert id="a-3343-11856-error" test="count(cda:participant[@typeCode='IRCP'] [count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11856) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11857). SHALL contain exactly one [1..1] participantRole (CONF:3343-11858).</sch:assert> 
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Patient-participant-participantRole-recipient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole">
            <sch:assert id="a-3343-12102-error" test="@classCode='PAT'">This participantRole SHALL contain exactly one [1..1] @classCode="PAT" patient (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12102).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Patient-participant-participantRole-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole">
            <sch:assert id="a-3343-12101-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12101).</sch:assert>
            <sch:assert id="a-3343-11853-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-11853).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Patient-participant-participantRole-author-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole/cda:code">
            <sch:assert id="a-3343-26948-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-26948).</sch:assert>
            <sch:assert id="a-3343-26949-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CONF:3343-26949).</sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>