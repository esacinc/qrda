<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_III-pattern-errors">
        <sch:rule id="QRDA_Category_III-errors" context="cda:ClinicalDocument">
            <sch:assert id="a-2226-17226-error" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:2226-17226).</sch:assert>
            <sch:assert id="a-2226-18186-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:2226-18186).</sch:assert>
            <sch:assert id="a-2226-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:2226-17209). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21168).</sch:assert>
            <sch:assert id="a-2226-17236-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2226-17236).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:typeId">
            <sch:assert id="a-2226-18187-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:2226-18187).</sch:assert>
            <sch:assert id="a-2226-18188-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:2226-18188).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III-realmCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:realmCode">
            <sch:assert id="a-2226-17227-error" test="@code='US'">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:2226-17227).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>