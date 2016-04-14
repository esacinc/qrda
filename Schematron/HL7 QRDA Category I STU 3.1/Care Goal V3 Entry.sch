<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Care-Goal-V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Care-Goal-V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Care-Goal-V3-pattern-errors">
        <sch:rule id="Care-Goal-V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]">
            <sch:assert id="a-2228-11245" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11245).</sch:assert>
            <sch:assert id="a-2228-11246" test="@moodCode='GOL'">SHALL contain exactly one [1..1] @moodCode="GOL" goal (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11246). </sch:assert>
            <sch:assert id="a-2228-28040" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28040). </sch:assert>
            <sch:assert id="a-2228-11247" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11247) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.1" (CONF:2228-11248). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27067).</sch:assert>
            <sch:assert id="a-2228-27576" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27576).</sch:assert>
            <sch:assert id="a-2228-11255" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11255). </sch:assert>
            <sch:assert id="a-2228-11646" test="count(cda:entryRelationship[@typeCode='REFR'][count(cda:observation[@classCode='OBS'][@moodCode='EVN'][count(cda:code)=1][count(cda:value[@xsi:type='CD'][@sdtc:valueSet])=1])=1]) &lt;=1"> MAY contain zero or one [0..1] entryRelationship (CONF:2228-11646) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-13876) SHALL contain exactly one [1..1] observation (CONF:2228-11647). This observation SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11648). This observation SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11649). This observation SHALL contain exactly one [1..1] code (CONF:2228-28041). This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-11650). This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28042). </sch:assert> 
            <sch:assert id="a-1140-28008" test="count(cda:entryRelationship[@typeCode='RSON'][cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88']]]) &lt;= 1">MAY contain zero or one [0..1] entryRelationship (CONF:1140-28008) such that it SHALL contain exactly one [1..1] @typeCode="RSON" Has reason (CONF:1140-28009). SHALL contain exactly one [1..1] Reason (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.88:2014-12-01) (CONF:1140-28010).</sch:assert>
            <sch:assert id="a-2228-28036" test="count(cda:entryRelationship[@typeCode='REFR'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119' and @extension = '2014-12-01']])=1]) &lt;=1"> MAY contain zero or one [0..1] entryRelationship (CONF:2228-28036) such that it SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28037) SHALL contain exactly one [1..1] Target Outcome (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.119:2014-12-01) (CONF:2228-28038). </sch:assert> 
        </sch:rule>
        <sch:rule id="Care-Goal-V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]/cda:code">
            <sch:assert id="a-2228-27577" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27577). </sch:assert>
        </sch:rule>
        <sch:rule id="Care-Goal-V3-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]/cda:effectiveTime">
            <sch:assert id="a-2228-27557" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27557). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Care-Goal-V3-pattern-warnings">
    </sch:pattern>
    
</sch:schema>