<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Applied-V3-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Device-Applied-V3-pattern-errors">
        <sch:rule id="Device-Applied-V3-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]">
            <sch:assert id="a-2228-28050-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28050).  </sch:assert>
            <sch:assert id="a-2228-28051-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28051).  </sch:assert>
            <sch:assert id="a-2228-12391-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12391) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.7" (CONF:2228-12392).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27132). </sch:assert>
            <sch:assert id="a-2228-12414-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-12414).</sch:assert>
            <sch:assert id="a-2228-12394-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12394)</sch:assert>
            <sch:assert id="a-2228-12395-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12395).  </sch:assert>
            <sch:assert id="a-2228-12398-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code[@sdtc:valueSet])=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-12396) such that it SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12397). SHALL contain exactly one [1..1] participantRole (CONF:2228-12398). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12399). This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12400). This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12401). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12402). This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27584).       </sch:assert> 
         </sch:rule>
 
        <sch:rule id="Device-Applied-V3-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]/cda:code">
            <sch:assert id="a-2228-12415-error" test="@code='360030002'">This code SHALL contain exactly one [1..1] @code="360030002" application of device (CONF:2228-12415).  </sch:assert>
            <sch:assert id="a-2228-27356-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-27536).</sch:assert>
        </sch:rule>

        <sch:rule id="Device-Applied-V3-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]/cda:effectiveTime">
            <sch:assert id="a-2228-27537-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27537).  </sch:assert>
        </sch:rule>
        
        <sch:rule id="Device-Applied-V3-entryRelationship-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]/cda:entryRelationship">
            <sch:assert id="a-2228-12404-error" test="@typeCode='RSON'">SHALL contain exactly one [1..1] @typeCode="RSON" has reason, which SHALL be selected from CodeSystem HL7ActRelationshipType (urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-12404).  </sch:assert>
            <sch:assert id="a-2228-27131-error" test="count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2014-12-01']])=1">SHALL contain exactly one [1..1] Reason (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.88:2014-12-01) (CONF:2228-27131).  </sch:assert>
        </sch:rule>
        
        <sch:rule id="Device-Applied-V3-targetSiteCode-translation-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]/cda:targetSiteCode/cda:translation">
            <sch:assert id="a-2228-27731-error" test="@sdtc:valueSet"> The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27731). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    <sch:pattern id="Device-Applied-V3-pattern-warnings">
        <sch:rule id="Device-Applied-V3-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]">
            <sch:assert id="a-2228-12416-warning" test="count(cda:targetSiteCode)=1">SHOULD contain zero or one [0..1] targetSiteCode (CONF:2228-12416). </sch:assert>
        </sch:rule>
        <sch:rule id="Device-Applied-V3-targetSiteCode-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]/cda:targetSiteCode">
            <sch:assert id="a-2228-27730-warning" test="@sdtc:valueSet">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27730). </sch:assert>
        </sch:rule>
    </sch:pattern>
            
</sch:schema>