<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnostic-Study-Recommended-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Diagnostic-Study-Recommended-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Diagnostic-Study-Recommended-pattern-errors">
        <sch:rule id="Diagnostic-Study-Recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19']]">
            <sch:assert id="a-2228-27406-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27406). </sch:assert>
            <sch:assert id="a-2228-13392-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13392).</sch:assert>
            <sch:assert id="a-2228-13393-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13393) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.19" (CONF:2228-13394). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27070). </sch:assert>
            <sch:assert id="a-2228-27619-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27619). </sch:assert>
            <sch:assert id="a-2228-13400-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-13400).</sch:assert>     
         </sch:rule>
        
        <sch:rule id="Diagnostic-Study-Recommended-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19']]/cda:code">
            <sch:assert id="a-2228-27620-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27620). </sch:assert>
         </sch:rule>

      </sch:pattern>
    
    <sch:pattern id="Diagnostic-Study-Recommended-pattern-warnings">
    </sch:pattern>
    
</sch:schema>