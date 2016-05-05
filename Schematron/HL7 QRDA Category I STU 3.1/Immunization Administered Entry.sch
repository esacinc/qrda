<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Immunization_administered-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Immunization_administered-pattern-errors">
        <sch:rule id="Immunization_administered-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]">
            <sch:assert id="a-2228-28588" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28588).</sch:assert>
            <sch:assert id="a-2228-28589" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28589).</sch:assert>
            <sch:assert id="a-2228-28574" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28574) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.140" (CONF:2228-28581).</sch:assert>
            <sch:assert id="a-2228-28590" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-28590).</sch:assert>
            <sch:assert id="a-2228-28575" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28575).</sch:assert>
            <sch:assert id="a-2228-28576" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-28576).</sch:assert>
            <sch:assert id="a-2228-28578" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-28578).</sch:assert>
            <sch:assert id="a-2228-28572" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']][@moodCode='EVN'])=1]) &gt; 0">SHALL contain at least one [1..*] entryRelationship (CONF:2228-28572) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-28580). SHALL contain exactly one [1..1] Immunization Activity (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.52:2014-06-09) (CONF:2228-28573). This substanceAdministration SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28579).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_administered-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]/cda:code">
            <sch:assert id="a-2228-28583" test="@code='416118004'">This code SHALL contain exactly one [1..1] @code="416118004" administration (CONF:2228-28583).</sch:assert>
            <sch:assert id="a-2228-28584" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-28584).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_administered-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]/cda:statusCode">
            <sch:assert id="a-2228-28585" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-28585).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_administered-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]/cda:effectiveTime">
            <sch:assert id="a-2228-28591" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-28591).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>