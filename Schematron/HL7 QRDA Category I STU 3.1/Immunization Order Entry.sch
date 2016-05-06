<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Immunization_order-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Immunization_order-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Immunization_order-pattern-errors">
        <sch:rule id="Immunization_order-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143']]">
            <sch:assert id="a-2228-28645-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28645).</sch:assert>
            <sch:assert id="a-2228-28644-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28644).</sch:assert>
            <sch:assert id="a-2228-28627-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28627) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.143" (CONF:2228-28634).</sch:assert>
            <sch:assert id="a-2228-28646-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-28646).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_order-routeCode-translation-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143']]/cda:routeCode/cda:translation">
            <sch:assert id="a-2228-28636-error" test="@sdtc:valueSet">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28636).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Immunization_order-pattern-warnings">
        <sch:rule id="Immunization_order-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143']]/cda:routeCode">
            <sch:assert id="a-2228-28637-warning" test="@sdtc:valueSet">The routeCode, if present, SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-28637).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>