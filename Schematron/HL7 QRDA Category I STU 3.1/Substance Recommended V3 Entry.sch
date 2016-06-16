<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Substance-Recommended-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Substance-Recommended-pattern-errors">
        <sch:rule id="Substance-Recommended-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-27495-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27495).</sch:assert>
            <sch:assert id="a-2228-13784-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-13784).</sch:assert>
            <sch:assert id="a-2228-13785-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-13785) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.75" (CONF:2228-13786).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27152). </sch:assert>
            <sch:assert id="a-2228-27988-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:2228-27988). </sch:assert>
            <sch:assert id="a-2228-27720-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27720). </sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Recommended-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01']]/cda:consumable">
            <sch:assert id="a-2228-27989-error" test="count(cda:manufacturedProduct)=1">This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:2228-27989). </sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Recommended-consumable-manufacturedProduct-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01']]/cda:consumable/cda:manufacturedProduct">
            <sch:assert id="a-2228-27990-error" test="count(cda:manufacturedMaterial)=1">This manufacturedProduct SHALL contain exactly one [1..1] manufacturedMaterial (CONF:2228-27990).  </sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Recommended-consumable-manufacturedProduct-manufacturedMaterial-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01']]/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">
            <sch:assert id="a-2228-27991-error" test="count(cda:code)=1">This manufacturedMaterial SHALL contain exactly one [1..1] code (CONF:2228-27991).</sch:assert>
        </sch:rule>
        <sch:rule id="Substance-Recommended-consumable-manufacturedProduct-manufacturedMaterial-code-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2016-02-01']]/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code">
            <sch:assert id="a-2228-27992-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27992).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>