<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Recommended-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Encounter-Recommended-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Recommended-pattern-errors">
        <sch:rule id="Encounter-Recommended-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24']]">
            <sch:assert id="a-2228-27549" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27549). </sch:assert>
            <sch:assert id="a-2228-11911" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11911).</sch:assert>
            <sch:assert id="a-2228-11912" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.24" (CONF:2228-11913).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27066). </sch:assert>
            <sch:assert id="a-2228-11915" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-11915). </sch:assert>
            <sch:assert id="a-2228-11874" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27347). </sch:assert>
         </sch:rule>
        <sch:rule id="Encounter-Recommended-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24']]/cda:code">
            <sch:assert id="a-2228-27626" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27626). </sch:assert>
        </sch:rule>    
    </sch:pattern>
    
    <sch:pattern id="Encounter-Recommended-pattern-warnings">
    </sch:pattern>
    
</sch:schema>