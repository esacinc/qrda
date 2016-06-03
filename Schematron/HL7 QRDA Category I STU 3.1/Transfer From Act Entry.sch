<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Transfer-From-Act-pattern-errors" />
    </sch:phase>
  
    <sch:pattern id="Transfer-From-Act-pattern-errors">
        <sch:rule id="Transfer-From-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']]">
            <sch:assert id="a-2228-28412-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28412). </sch:assert>
            <sch:assert id="a-2228-28413-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28413). </sch:assert>
            <sch:assert id="a-2228-28410-error" test="count(cda:templateId)=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28410). </sch:assert>
            <sch:assert id="a-2228-28415-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-28415).</sch:assert>
            <sch:assert id="a-2228-28411-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28411).  </sch:assert>
            <sch:assert id="a-2228-28417-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81'][@extension='2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28417) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28418). SHALL contain exactly one [1..1] Transfer From (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.81:2016-02-01) (CONF:2228-28419). </sch:assert>
         </sch:rule>
        <sch:rule id="Transfer-From-Act-templateId-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']]/cda:templateId">
            <sch:assert id="a-2228-28414-error" test="@root='2.16.840.1.113883.10.20.24.3.141'">This templateId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.141" (CONF:2228-28414). </sch:assert>
        </sch:rule>
        <sch:rule id="Transfer-From-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.141']]/cda:code">
            <sch:assert id="a-2228-28416-error" test="@code='ENC'">This code SHALL contain exactly one [1..1] @code="ENC" encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28416). </sch:assert>
         </sch:rule>
     </sch:pattern>
    
</sch:schema>