<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Order-Act-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Order-Act-pattern-errors">
        <sch:rule id="Encounter-Order-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28469-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28469). </sch:assert>
            <sch:assert id="a-3343-28470-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28470).  </sch:assert>
            <sch:assert id="a-3343-28467-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28467) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.132" (CONF:3343-28471). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28812).</sch:assert>
            <sch:assert id="a-3343-28810-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28810).</sch:assert>
            <sch:assert id="a-3343-28468-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28468) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28473).  SHALL contain exactly one [1..1] Encounter Order (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.22:2017-08-01) (CONF:3343-28474). </sch:assert>
         </sch:rule>
        <sch:rule id="Encounter-Order-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-28811-error" test="@code='ENC'">This code SHALL contain exactly one [1..1] @code="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28811).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>