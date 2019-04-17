<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_I-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_I-pattern-errors">
        <sch:rule id="QRDA_Category_I-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-12910-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12910) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.1" (CONF:3343-14613). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27005)</sch:assert>
            <sch:assert id="a-3343-12911-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-12911).</sch:assert>
            <sch:assert id="a-3343-12912-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:3343-12912).</sch:assert>
            <sch:assert id="a-3343-12913-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:3343-12913).</sch:assert>
            <sch:assert id="a-3343-12914-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:3343-12914).</sch:assert>
            <sch:assert id="a-3343-12918-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:3343-12918).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-28137-error" test="@code='55182-0'">This code SHALL contain exactly one [1..1] @code="55182-0" Quality Measure Report (CONF:3343-28137).</sch:assert>
            <sch:assert id="a-3343-28138-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28138).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:recordTarget">
            <sch:assert id="a-3343-28387-error" test="count(cda:patientRole)=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:3343-28387).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:custodian">
            <sch:assert id="a-3343-12915-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:3343-12915).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:custodian/cda:assignedCustodian">
            <sch:assert id="a-3343-12916-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:3343-12916).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:component">
            <sch:assert id="a-3343-12919-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:3343-12919).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:component/cda:structuredBody">
            <sch:assert id="a-3343-12920-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-12920) such that it SHALL contain exactly one [1..1] Measure Section (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.2) (CONF:3343-17078).</sch:assert>
            <sch:assert id="a-3343-12923-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-12923) such that it SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:3343-17079).</sch:assert>
            <sch:assert id="a-3343-12924-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-12924) such that it SHALL contain exactly one [1..1] Patient Data Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.4) (CONF:3343-17080).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>