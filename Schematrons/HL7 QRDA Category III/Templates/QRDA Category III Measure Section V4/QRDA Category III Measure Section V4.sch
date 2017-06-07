<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III_Measure-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_III_Measure-pattern-errors">
        <sch:rule id="QRDA_Category_III_Measure-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2017-06-01']]">
            <sch:assert id="a-3338-17284-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3338-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:3338-17285). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:3338-21171).</sch:assert>
            <sch:assert id="a-3338-17906-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-09-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:3338-17906) such that it SHALL contain exactly one [1..1] Measure Reference and Results (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.1:2016-09-01) (CONF:3338-17907)</sch:assert>
            <sch:assert id="a-3338-21445-error" test="count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=1">SHALL contain exactly one [1..1] entry (CONF:3338-21445) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:3338-21446).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>