<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III_Report-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="QRDA_Category_III_Report-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_III_Report-pattern-errors">
        <sch:rule id="QRDA_Category_III_Report-errors" context="cda:ClinicalDocument">
            <sch:assert id="a-3338-17226-error" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:3338-17226).</sch:assert>
            <sch:assert id="a-3338-18186-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:3338-18186).</sch:assert>
            <sch:assert id="a-3338-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3338-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:3338-17209). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:3338-21319).</sch:assert>
            <sch:assert id="a-3338-17236-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:3338-17236).</sch:assert>
            <sch:assert id="a-3338-17210-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3338-17210).</sch:assert>
            <sch:assert id="a-3338-17211-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:3338-17211).</sch:assert>
            <sch:assert id="a-3338-17237-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3338-17237).</sch:assert>
            <sch:assert id="a-3338-17238-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:3338-17238).</sch:assert>
            <sch:assert id="a-3338-17239-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:3338-17239).</sch:assert>
            <sch:assert id="a-3338-17212-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:3338-17212).</sch:assert>
            <sch:assert id="a-3338-18156-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) &gt; 0">SHALL contain at least one [1..*] author (CONF:3338-18156) such that it SHALL contain exactly one [1..1] time (CONF:3338-18158). SHALL contain exactly one [1..1] assignedAuthor (CONF:3338-18157).</sch:assert>
            <sch:assert id="a-3338-17213-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:3338-17213).</sch:assert>
            <sch:assert id="a-3338-17225-error" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:3338-17225).</sch:assert>
            <sch:assert id="a-3338-17217-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:3338-17217).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:typeId">
            <sch:assert id="a-3338-18187-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:3338-18187).</sch:assert>
            <sch:assert id="a-3338-18188-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:3338-18188).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-realmCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:realmCode">
            <sch:assert id="a-3338-17227-error" test="@code='US'">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:3338-17227).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:code">
            <sch:assert id="a-3338-19549-error" test="@code='55184-6'">This code SHALL contain exactly one [1..1] @code="55184-6" Quality Reporting Document Architecture Calculated Summary Report (CONF:3338-19549).</sch:assert>
            <sch:assert id="a-3338-21166-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3338-21166).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:languageCode">
            <sch:assert id="a-3338-19669-error" test="@code">This languageCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:3338-19669).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:recordTarget">
            <sch:assert id="a-3338-17232-error" test="count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:3338-17232) such that it SHALL contain exactly one [1..1] id (CONF:3338-17233). This id SHALL contain exactly one [1..1] @nullFlavor="NA" (CONF:3338-17234).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3338-18163-error" test="count(cda:representedOrganization)=1">This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:3338-18163).</sch:assert>
            <sch:assert id="a-3338-19667-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:3338-19667).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-author-assignedAuthor-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:author/cda:assignedAuthor/cda:representedOrganization">
            <sch:assert id="a-3338-18265-error" test="count(cda:name) &gt; 0">This representedOrganization SHALL contain at least one [1..*] name (CONF:3338-18265).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
            <sch:assert id="a-3338-18262-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:3338-18262).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:custodian">
            <sch:assert id="a-3338-17214-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:3338-17214).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:custodian/cda:assignedCustodian">
            <sch:assert id="a-3338-17215-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:3338-17215).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
            <sch:assert id="a-3338-18165-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:3338-18165).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:legalAuthenticator">
            <sch:assert id="a-3338-18167-error" test="count(cda:time)=1">This legalAuthenticator SHALL contain exactly one [1..1] time (CONF:3338-18167).</sch:assert>
            <sch:assert id="a-3338-18168-error" test="count(cda:signatureCode)=1">This legalAuthenticator SHALL contain exactly one [1..1] signatureCode (CONF:3338-18168).</sch:assert>
            <sch:assert id="a-3338-19670-error" test="count(cda:assignedEntity)=1">This legalAuthenticator SHALL contain exactly one [1..1] assignedEntity (CONF:3338-19670).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:legalAuthenticator/cda:signatureCode">
            <sch:assert id="a-3338-18169-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CONF:3338-18169).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-3338-19672-error" test="count(cda:id) &gt; 0">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:3338-19672).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-participant-associatedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:participant[@typeCode='DEV']/cda:associatedEntity">
            <sch:assert id="a-3338-18303-error" test="@classCode='RGPR'">This associatedEntity SHALL contain exactly one [1..1] @classCode="RGPR" regulated product (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3338-18303).</sch:assert>
            <sch:assert id="a-3338-20954-error" test="count(cda:id) &gt; 0">This associatedEntity SHALL contain at least one [1..*] id (CONF:3338-20954).</sch:assert>
            <sch:assert id="a-3338-18308-error" test="count(cda:code)=1">This associatedEntity SHALL contain exactly one [1..1] code (CONF:3338-18308).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-participant-associatedEntity-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:participant[@typeCode='DEV']/cda:associatedEntity/cda:code">
            <sch:assert id="a-3338-18309-error" test="@code='129465004'">This code SHALL contain exactly one [1..1] @code="129465004" medical record, device (CONF:3338-18309).</sch:assert>
            <sch:assert id="a-3338-21167-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3338-21167).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:documentationOf">
            <sch:assert id="a-3338-18171-error" test="count(cda:serviceEvent)=1">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:3338-18171).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:documentationOf/cda:serviceEvent">
            <sch:assert id="a-3338-18172-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3338-18172).</sch:assert>
            <sch:assert id="a-3338-18173-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:3338-18173).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
            <sch:assert id="a-3338-18174-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:3338-18174).</sch:assert>
            <sch:assert id="a-3338-18176-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:3338-18176).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
            <sch:assert id="a-3338-19474-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:3338-19474).</sch:assert>
            <sch:assert id="a-3338-18180-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:3338-18180).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-authorization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:authorization">
            <sch:assert id="a-3338-18360-error" test="count(cda:consent)=1">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:3338-18360).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-authorization-consent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:authorization/cda:consent">
            <sch:assert id="a-3338-18361-error" test="count(cda:id)=1">This consent SHALL contain exactly one [1..1] id (CONF:3338-18361).</sch:assert>
            <sch:assert id="a-3338-18363-error" test="count(cda:code)=1">This consent SHALL contain exactly one [1..1] code (CONF:3338-18363).</sch:assert>
            <sch:assert id="a-3338-18364-error" test="count(cda:statusCode)=1">This consent SHALL contain exactly one [1..1] statusCode (CONF:3338-18364).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-authorization-consent-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:authorization/cda:consent/cda:code">
            <sch:assert id="a-3338-19550-error" test="@code='425691002'">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CONF:3338-19550).</sch:assert>
            <sch:assert id="a-3338-21172-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3338-21172).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-authorization-consent-statusCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:authorization/cda:consent/cda:statusCode">
            <sch:assert id="a-3338-19551-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3338-19551).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:component">
            <sch:assert id="a-3338-17235-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:3338-17235).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:component/cda:structuredBody">
            <sch:assert id="a-3338-21394-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2017-06-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2017-06-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2017-06-01']])=1])=1">This structuredBody SHALL contain at least a QRDA Category III Measure Section (V4), or an Improvement Activity Section (V2), or an Advancing Care Information Section (V2) (CONF:3338-21394).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="QRDA_Category_III_Report-pattern-warnings">
        <sch:rule id="QRDA_Category_III_Report-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]">
            <sch:assert id="a-3338-17238-v-warning" test="count(cda:confidentialityCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value])=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:3338-17238).</sch:assert>
            <sch:assert id="a-3338-18260-warning" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:3338-18260).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
            <sch:assert id="a-3338-18166-warning" test="count(cda:name)=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:3338-18166).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-legalAuthenticator-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-3338-19673-warning" test="count(cda:name)=1">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:3338-19673).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_Report-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-3338-19659-warning" test="count(cda:name) &gt; 0">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:3338-19659).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>