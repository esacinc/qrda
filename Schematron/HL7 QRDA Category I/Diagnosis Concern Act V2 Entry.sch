<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnosis_concern_act_V2-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Diagnosis_concern_act_V2-pattern-errors">
        <sch:rule id="Diagnosis_concern_act_V2-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01']]">
            <sch:assert id="a-3265-28148-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3265-28148). </sch:assert>
            <sch:assert id="a-3265-28149-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3265-28149).</sch:assert>
        	<sch:assert id="a-3265-28143-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-28143) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.137" (CONF:3265-28146). SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28692).</sch:assert>
            <sch:assert id="a-3265-28144-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3265-28144).</sch:assert>
            <sch:assert id="a-3265-28210-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3265-28210). </sch:assert>
            <sch:assert id="a-3265-28142-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135' ]])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3265-28142) such that it  SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3265-28151).  SHALL contain exactly one [1..1] Diagnosis (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.135) (CONF:3265-28145).  </sch:assert>
        </sch:rule>
        <sch:rule id="Diagnosis_concern_act_V2-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01']]/cda:statusCode">
            <sch:assert id="a-3265-28150-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet QDM Diagnosis Status urn:oid:2.16.840.1.113762.1.4.1021.35 DYNAMIC (CONF:3265-28150).</sch:assert>
        </sch:rule>
        <sch:rule id="Diagnosis_concern_act_V2-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3265-28211-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3265-28211). </sch:assert>
        </sch:rule>       
    </sch:pattern>
    
</sch:schema>