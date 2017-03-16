<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Recommended-Act-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Recommended-Act-pattern-errors">
        <sch:rule id="Encounter-Recommended-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134']]">
            <sch:assert id="a-2228-28487-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28487). </sch:assert>
            <sch:assert id="a-2228-28488-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28488 </sch:assert>
            <sch:assert id="a-2228-28485-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28485) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.134" (CONF:2228-28490).  </sch:assert>
            <sch:assert id="a-2228-28491-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-28491).  </sch:assert>
            <sch:assert id="a-2228-28486-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28486) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28492).  SHALL contain exactly one [1..1] Encounter Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.24:2016-02-01) (CONF:2228-28493).  </sch:assert>
         </sch:rule>
    </sch:pattern>
    
</sch:schema>