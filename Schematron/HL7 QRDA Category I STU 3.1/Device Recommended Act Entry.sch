<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Recommended-Act-V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Device-Recommended-Act-V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Device-Recommended-Act-V3-pattern-errors">
        <sch:rule id="Device-Recommended-Act-V3-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131']]">
            <sch:assert id="a-2228-28454" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28454). </sch:assert>
            <sch:assert id="a-2228-28455" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28455).  </sch:assert>
            <sch:assert id="a-2228-28452" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131'])=1"> SHALL contain at least one [1..*] templateId (CONF:2228-28452) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.131" (CONF:2228-28456).  </sch:assert>
            <sch:assert id="a-2228-28457" test="count(cda:id) &gt;=1">SHALL contain at least one [1..*] id (CONF:2228-28457). </sch:assert> 
            <sch:assert id="a-2228-28453" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10' and @extension = '2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28453) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28458). SHALL contain exactly one [1..1] Device Recommended (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.10:2016-02-01) (CONF:2228-28459). </sch:assert>
        </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="Device-Recommended-Act-V3-pattern-warnings">
    </sch:pattern>
    
</sch:schema>