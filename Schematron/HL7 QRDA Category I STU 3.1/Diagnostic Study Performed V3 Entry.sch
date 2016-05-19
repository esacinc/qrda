<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnostic-Study-Performed-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Diagnostic-Study-Performed-pattern-errors">
        <sch:rule id="Diagnostic-Study-Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]">
            <sch:assert id="a-2228-27369-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27369). </sch:assert>
            <sch:assert id="a-2228-12950-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12950).</sch:assert>
            <sch:assert id="a-2228-12951-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12951) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.18" (CONF:2228-12952). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27141). </sch:assert>
            <sch:assert id="a-2228-27617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27617). </sch:assert>
            <sch:assert id="a-2228-12956-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-12956).  </sch:assert>     
            <sch:assert id="a-2228-12958-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12958).   </sch:assert>     
        </sch:rule>
        
        <sch:rule id="Diagnostic-Study-Performed-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]/cda:code">
            <sch:assert id="a-2228-27618-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27618). </sch:assert>
         </sch:rule>

        <sch:rule id="Diagnostic-Study-Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]/cda:statusCode">
            <sch:assert id="a-2228-12957-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12957). </sch:assert>
        </sch:rule>
        
        <sch:rule id="Diagnostic-Study-Performed-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]/cda:effectiveTime">
            <sch:assert id="a-2228-12959-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-12959).  </sch:assert>
            <sch:assert id="a-2228-12960-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-12960). </sch:assert>
        </sch:rule>      
    </sch:pattern>
</sch:schema>