<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Substance-Administered-Act-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Substance-Administered-Act-pattern-errors">
        <sch:rule id="Substance-Administered-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']]">
            <sch:assert id="a-1098-31500-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31500).  </sch:assert>
            <sch:assert id="a-1098-31501-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31501). </sch:assert>
            <sch:assert id="a-1098-31502-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-31502) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.118" (CONF:1098-31503).</sch:assert>
            <sch:assert id="a-1098-31504-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1098-31504).</sch:assert>
            <sch:assert id="a-1098-31506-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31506).  </sch:assert>
            <sch:assert id="a-1098-31505-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31505).  </sch:assert>
         </sch:rule>
        <sch:rule id="Substance-Administered-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']]/cda:code">
            <sch:assert id="a-1098-31507-error" test="@code='416118004'">This code SHALL contain exactly one [1..1] @code="416118004" Administration (CONF:1098-31507). </sch:assert>
            <sch:assert id="a-1098-31508-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-31508). </sch:assert>
        </sch:rule>
     </sch:pattern>
    
</sch:schema>