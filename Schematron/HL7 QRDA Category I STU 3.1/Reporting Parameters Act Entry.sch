<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Reporting-Parameters-Act-pattern-errors" />
    </sch:phase>
   
    <sch:pattern id="Reporting-Parameters-Act-pattern-errors">
        <sch:rule id="Reporting-Parameters-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
            <sch:assert id="a-23-3269-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:23-3269). </sch:assert>
            <sch:assert id="a-23-3270-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:23-3270). </sch:assert>
            <sch:assert id="a-23-18098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:23-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:23-18099). </sch:assert>
            <sch:assert id="a-23-26549-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:23-26549). </sch:assert>
            <sch:assert id="a-23-3272-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:23-3272). </sch:assert>
             <sch:assert id="a-23-3273-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:23-3273). </sch:assert>
         </sch:rule>
        <sch:rule id="Reporting-Parameters-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]/cda:code">
            <sch:assert id="a-23-26550-error" test="@code='252116004'">This code SHALL contain exactly one [1..1] @code="252116004" Observation Parameters (CONF:23-26550). </sch:assert>
            <sch:assert id="a-23-26551-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:23-26551). </sch:assert>
        </sch:rule>               
        <sch:rule id="Reporting-Parameters-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]/cda:effectiveTime">
            <sch:assert id="a-23-3274-error" test="count(cda:low)=1"> This effectiveTime SHALL contain exactly one [1..1] low (CONF:23-3274). </sch:assert>
            <sch:assert id="a-23-3275-error" test="count(cda:high)=1"> This effectiveTime SHALL contain exactly one [1..1] high (CONF:23-3275). </sch:assert>
        </sch:rule>
     </sch:pattern>
    
</sch:schema>