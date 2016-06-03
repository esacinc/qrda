<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Order-Act-V3-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Device-Order-Act-V3-pattern-errors">
        <sch:rule id="Device-Order-Act-V3-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130']]">
            <sch:assert id="a-2228-28444-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28444). </sch:assert>
            <sch:assert id="a-2228-28445-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28445).  </sch:assert>
            <sch:assert id="a-2228-28441-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130'])=1"> SHALL contain at least one [1..*] templateId (CONF:2228-28441) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.130" (CONF:2228-28447).  </sch:assert>
            <sch:assert id="a-2228-28442-error" test="count(cda:code) =1">SHALL contain exactly one [1..1] code (CONF:2228-28442).</sch:assert> 
            <sch:assert id="a-2228-28443-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28443) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28450). SHALL contain exactly one [1..1] Device Order (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.9:2016-02-01) (CONF:2228-28451). </sch:assert>
        </sch:rule>       
        <sch:rule id="Device-Order-Act-V3-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130']]/cda:code">
            <sch:assert id="a-2228-28448-error" test="@code='SPLY'">This code SHALL contain exactly one [1..1] @code="SPLY" Supply (CONF:2228-28448).</sch:assert> 
            <sch:assert id="a-2228-28449-error" test="@codeSystem"> This code SHALL contain exactly one [1..1] @codeSystem (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28449). </sch:assert> 
        </sch:rule>     
    </sch:pattern>
    
</sch:schema>