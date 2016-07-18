<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Measure-section-qdm-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Measure-section-qdm-pattern-errors">
        <sch:rule id="Measure-section-qdm-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]">
            <sch:assert id="a-67-12803-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12803) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.3" (CONF:67-12804).</sch:assert>
            <sch:assert id="a-67-12978-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-12978).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure-section-qdm-entry-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]/cda:entry">
            <sch:assert id="a-67-13193-error" test="count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']])=1">Such entries SHALL contain exactly one [1..1] eMeasure Reference QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.97) (CONF:67-13193).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>