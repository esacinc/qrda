<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />

    <!-- Updated 09-25-2018 for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460 
                               New conformance prefix,  New extension -->
    <sch:phase id="errors">
        <sch:active pattern="Patient_data_section_QDM-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Patient_data_section_QDM-pattern-errors">
        <sch:rule id="Patient_data_section_QDM-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-12796-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-12796) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.1" (CONF:4388-12797). SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-28405).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>