<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnostic-Study-Adverse-Event-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Diagnostic-Study-Adverse-Event-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Diagnostic-Study-Adverse-Event-pattern-errors">
        <sch:rule id="Diagnostic-Study-Adverse-Event-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15']]">
            <sch:assert id="a-2228-11767-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11767). </sch:assert>
            <sch:assert id="a-2228-11768-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11768).</sch:assert>
            <sch:assert id="a-2228-11769-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11769) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.15" (CONF:2228-11770). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27012). </sch:assert>
            <sch:assert id="a-2228-16408-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16408). </sch:assert>
            <sch:assert id="a-2228-11779-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18' ][@extension='2016-02-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-11779) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-11780). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-11781).  SHALL contain exactly one [1..1] Diagnostic Study Performed (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.18:2016-02-01) (CONF:2228-27149). </sch:assert>     
        </sch:rule>
        
        <sch:rule id="Diagnostic-Study-Adverse-Event-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15']]/cda:value">
            <sch:assert id="a-2228-26938-error" test="@code='281647001'">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CONF:2228-26938). </sch:assert>
            <sch:assert id="a-2228-26939-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CONF:2228-26939). </sch:assert>
        </sch:rule>

     </sch:pattern>
    
    <sch:pattern id="Diagnostic-Study-Adverse-Event-pattern-warnings">
    </sch:pattern>
    
</sch:schema>