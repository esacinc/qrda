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
        <sch:rule id="Improvement_Activity-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2016-09-01']]">
            <sch:assert id="a-3259-21175-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21175) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.4" (CONF:3259-21177). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21398).</sch:assert>
            <sch:assert id="a-3259-21181-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.33'][@extension='2016-09-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:3259-21181) such that it SHALL contain exactly one [1..1] Improvement Activity Performed Measure Reference and Results (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.33:2016-09-01) (CONF:3259-21436).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>