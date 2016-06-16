<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Performed-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Performed-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Performed-pattern-errors">
        <sch:rule id="Procedure-Performed-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-27308-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27308).</sch:assert>
            <sch:assert id="a-2228-11261-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11261).</sch:assert>
            <sch:assert id="a-2228-11262-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11262) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.64" (CONF:2228-11263). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27129).</sch:assert>
            <sch:assert id="a-2228-27309-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27309).</sch:assert>
            <sch:assert id="a-2228-27305-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-27305).</sch:assert>
            <sch:assert id="a-2228-11669-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11669).</sch:assert>
        </sch:rule>        
        <sch:rule id="Procedure-Performed-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]/cda:code">
            <sch:assert id="a-2228-27310-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27310).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]/cda:statusCode">
            <sch:assert id="a-2228-27367-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-27367).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]/cda:effectiveTime">
            <sch:assert id="a-2228-11670-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-11670).</sch:assert>
            <sch:assert id="a-2228-11671-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-11671).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-approachSiteCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]/cda:approachSiteCode">
            <sch:assert id="a-2228-27313-error" test="@sdtc:valueSet">The approachSiteCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27313). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-targetSiteCode-translation-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]/cda:targetSiteCode/cda:translation">
            <sch:assert id="a-2228-27766-error" test="@sdtc:valueSet">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27766).  </sch:assert>
        </sch:rule>       
     </sch:pattern>
    
    <sch:pattern id="Procedure-Performed-pattern-warnings">
        <sch:rule id="Procedure-Performed-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-27312-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode (CONF:2228-27312).</sch:assert>           
        </sch:rule>
        <sch:rule id="Procedure-Performed-targetSiteCode-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2016-02-01']]/cda:targetSiteCode">
             <sch:assert id="a-2228-27314-warning" test="@sdtc:valueSet">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27314). </sch:assert>
        </sch:rule>       
    </sch:pattern>
    
</sch:schema>