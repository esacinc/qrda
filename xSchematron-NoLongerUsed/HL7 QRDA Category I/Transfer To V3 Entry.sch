<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Transfer-To-pattern-errors" />
    </sch:phase>
   
    <sch:pattern id="Transfer-To-pattern-errors">
        <sch:rule id="Transfer-To-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]">
            <sch:assert id="a-2228-28358-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28358).  </sch:assert>
            <sch:assert id="a-2228-13182-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13182) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.82" (CONF:2228-13183). </sch:assert>
            <sch:assert id="a-2228-28360-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-28360).</sch:assert>
            <sch:assert id="a-2228-28352-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28352).  </sch:assert>
            <sch:assert id="a-2228-28353-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28353). </sch:assert>
            <sch:assert id="a-2228-28354-error" test="count(cda:participant[@typeCode='DST'][count(cda:time)=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-28354) such that it SHALL contain exactly one [1..1] @typeCode="DST" Destination (CONF:2228-28364). SHALL contain exactly one [1..1] time (CONF:2228-28355). </sch:assert>
            <sch:assert id="a-2228-28664-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142'])=1">This template SHALL be contained by a Transfer To Act (CONF:2228-28664).</sch:assert> 
        </sch:rule>
         <sch:rule id="Transfer-To-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]/cda:code">
            <sch:assert id="a-2228-28361-error" test="@code='77306-9'">This code SHALL contain exactly one [1..1] @code="77306-9" Discharge disposition (CONF:2228-28361). </sch:assert>
         </sch:rule>
        <sch:rule id="Transfer-To-participant-time-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]/cda:participant/cda:time">
            <sch:assert id="a-2228-28365-error" test="count(cda:low)=1">This time SHALL contain exactly one [1..1] low (CONF:2228-28365). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>