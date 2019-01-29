<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Improvement_Activity-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Improvement_Activity-pattern-errors">
        <sch:rule id="Improvement_Activity-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2019-02-01']]">
            <sch:assert id="a-4408-21175-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2019-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4408-21175) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.4" (CONF:4408-21177). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:4408-21398).</sch:assert>
            <!-- STU 2.2 Section must include Improvement Activity Performed Measure Reference and Results V2 (updated from V1) -->
            <sch:assert id="a-4408-21181-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.33'][@extension='2019-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:4408-21181) such that it SHALL contain exactly one [1..1] Improvement Activity Performed Measure Reference and Results V2 (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.33:2016-09-01) (CONF:4408-21436).</sch:assert>
            <!-- STU 2.2 Changed test for entry from required "SHALL such that" (4408-21447) to not required "MAY such that" (4408-21450)
            <sch:assert id="a-4408-21447-error" test="count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=1">SHALL contain exactly one [1..1] entry (CONF:4408-21447) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:4408-21448).</sch:assert>
            -->
        </sch:rule>
    </sch:pattern>
</sch:schema>