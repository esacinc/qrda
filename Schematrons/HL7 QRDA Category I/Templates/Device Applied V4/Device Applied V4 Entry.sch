<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Applied-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Device-Applied-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Device-Applied-pattern-errors">
        <sch:rule id="Device-Applied-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28050-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28050).  </sch:assert>
            <sch:assert id="a-3343-28051-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28051).  </sch:assert>
            <sch:assert id="a-3343-12391-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12391) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.7" (CONF:3343-12392).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27132). </sch:assert>
            <sch:assert id="a-3343-12414-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-12414).</sch:assert>
            <sch:assert id="a-3343-12394-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-12394).</sch:assert>
            <sch:assert id="a-3343-12395-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12395).  </sch:assert>
            <sch:assert id="a-3343-12396-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-12396) such that it SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12397).  SHALL contain exactly one [1..1] participantRole (CONF:3343-12398).</sch:assert> 
         </sch:rule>
        <sch:rule id="Device-Applied-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-12415-error" test="@code='360030002'">This code SHALL contain exactly one [1..1] @code="360030002" application of device (CONF:3343-12415).  </sch:assert>
            <sch:assert id="a-3343-27356-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-27536).</sch:assert>
        </sch:rule>
        <sch:rule id="Device-Applied-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:statusCode">
            <sch:assert id="a-3343-28916-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28916).</sch:assert>
        </sch:rule>
        <sch:rule id="Device-Applied-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-27537-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-27537).  </sch:assert>
        </sch:rule>  
        <sch:rule id="Device-Applied-participant-participantRole-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:participant/cda:participantRole">
            <sch:assert id="a-3343-12399-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem HL7RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12399).</sch:assert>
            <sch:assert id="a-3343-12400-error" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:3343-12400).</sch:assert>
        </sch:rule>  
        <sch:rule id="Device-Applied-participant-participantRole-playingDevice-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:participant/cda:participantRole/cda:playingDevice">
            <sch:assert id="a-3343-12401-error" test="@classCode='DEV'">This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12401).</sch:assert>
            <sch:assert id="a-3343-12402-error" test="count(cda:code)=1">This playingDevice SHALL contain exactly one [1..1] code (CONF:3343-12402). </sch:assert>
        </sch:rule>  
        <sch:rule id="Device-Applied-author-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29071-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29071). </sch:assert>
            <sch:assert id="a-3343-29070-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29070).</sch:assert>
        </sch:rule>  
        <sch:rule id="Device-Applied-author-assignedAuthor-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29072-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29072). </sch:assert>
        </sch:rule>  
    </sch:pattern>
    
    <sch:pattern id="Device-Applied-pattern-warnings">
        <sch:rule id="Device-Applied-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-12416-warning" test="count(cda:targetSiteCode)=1">SHOULD contain zero or one [0..1] targetSiteCode (CONF:3343-12416). </sch:assert>
            <sch:assert id="a-3343-28917-warning" test="count(cda:author)=1">SHOULD contain zero or one [0..1] author (CONF:3343-28917).</sch:assert>
        </sch:rule>
    </sch:pattern>
            
</sch:schema>