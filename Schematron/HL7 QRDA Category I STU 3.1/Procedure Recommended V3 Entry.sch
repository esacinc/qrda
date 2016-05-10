<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Recommended-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Recommended-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Recommended-pattern-errors">
        <sch:rule id="Procedure-Recommended-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]">
            <sch:assert id="a-2228-27337-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27337).</sch:assert>
            <sch:assert id="a-2228-11103-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11103).</sch:assert>
            <sch:assert id="a-2228-11104-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11104) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.65" (CONF:2228-11105). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27086).</sch:assert>
            <sch:assert id="a-2228-11107-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-11107).</sch:assert>
            <sch:assert id="a-2228-27352-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27352).</sch:assert>
         </sch:rule>
        
        <sch:rule id="Procedure-Recommended-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]/cda:code">
            <sch:assert id="a-2228-27654-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27654).</sch:assert>
        </sch:rule>
         <sch:rule id="Procedure-Recommended-targetSiteCode-translation-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]/cda:targetSiteCode/cda:translation">
             <sch:assert id="a-2228-27729-error" test="@sdtc:valueSet">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27729).</sch:assert>
         </sch:rule>
        
     </sch:pattern>
    
    <sch:pattern id="Procedure-Recommended-pattern-warnings">
        <sch:rule id="Procedure-Recommended-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]">
            <sch:assert id="a-2228-27312-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode (CONF:2228-27312).</sch:assert>
            
        </sch:rule>
         <sch:rule id="Procedure-Recommended-targetSiteCode-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]/cda:targetSiteCode">
             <sch:assert id="a-2228-27728-warning" test="@sdtc:valueSet">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27728). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
</sch:schema>