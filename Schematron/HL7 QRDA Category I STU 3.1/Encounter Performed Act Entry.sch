<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Performed-Act-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Encounter-Performed-Act-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Performed-Act-pattern-errors">
        <sch:rule id="Encounter-Performed-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133']]">
            <sch:assert id="a-2228-28477" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28477).  </sch:assert>
            <sch:assert id="a-2228-28478" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28478).  </sch:assert>
            <sch:assert id="a-2228-28475" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28475) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.133" (CONF:2228-28479).  </sch:assert>
            <sch:assert id="a-2228-28480" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-28480).  </sch:assert>
            <sch:assert id="a-2228-11874" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-28476) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28481). SHALL contain exactly one [1..1] Encounter Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.23:2016-02-01) (CONF:2228-28482).  </sch:assert>
         </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Encounter-Performed-Act-pattern-warnings">
    </sch:pattern>
    
</sch:schema>