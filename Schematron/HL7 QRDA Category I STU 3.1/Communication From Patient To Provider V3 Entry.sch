<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Comm-Patient-To-Provider-V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Comm-Patient-To-Provider-V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Comm-Patient-To-Provider-V3-pattern-errors">
        <sch:rule id="Comm-Patient-To-Provider-V3-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]">
            <sch:assert id="a-2228-11484" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11484). </sch:assert>
            <sch:assert id="a-2228-11485" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11485). </sch:assert>
            <sch:assert id="a-2228-28043" test="count(@negationInd)&lt;=1">MAY contain zero or one [0..1] @negationInd (CONF:2228-28043).</sch:assert>
            <sch:assert id="a-2228-11486" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11486) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.2" (CONF:2228-11487). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27275).</sch:assert>
            <sch:assert id="a-2228-11619" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-11619).</sch:assert>
            <sch:assert id="a-2228-26946" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27576).</sch:assert>
            <sch:assert id="a-2228-11620" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11620). </sch:assert>
            <sch:assert id="a-2228-11622" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11622).</sch:assert>
            <sch:assert id="a-2228-11631" test="count(cda:participant[@typeCode='IRCP'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:code[@code='158965000'][@codeSystem='2.16.840.1.113883.6.96'])=1])=1])=1"> SHALL contain exactly one [1..1] participant (CONF:2228-11631) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11632) SHALL contain exactly one [1..1] participantRole (CONF:2228-11633). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12098). This participantRole SHALL contain exactly one [1..1] code (CONF:2228-11651). This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:2228-27272). This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26945).    </sch:assert> 
            <sch:assert id="a-2228-11835" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole[@classCode='PAT'])=1])=1"> SHALL contain exactly one [1..1] participant (CONF:2228-11835) such that it SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12099)SHALL contain exactly one [1..1] participantRole (CONF:2228-11836).  This participantRole SHALL contain exactly one [1..1] @classCode="PAT" patient (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12100).   </sch:assert> 
        </sch:rule>
        <sch:rule id="Comm-Patient-To-Provider-V3-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]/cda:code">
            <sch:assert id="a-2228-27578" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27578).</sch:assert>
        </sch:rule>
        <sch:rule id="Comm-Patient-To-Provider-V3-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]/cda:effectiveTime">
            <sch:assert id="a-2228-27543" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27543). </sch:assert>
            <sch:assert id="a-2228-27544" test="count(cda:high)&lt;=1">This effectiveTime MAY contain zero or one [0..1] high (CONF:2228-27544). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Comm-Patient-To-Provider-V3-pattern-warnings">
    </sch:pattern>
    
</sch:schema>