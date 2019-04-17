<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <!-- New template  for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460  -->
    
    <sch:phase id="errors">
        <sch:active pattern="Days_Supplied-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Days_Supplied-pattern-errors">
        <sch:rule id="Days_Supplied-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.157'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-29196-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4388-29196).</sch:assert>
            <sch:assert id="a-4388-29197-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4388-29197). </sch:assert>
            <sch:assert id="a-4388-29179-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.157'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-29179) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.157" (CONF:4388-29198) SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-29199). </sch:assert>
            <sch:assert id="a-4388-29211-error" test="count(cda:quantity)=1">SHALL contain exactly one [1..1] quantity (CONF:4388-29211).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>