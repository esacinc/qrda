<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Symptom-Concern-Act-pattern-errors" />
    </sch:phase>
   
    <sch:pattern id="Symptom-Concern-Act-pattern-errors">
        <sch:rule id="Symptom-Concern-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01']]">
            <sch:assert id="a-3265-28547-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3265-28547). </sch:assert>
            <sch:assert id="a-3265-28548-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3265-28548).  </sch:assert>
            <sch:assert id="a-3265-28539-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-28539) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.138" (CONF:3265-28544). SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28694).</sch:assert>
            <sch:assert id="a-3265-28540-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3265-28540).  </sch:assert>
            <sch:assert id="a-3265-28541-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3265-28541).   </sch:assert>
            <sch:assert id="a-3265-28538-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3265-28538) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3265-28543). SHALL contain exactly one [1..1] Symptom (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.136) (CONF:3265-28542). </sch:assert>
        </sch:rule>
        <sch:rule id="Symptom-Concern-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01']]/cda:statusCode">
            <sch:assert id="a-3265-28545-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3265-28545).</sch:assert>
            <sch:assert id="a-3265-28695-error" test="@code='active' or @code='resolved'">The statusCode/@code SHALL be either "active" or "resolved" (CONF:3265-28695).</sch:assert>
        </sch:rule>
        <sch:rule id="Symptom-Concern-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3265-28546-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3265-28546).  </sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>