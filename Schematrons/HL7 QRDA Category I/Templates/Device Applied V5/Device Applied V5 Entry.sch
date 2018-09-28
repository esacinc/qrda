<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
   
    <!-- Updated 09-25-2018 for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460  
         Changed assert prefixes,  new extension -->
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Applied-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Device-Applied-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Device-Applied-pattern-errors">
        <sch:rule id="Device-Applied-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-28050-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4388-28050).  </sch:assert>
            <sch:assert id="a-4388-28051-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4388-28051).  </sch:assert>
            <sch:assert id="a-4388-12391-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-12391) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.7" (CONF:4388-12392).  SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-27132). </sch:assert>
            <sch:assert id="a-4388-12414-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4388-12414).</sch:assert>
            <sch:assert id="a-4388-12394-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:4388-12394).</sch:assert>
            <sch:assert id="a-4388-12395-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:4388-12395).  </sch:assert>
            <sch:assert id="a-4388-12396-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:4388-12396) such that it SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:4388-12397).  SHALL contain exactly one [1..1] participantRole (CONF:4388-12398).</sch:assert> 
         </sch:rule>
        <sch:rule id="Device-Applied-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01']]/cda:code">
            <sch:assert id="a-4388-12415-error" test="@code='360030002'">This code SHALL contain exactly one [1..1] @code="360030002" application of device (CONF:4388-12415).  </sch:assert>
            <sch:assert id="a-4388-27356-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:4388-27536).</sch:assert>
        </sch:rule>
        <sch:rule id="Device-Applied-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01']]/cda:statusCode">
            <sch:assert id="a-4388-29140-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4388-29140).</sch:assert>
        </sch:rule>
        <sch:rule id="Device-Applied-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01']]/cda:effectiveTime">
            <sch:assert id="a-4388-27537-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:4388-27537).  </sch:assert>
        </sch:rule>  
        <sch:rule id="Device-Applied-participant-participantRole-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01']]/cda:participant[@typeCode='DEV']/cda:participantRole">
            <sch:assert id="a-4388-12399-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem HL7RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:4388-12399).</sch:assert>
            <sch:assert id="a-4388-12400-error" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:4388-12400).</sch:assert>
        </sch:rule>  
        <sch:rule id="Device-Applied-participant-participantRole-playingDevice-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01']]/cda:participant[@typeCode='DEV']/cda:participantRole[@classCode='MANU']/cda:playingDevice">
            <sch:assert id="a-4388-12401-error" test="@classCode='DEV'">This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:4388-12401).</sch:assert>
            <sch:assert id="a-4388-12402-error" test="count(cda:code)=1">This playingDevice SHALL contain exactly one [1..1] code (CONF:4388-12402). </sch:assert>
        </sch:rule>  
    </sch:pattern>
    
    <sch:pattern id="Device-Applied-pattern-warnings">
        <sch:rule id="Device-Applied-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-12416-warning" test="count(cda:targetSiteCode)=1">SHOULD contain zero or one [0..1] targetSiteCode (CONF:4388-12416). </sch:assert>
        </sch:rule>
    </sch:pattern>
            
</sch:schema>