<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Discharge-Medication-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Discharge-Medication-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Discharge-Medication-pattern-errors">
        <sch:rule id="Discharge-Medication-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105']]">
            <sch:assert id="a-2228-16550" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-16550). </sch:assert>
            <sch:assert id="a-2228-16551" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-16551).</sch:assert>
            <sch:assert id="a-2228-26956" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-26956) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.105" (CONF:2228-26957). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27037). </sch:assert>
            <sch:assert id="a-2228-26955" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-26955).  </sch:assert>
            <sch:assert id="a-2228-16552" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-16552). </sch:assert>
            <sch:assert id="a-2228-16553" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16' ][@extension='2014-06-09']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-16553) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16554) SHALL contain exactly one [1..1] Medication Activity (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:2228-16555). </sch:assert>     
        </sch:rule>
        
        <sch:rule id="Discharge-Medication-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105']]/cda:code">
            <sch:assert id="a-2228-28140" test="@code='75311-1'">This code SHALL contain exactly one [1..1] @code="75311-1" Discharge medications (CONF:2228-28140). </sch:assert>
            <sch:assert id="a-2228-28141" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28141). </sch:assert>
        </sch:rule>

      </sch:pattern>
    
    <sch:pattern id="Discharge-Medication-pattern-warnings">
    </sch:pattern>
    
</sch:schema>