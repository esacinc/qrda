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
        <sch:rule id="Immunization_administered-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28588-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" Substance Administration (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28588).</sch:assert>
            <sch:assert id="a-3343-28589-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28589).</sch:assert>
            <sch:assert id="a-3343-28574-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28574) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.140" (CONF:3343-28581). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28958).</sch:assert>
            <sch:assert id="a-3343-28576-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28576).</sch:assert>
            <sch:assert id="a-3343-28578-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28578).</sch:assert>
            <sch:assert id="a-3343-28957-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:3343-28957).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_administered-statusCode-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]/cda:statusCode">
            <sch:assert id="a-3343-28585-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28585).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_administered-effectiveTime-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]/cda:effectiveTime">
            <sch:assert id="a-3343-28959-error" test="@value">This effectiveTime SHALL contain exactly one [1..1] @value (CONF:3343-28959).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_administered-consumable-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140']]/cda:consumable">
            <sch:assert id="a-3343-28960-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']])=1">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:3343-28960).</sch:assert>
        </sch:rule>
        
    </sch:pattern>
</sch:schema>