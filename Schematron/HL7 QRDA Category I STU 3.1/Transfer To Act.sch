<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Transfer-To-Act-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Transfer-To-Act-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Transfer-To-Act-pattern-errors">
        <sch:rule id="Transfer-To-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']]">
            <sch:assert id="a-2228-28426-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28426).  </sch:assert>
            <sch:assert id="a-2228-28427-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28427).  </sch:assert>
            <sch:assert id="a-2228-28421-error" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28421).  </sch:assert>
            <sch:assert id="a-2228-28428-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-28428).</sch:assert>
            <sch:assert id="a-2228-28422-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28422).  </sch:assert>
            <sch:assert id="a-2228-28420-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82'][@extension='2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28420) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28429). SHALL contain exactly one [1..1] Transfer To (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.82:2016-02-01) (CONF:2228-28423). </sch:assert>
        </sch:rule>
        <sch:rule id="Transfer-To-Act-templateId-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']]/cda:templateId">
            <sch:assert id="a-2228-28424-error" test="@root='2.16.840.1.113883.10.20.24.3.142'">This templateId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.142" (CONF:2228-28424). </sch:assert>
        </sch:rule>
        
         <sch:rule id="Transfer-To-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.142']]/cda:code">
             <sch:assert id="a-2228-28425-error" test="@code='ENC'">This code SHALL contain exactly one [1..1] @code="ENC" encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28425).</sch:assert>
         </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="Transfer-To-Act-pattern-warnings">
    </sch:pattern>
</sch:schema>