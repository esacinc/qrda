<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <!-- New template  for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460  -->
    
    <sch:phase id="errors">
        <sch:active pattern="Assessment_order-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Assessment_order-pattern-errors">
        <sch:rule id="Assessment_order-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.158'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-29249-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4388-29249).</sch:assert>
            <sch:assert id="a-4388-29248-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" request (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4388-29248).</sch:assert>
            <sch:assert id="a-4388-29241-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.158'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-29241) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.158" (CONF:4388-29244) SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-29245). </sch:assert>
            <sch:assert id="a-4388-29246-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4388-29246).</sch:assert>
            <sch:assert id="a-4388-29242-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:4388-29242). </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>