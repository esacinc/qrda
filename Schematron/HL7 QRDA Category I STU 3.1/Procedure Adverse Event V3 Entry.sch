<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Adverse-Event-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Adverse-Event-pattern-errors">
        <sch:rule id="Procedure-Adverse-Event-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61']]">
            <sch:assert id="a-2228-11373-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11373).</sch:assert>
            <sch:assert id="a-2228-11374-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11374).</sch:assert>
            <sch:assert id="a-2228-11375-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11375) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.61" (CONF:2228-11376). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27009).</sch:assert>
            <sch:assert id="a-2228-11377-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2228-11377).</sch:assert>
            <sch:assert id="a-2228-16419-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16419).</sch:assert>
            <sch:assert id="a-2228-11385-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11385) such that it SHALL contain exactly one [1..1] Procedure Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.64:2016-02-01) (CONF:2228-27147). SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-11386). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11387).</sch:assert>
        </sch:rule>       
        <sch:rule id="Procedure-Adverse-Event-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61']]/cda:value[@xsi:type='CD']">
            <sch:assert id="a-2228-16420-error" test="@code='281647001'">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-16420).</sch:assert>
        </sch:rule>
   </sch:pattern>
     
</sch:schema>