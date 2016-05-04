<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Diagnosis-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Encounter-Diagnosis-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Diagnosis-pattern-errors">
        <sch:rule id="Encounter-Diagnosis-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80']]">
            <sch:assert id="a-1198-14889-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14889).  </sch:assert>
            <sch:assert id="a-1198-14890-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14890).   </sch:assert>
            <sch:assert id="a-1198-14895-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14895) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.80" (CONF:1198-14896). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32542). </sch:assert>
            <sch:assert id="a-1198-19182-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-19182). </sch:assert>
            <sch:assert id="a-1198-7492-error" test="count(cda:entryRreplationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']])=1])=1">SHALL contain at least one [1..*] entryRelationship (CONF:1198-14892) such that it  SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14893). SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14898). </sch:assert>
        </sch:rule>
        
        <sch:rule id="Encounter-Diagnosis-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80']]/cda:code">
            <sch:assert id="a-1198-14896-error" test="@code='29308-4'">This code SHALL contain exactly one [1..1] @code="29308-4" Diagnosis (CONF:1198-19183). </sch:assert>
            <sch:assert id="a-1198-32160-error" test="@codeSystem='2.16.840.1.113883.6.1'"> This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32160). </sch:assert>
        </sch:rule>

    </sch:pattern>
    
    <sch:pattern id="Encounter-Diagnosis-pattern-warnings">
    </sch:pattern>
    
</sch:schema>