<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Active-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Active-pattern-errors">
        <sch:rule id="Encounter-Active-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]">
            <sch:assert id="a-2228-27530-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27530).  </sch:assert>
            <sch:assert id="a-2228-27531-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27531). </sch:assert>
            <sch:assert id="a-2228-11888-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11888) such that it SSHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.21" (CONF:2228-11889). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26551).    </sch:assert>
            <sch:assert id="a-2228-27621-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27621). </sch:assert>
            <sch:assert id="a-2228-11895-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-11895). </sch:assert>
            <sch:assert id="a-2228-11898-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11898).  </sch:assert>
        </sch:rule>
 
        <sch:rule id="Encounter-Active-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]/cda:code">
            <sch:assert id="a-2228-27622-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27622).  </sch:assert>
        </sch:rule>
        
        <sch:rule id="Encounter-Active-statusCode-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]/cda:statusCode">
            <sch:assert id="a-2228-11896-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11896). </sch:assert>
         </sch:rule>

        <sch:rule id="Encounter-Active-effectiveTime-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]/cda:effectiveTime">
            <sch:assert id="a-2228-26549-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-26549). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>