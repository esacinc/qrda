<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Order-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Order-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Order-pattern-errors">
        <sch:rule id="Procedure-Order-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]">
            <sch:assert id="a-2228-27323" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27323).</sch:assert>
            <sch:assert id="a-2228-11097" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11097).</sch:assert>
            <sch:assert id="a-2228-11098" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.63" (CONF:2228-11099). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27083).</sch:assert>
            <sch:assert id="a-2228-27324" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27324).</sch:assert>
            <sch:assert id="a-2228-27346" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27346).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Procedure-Order-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]/cda:code">
            <sch:assert id="a-2228-27330" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27330).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Order-priorityCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]/cda:priorityCode">
            <sch:assert id="a-2228-27325" test="@sdtc:valueSet">The priorityCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27325). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Order-methodCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]/cda:methodCode">
            <sch:assert id="a-2228-27326" test="@sdtc:valueSet">The methodCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27326).  </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Order-approachSiteCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]/cda:approachSiteCode">
            <sch:assert id="a-2228-27331" test="@sdtc:valueSet">The approachSiteCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27331). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Order-targetSiteCode-translation-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]/cda:targetSiteCode/cda:translation">
            <sch:assert id="a-2228-27733" test="@sdtc:valueSet">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27733). </sch:assert>
        </sch:rule>
        
     </sch:pattern>
    
    <sch:pattern id="Procedure-Order-pattern-warnings">
        <sch:rule id="Procedure-Order-targetSiteCode-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]/cda:targetSiteCode">
            <sch:assert id="a-2228-27732" test="@sdtc:valueSet">The targetSiteCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27332). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
</sch:schema>