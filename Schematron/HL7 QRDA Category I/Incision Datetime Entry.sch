<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Incision_datetime-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Incision_datetime-pattern-errors">
        <sch:rule id="Incision_datetime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]">
            <sch:assert id="a-67-14559-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-14559).</sch:assert>
            <sch:assert id="a-67-11401-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-11401).</sch:assert>
            <sch:assert id="a-67-11402-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-11402) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.89" (CONF:67-11403).</sch:assert>
            <sch:assert id="a-67-26984-error" test="count(cda:id) &gt; 0"> SHALL contain at least one [1..*] id (CONF:67-26984).</sch:assert>
            <sch:assert id="a-67-14562-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-14562).</sch:assert>
            <sch:assert id="a-67-14561-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:67-14561).</sch:assert>
        </sch:rule>
        <sch:rule id="Incision_datetime-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]/cda:code">
            <sch:assert id="a-67-27014-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:67-27014).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>