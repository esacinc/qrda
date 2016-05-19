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
    
    <sch:pattern id="Care-Goal-V3-pattern-errors">
        <sch:rule id="Care-Goal-V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]">
            <sch:assert id="a-2228-11245-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11245).</sch:assert>
            <sch:assert id="a-2228-11246-error" test="@moodCode='GOL'">SHALL contain exactly one [1..1] @moodCode="GOL" goal (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11246). </sch:assert>
            <sch:assert id="a-2228-28040-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28040). </sch:assert>
            <sch:assert id="a-2228-11247-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11247) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.1" (CONF:2228-11248). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27067).</sch:assert>
            <sch:assert id="a-2228-27576-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27576).</sch:assert>
            <sch:assert id="a-2228-11255-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11255). </sch:assert>
         </sch:rule>
        <sch:rule id="Care-Goal-V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]/cda:code">
            <sch:assert id="a-2228-27577-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27577). </sch:assert>
        </sch:rule>
        <sch:rule id="Care-Goal-V3-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]/cda:effectiveTime">
            <sch:assert id="a-2228-27557-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27557). Note: QDM Attribute: Start Datetime</sch:assert>
        </sch:rule>
  </sch:pattern>
</sch:schema>