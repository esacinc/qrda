<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III_Reporting_Parameters-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_III_Reporting_Parameters-pattern-errors">
        <sch:rule id="QRDA_Category_III_Reporting_Parameters-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']]">
            <sch:assert id="a-77-18323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.2" (CONF:77-18324).</sch:assert>
            <sch:assert id="a-77-18325-error" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1]) &gt; 0">SHALL contain exactly one [1..1] entry (CONF:77-18325) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18427). SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:77-18428).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>