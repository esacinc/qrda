<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Reporting_Stratum_CMS-pattern-errors" />
    </sch:phase>
 
    <sch:phase id="warnings">
        <sch:active pattern="Reporting_Stratum_CMS-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Reporting_Stratum_CMS-pattern-errors">
        <sch:rule id="Reporting_Stratum_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]">
            <sch:assert id="a-1109-17575-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1109-17575).</sch:assert>
            <sch:assert id="a-1109-17576-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1109-17576).</sch:assert>
            <sch:assert id="a-1109-711274-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-711274) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.20" (CONF:1109-711275).</sch:assert>
            <sch:assert id="a-1109-18093-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-18093) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.4" (CONF:1109-18094).</sch:assert>
            <sch:assert id="a-1109-17577-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1109-17577).</sch:assert>
            <sch:assert id="a-1109-17579-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1109-17579).</sch:assert>
            <sch:assert id="a-1109-17581-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:1109-17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:1109-17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:1109-17583). SHALL contain exactly one [1..1] Aggregate Count - CMS (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:1109-711197).</sch:assert>
            <sch:assert id="a-1109-18204-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:1109-18204).</sch:assert>
         </sch:rule>
        
        <sch:rule id="Reporting_Stratum_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:code">
            <sch:assert id="a-1109-17578-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1109-17578).</sch:assert>
            <sch:assert id="a-1109-21169-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1109-21169).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Reporting_Stratum_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:statusCode">
            <sch:assert id="a-1109-18201-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1109-18201).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Reporting_Stratum_CMS-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:reference">
            <sch:assert id="a-1109-18205-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1109-18205).</sch:assert>
            <sch:assert id="a-1109-18206-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:1109-18206).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Reporting_Stratum_CMS-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:reference/cda:externalObservation">
            <sch:assert id="a-1109-18207-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:1109-18207).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Reporting_Stratum_CMS-pattern-warnings">
        <sch:rule id="Reporting_Stratum_CMS-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]">
            <sch:assert id="a-1109-17580-warning" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:1109-17580).</sch:assert>
        </sch:rule>
    </sch:pattern> 
</sch:schema>