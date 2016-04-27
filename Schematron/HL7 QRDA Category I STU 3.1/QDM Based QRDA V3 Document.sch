<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QDM_based_QRDA_V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="QDM_based_QRDA_V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="QDM_based_QRDA_V3-pattern-errors">
        <sch:rule id="QDM_based_QRDA_V3-errors" context="cda:ClinicalDocument">
            <sch:assert id="a-2228-12972" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12972) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.2" (CONF:2228-26943). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26944)</sch:assert>
            <sch:assert id="a-2228-16598" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:2228-16598).</sch:assert>
            <sch:assert id="a-2228-16600" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:2228-16600).</sch:assert>
            <sch:assert id="a-2228-12973" test="count(cda:component[count(cda:structuredBody)=1])=1">SHALL contain exactly one [1..1] component (CONF:2228-12973) such that it SHALL contain exactly one [1..1] structuredBody (CONF:2228-17081).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:recordTarget">
            <sch:assert id="a-2228-16856" test="count(cda:patientRole)=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:2228-16856).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-recordTarget-patientRole-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:recordTarget/cda:patientRole">
            <sch:assert id="a-2228-16858" test="not(cda:id) or count(cda:id[@root='2.16.840.1.113883.4.572'])=1">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.572" Medicare HIC number (CONF:2228-16858)</sch:assert>
            <sch:assert id="a-2228-27570" test="count(cda:patient)=1">This patientRole SHALL contain exactly one [1..1] patient (CONF:2228-27570).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-recordTarget-patientRole-patient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:recordTarget/cda:patientRole/cda:patient">
            <sch:assert id="a-2228-27571" test="count(cda:birthTime)=1">This patient SHALL contain exactly one [1..1] birthTime (CONF:2228-27571).</sch:assert>
            <sch:assert id="a-2228-27572" test="count(cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode (CONF:2228-27572).</sch:assert>
            <sch:assert id="a-2228-27573" test="count(cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode (CONF:2228-27573).</sch:assert>
            <sch:assert id="a-2228-27574" test="count(cda:ethnicGroupCode)=1">This patient SHALL contain exactly one [1..1] ethnicGroupCode (CONF:2228-27574).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:custodian">
            <sch:assert id="a-2228-28239" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:2228-28239).</sch:assert>
            <sch:assert id="a-2228-28240" test="cda:assignedCustodian[count(cda:representedCustodianOrganization)=1]">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:2228-28240).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:informationRecipient">
            <sch:assert id="a-2228-16704" test="count(cda:intendedRecipient)=1">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:2228-16704).</sch:assert>
            <sch:assert id="a-2228-16705" test="cda:intendedRecipient[count(cda:id) &gt; 0]">This intendedRecipient SHALL contain at least one [1..*] id (CONF:2228-16705).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:component/cda:structuredBody">
            <sch:assert id="a-2228-17082" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-17082). This component SHALL contain exactly one [1..1] Measure Section QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.3) (CONF:2228-17083).</sch:assert>
            <sch:assert id="a-2228-17090" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-17090). This component SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:2228-17092).</sch:assert>
            <sch:assert id="a-2228-17091" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2016-02-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2228-17091). This component SHALL contain exactly one [1..1] Patient Data Section QDM (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.2.1:2016-02-01) (CONF:2228-17093).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="QDM_based_QRDA_V3-pattern-warnings">
        <sch:rule id="QDM_based_QRDA_V3-recordTarget-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:recordTarget">
            <sch:assert id="a-2228-16857" test="cda:patientRole[count(cda:id)=1]">This patientRole SHOULD contain zero or one [0..1] id (CONF:2228-16857)</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
            <sch:assert id="a-2228-28241" test="count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:2228-28241) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" CMS Certification Number (CONF:2228-28244). SHALL contain exactly one [1..1] @extension (CONF:2228-28245).</sch:assert>
            <sch:assert id="a-2228-28242" test="count(cda:id[@root='2.16.840.1.113883.4.2'][@extension])=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:2228-28242) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:2228-28246). SHALL contain exactly one [1..1] @extension (CONF:2228-28247).</sch:assert>
            <sch:assert id="a-2228-28243" test="count(cda:id[@root='1.3.6.1.4.1.33895'][@extension])=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:2228-28243) such that it SHALL contain exactly one [1..1] @root="1.3.6.1.4.1.33895" The Joint Commission’s Health Care Organization (HCO) Identification Number (CONF:2228-28248). SHALL contain exactly one [1..1] @extension (CONF:2228-28249).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-documentationOf-serviceEvent-performer-assignedEntity-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
            <sch:assert id="a-2228-16587" test="count(cda:id[@root='2.16.840.1.113883.4.6'])=1">This assignedEntity SHOULD contain zero or one [0..1] id (CONF:2228-16587) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:2228-16588).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V3-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-2228-16592" test="count(cda:id[@root='2.16.840.1.113883.4.2'])=1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:2228-16592) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:2228-16593).</sch:assert>
            <sch:assert id="a-2228-16595" test="count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:2228-16595) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" Facility CMS Certification Number (CONF:2228-16596). SHALL contain exactly one [1..1] @extension (CONF:2228-16597).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>