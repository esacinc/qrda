<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Transfer-From-pattern-errors" />
    </sch:phase>
   
    <sch:pattern id="Transfer-From-pattern-errors">
        <sch:rule id="Transfer-From-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-28306-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28306). </sch:assert>
            <sch:assert id="a-2228-28307-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28307). </sch:assert>
            <sch:assert id="a-2228-13189-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13189) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.81" (CONF:2228-13190).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-28308). </sch:assert>
            <sch:assert id="a-2228-28309-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-28309).</sch:assert>
            <sch:assert id="a-2228-28302-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28302).  </sch:assert>
            <sch:assert id="a-2228-28303-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28303).</sch:assert>
            <sch:assert id="a-2228-28304-error" test="count(cda:participant[@typeCode='ORG'][count(cda:time)=1] [count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-28304) such that it SHALL contain exactly one [1..1] @typeCode="ORG" Origin (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-28313). SHALL contain exactly one [1..1] time (CONF:2228-28305).SHALL contain exactly one [1..1] participantRole (CONF:2228-28316).   </sch:assert>
            <sch:assert id="a-2228-28663-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141'])=1">This template SHALL be contained by a Transfer From Act (CONF:2228-28663).</sch:assert> 
        </sch:rule>
        <sch:rule id="Transfer-From-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01']]/cda:code">
            <sch:assert id="a-2228-28310-error" test="@code='77305-1'">This code SHALL contain exactly one [1..1] @code="77305-1" Transferred from (CONF:2228-28310). </sch:assert>
            <sch:assert id="a-2228-28311-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28311).</sch:assert>
        </sch:rule>
        <sch:rule id="Transfer-From-statusCode-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01']]/cda:statusCode">
            <sch:assert id="a-2228-28312-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28312). </sch:assert>
         </sch:rule>
        <sch:rule id="Transfer-From-participant-time-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01']]/cda:participant[@typeCode='ORG']/cda:time">
            <sch:assert id="a-2228-28314-error" test="count(cda:low)=1">This time SHALL contain exactly one [1..1] low (CONF:2228-28314).  </sch:assert>
        </sch:rule>
        <sch:rule id="Transfer-From-participantRole-errors"  context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01']]/cda:participant[@typeCode='ORG']/cda:participantRole">
            <sch:assert id="a-2228-28320-error" test="@classCode='LOCE'">This participantRole SHALL contain exactly one [1..1] @classCode="LOCE" Located entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-28320).  </sch:assert>
            <sch:assert id="a-2228-28317-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:2228-28317).</sch:assert>
        </sch:rule>
        <sch:rule id="Transfer-From-participantRole-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01']]//cda:participant[@typeCode='ORG']/cda:participantRole[@classCode='LOCE']/cda:code">
            <sch:assert id="a-2228-28321-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28321).</sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
</sch:schema>