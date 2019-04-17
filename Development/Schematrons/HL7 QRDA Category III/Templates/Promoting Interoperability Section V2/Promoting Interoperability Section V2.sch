<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-430 -->
<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Promoting_Interoperability-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Promoting_Interoperability-pattern-errors">
        <sch:rule id="Promoting_Interoperability-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2017-06-01']]">
            <sch:assert id="a-3338-21231-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3338-21231) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.5" (CONF:3338-21233). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:3338-21395).</sch:assert>
            <sch:assert id="a-3338-21440-error" test="count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=1">SHALL contain exactly one [1..1] entry (CONF:3338-21440) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:3338-21441).</sch:assert>
            <sch:assert id="a-3338-21438-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:3338-21438).</sch:assert>
            <sch:assert id="a-3338-21439-error" test="count(cda:entry[cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]]) &gt; 0 or count(cda:entry[cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01']]]) &gt; 0">This Advancing Care Information Section SHALL contain at least an Advancing Care Information Numerator Denominator Type Measure Reference and Results or an Advancing Care Information Measure Performed Reference and Results (CONF:3338-21439).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>