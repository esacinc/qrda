<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Communication-From-Provider-To-Provider-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Communication-From-Provider-To-Provider-pattern-errors">
        <sch:rule id="Communication-From-Provider-To-Provider-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-11816-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11816). </sch:assert>
            <sch:assert id="a-3343-11817-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11817). </sch:assert>
            <sch:assert id="a-3343-11818-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11818) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.4" (CONF:3343-11819). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27285).</sch:assert>
            <sch:assert id="a-3343-11821-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-11821).</sch:assert>
            <sch:assert id="a-3343-26950-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-26950).</sch:assert>
            <sch:assert id="a-3343-11822-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11822). </sch:assert>
            <sch:assert id="a-3343-28921-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-28921).</sch:assert>
            <sch:assert id="a-3343-11827-error" test="count(cda:participant[@typeCode='IRCP'][count(cda:participantRole)=1])=1"> SHALL contain exactly one [1..1] participant (CONF:3343-11827) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11828) SHALL contain exactly one [1..1] participantRole (CONF:3343-11829).  </sch:assert> 
            <sch:assert id="a-3343-11837-error" test="count(cda:participant[@typeCode='AUT'] [count(cda:participantRole)=1])=1"> SHALL contain exactly one [1..1] participant (CONF:3343-11837) such that it SHALL contain exactly one [1..1] @typeCode="AUT" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11838) SHALL contain exactly one [1..1] participantRole (CONF:3343-11839). </sch:assert> 
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Provider-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-28995-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-28995). </sch:assert>
            <sch:assert id="a-3343-28994-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-28994).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Provider-author-assignedAuthor-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-28996-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-28996).</sch:assert>
        </sch:rule>   
        <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-recipient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole">
            <sch:assert id="a-3343-12096-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12096).</sch:assert>
            <sch:assert id="a-3343-11830-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-11830).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-recipient-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole/cda:code">
            <sch:assert id="a-3343-26951-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-26951).</sch:assert>
            <sch:assert id="a-3343-26952-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-26952).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole">
            <sch:assert id="a-3343-12097-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12097).</sch:assert>
            <sch:assert id="a-3343-12103-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-12103).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-author-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole/cda:code">
            <sch:assert id="a-3343-26953-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-26953).</sch:assert>
            <sch:assert id="a-3343-26954-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-26954).</sch:assert>
        </sch:rule>
        
     </sch:pattern>
    
</sch:schema>