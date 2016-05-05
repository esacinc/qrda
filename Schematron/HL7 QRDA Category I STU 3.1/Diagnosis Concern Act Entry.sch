<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnosis-Concern-Act-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Diagnosis-Concern-Act-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Diagnosis-Concern-Act-pattern-errors">
        <sch:rule id="Diagnosis-Concern-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137']]">
            <sch:assert id="a-2228-28148-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28148). </sch:assert>
            <sch:assert id="a-2228-28149-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28149).</sch:assert>
            <sch:assert id="a-2228-28143-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28498) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.137" (CONF:2228-28143).</sch:assert>
            <sch:assert id="a-2228-28144-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28144).</sch:assert>
            <sch:assert id="a-2228-28210-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-28210). </sch:assert>
            <sch:assert id="a-2228-28142-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135' ]])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28142) such that it  SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28151).  SHALL contain exactly one [1..1] Diagnosis (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.135) (CONF:2228-28145).  </sch:assert>
            
        </sch:rule>
        
        <sch:rule id="Diagnosis-Concern-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137']]/cda:statusCode">
            <sch:assert id="a-2228-28150-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28150).  </sch:assert>
         </sch:rule>

        <sch:rule id="Diagnosis-Concern-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137']]/cda:effectiveTime">
            <sch:assert id="a-2228-28211-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28211). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    <sch:pattern id="Diagnosis-Concern-Act-pattern-warnings">
    </sch:pattern>
    
</sch:schema>