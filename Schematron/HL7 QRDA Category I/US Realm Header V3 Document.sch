<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="US_Realm-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="US_Realm-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="US_Realm-pattern-errors">
        <sch:rule id="US_Realm-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]">
            <sch:assert id="a-1198-5252-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-5252) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.1.1" (CONF:1198-10036). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32503).</sch:assert>
            <sch:assert id="a-1198-16791-error" test="count(cda:realmCode[@code='US'])=1">SHALL contain exactly one [1..1] realmCode="US" (CONF:1198-16791)</sch:assert>
            <sch:assert id="a-1198-5361-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:1198-5361).</sch:assert>
            <sch:assert id="a-1198-5363-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:1198-5363).</sch:assert>
            <sch:assert id="a-1198-5253-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-5253).</sch:assert>
            <sch:assert id="a-1198-5254-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:1198-5254).</sch:assert>
            <sch:assert id="a-1198-5256-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5256).</sch:assert>
            <sch:assert id="a-1198-5259-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode (CONF:1198-5259).</sch:assert>
            <sch:assert id="a-1198-5372-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:1198-5372).</sch:assert>
            <sch:assert id="a-1198-5266-error" test="count(cda:recordTarget) &gt; 0">SHALL contain at least one [1..*] recordTarget (CONF:1198-5266).</sch:assert>
            <sch:assert id="a-1198-5444-error" test="count(cda:author) &gt; 0">SHALL contain at least one [1..*] author (CONF:1198-5444).</sch:assert>
            <sch:assert id="a-1198-5519-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:1198-5519).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:typeId">
            <sch:assert id="a-1198-5250-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:1198-5250).</sch:assert>
            <sch:assert id="a-1198-5251-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:1198-5251).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-setId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:setId">
            <sch:assert id="a-1198-6380-error" test="count(../cda:versionNumber)=1">If setId is present versionNumber SHALL be present (CONF:1198-6380).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-versionNumber-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:versionNumber">
            <sch:assert id="a-1198-6387-error" test="count(../cda:setId)=1">If versionNumber is present setId SHALL be present (CONF:1198-6387).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget">
            <sch:assert id="a-1198-5267-error" test="count(cda:patientRole)=1">Such recordTargets SHALL contain exactly one [1..1] patientRole (CONF:1198-5267).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole">
            <sch:assert id="a-1198-5268-error" test="count(cda:id) &gt; 0">This patientRole SHALL contain at least one [1..*] id (CONF:1198-5268).</sch:assert>
            <sch:assert id="a-1198-5271-error" test="count(cda:addr) &gt; 0">This patientRole SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5271).</sch:assert>
            <sch:assert id="a-1198-5280-error" test="count(cda:telecom) &gt; 0">This patientRole SHALL contain at least one [1..*] telecom (CONF:1198-5280).</sch:assert>
            <sch:assert id="a-1198-5283-error" test="count(cda:patient)=1">This patientRole SHALL contain exactly one [1..1] patient (CONF:1198-5283).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient">
            <sch:assert id="a-1198-5284-error" test="count(cda:name)&gt; 0">This patient SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5284).</sch:assert>
            <sch:assert id="a-1198-6394-error" test="count(cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:1198-6394).</sch:assert>
            <sch:assert id="a-1198-5298-error" test="count(cda:birthTime)=1">This patient SHALL contain exactly one [1..1] birthTime (CONF:1198-5298).</sch:assert>
            <sch:assert id="a-1198-5322-error" test="count(cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode, which SHALL be selected from ValueSet Race Category Excluding Nulls urn:oid:2.16.840.1.113883.3.2074.1.1.3 DYNAMIC (CONF:1198-5322).</sch:assert>
            <sch:assert id="a-1198-5323-error" test="count(cda:ethnicGroupCode)=1">This patient SHALL contain exactly one [1..1] ethnicGroupCode, which SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:1198-5323).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthTime-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
            <sch:assert id="a-1198-5299-error" test="string-length(@value) &gt;= 4">SHALL be precise to year (CONF:1198-5299).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-raceCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/sdtc:raceCode">
            <sch:assert id="a-1198-31347-error" test="count(../cda:raceCode)=1">If sdtc:raceCode is present, then the patient SHALL contain [1..1] raceCode (CONF:1198-31347).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian">
            <sch:assert id="a-1198-5385-error" test="count(cda:guardianPerson)=1">The guardian, if present, SHALL contain exactly one [1..1] guardianPerson (CONF:1198-5385).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-guardianPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:guardianPerson">
            <sch:assert id="a-1198-5386-error" test="count(cda:name) &gt; 0">This guardianPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5386).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthplace-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace">
            <sch:assert id="a-1198-5396-error" test="count(cda:place)=1">The birthplace, if present, SHALL contain exactly one [1..1] place (CONF:1198-5396).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthplace-place-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place">
            <sch:assert id="a-1198-5397-error" test="count(cda:addr)=1">This place SHALL contain exactly one [1..1] addr (CONF:1198-5397).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-languageCommunication-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication">
            <sch:assert id="a-1198-5407-error" test="count(cda:languageCode)=1">The languageCommunication, if present, SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:1198-5407).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-providerOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:providerOrganization">
            <sch:assert id="a-1198-5417-error" test="count(cda:id) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] id (CONF:1198-5417).</sch:assert>
            <sch:assert id="a-1198-5419-error" test="count(cda:name) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] name (CONF:1198-5419).</sch:assert>
            <sch:assert id="a-1198-5420-error" test="count(cda:telecom) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:1198-5420).</sch:assert>
            <sch:assert id="a-1198-5422-error" test="count(cda:addr) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5422).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-author-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author">
            <sch:assert id="a-1198-5445-error" test="count(cda:time)=1">Such authors SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5445).</sch:assert>
            <sch:assert id="a-1198-5448-error" test="count(cda:assignedAuthor)=1">Such authors SHALL contain exactly one [1..1] assignedAuthor (CONF:1198-5448).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-1198-5449-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:1198-5449).</sch:assert>
            <sch:assert id="a-1198-5452-error" test="count(cda:addr) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5452).</sch:assert>
            <sch:assert id="a-1198-5428-error" test="count(cda:telecom) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] telecom (CONF:1198-5428).</sch:assert>
            <sch:assert id="a-1198-16790-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:1198-16790).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-author-assignedAuthor-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:code">
            <sch:assert id="a-1198-16788-error" test="@code">The code, if present, SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-16788).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-author-assignedAuthor-assignedPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:assignedPerson">
            <sch:assert id="a-1198-16789-error" test="count(cda:name) &gt; 0">The assignedPerson, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-16789).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
            <sch:assert id="a-1198-16784-error" test="count(cda:manufacturerModelName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] manufacturerModelName (CONF:1198-16784).</sch:assert>
            <sch:assert id="a-1198-16785-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:1198-16785).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-dataEnterer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer">
            <sch:assert id="a-1198-5442-error" test="count(cda:assignedEntity)=1">The dataEnterer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-5442).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-dataEnterer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity">
            <sch:assert id="a-1198-5443-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-5443).</sch:assert>
            <sch:assert id="a-1198-5460-error" test="count(cda:addr) &gt; 0">This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5460).</sch:assert>
            <sch:assert id="a-1198-5466-error" test="count(cda:telecom) &gt; 0">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1198-5466).</sch:assert>
            <sch:assert id="a-1198-5469-error" test="count(cda:assignedPerson)=1">This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:1198-5469).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-dataEnterer-assignedEntity-assignedPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity/cda:assignedPerson">
            <sch:assert id="a-1198-5470-error" test="count(cda:name) &gt; 0">This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5470).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian">
            <sch:assert id="a-1198-5520-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:1198-5520).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian">
            <sch:assert id="a-1198-5521-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:1198-5521).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
            <sch:assert id="a-1198-5522-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:1198-5522).</sch:assert>
            <sch:assert id="a-1198-5524-error" test="count(cda:name)=1">This representedCustodianOrganization SHALL contain exactly one [1..1] name (CONF:1198-5524).</sch:assert>
            <sch:assert id="a-1198-5525-error" test="count(cda:telecom)=1">This representedCustodianOrganization SHALL contain exactly one [1..1] telecom (CONF:1198-5525).</sch:assert>
            <sch:assert id="a-1198-5559-error" test="count(cda:addr)=1">This representedCustodianOrganization SHALL contain exactly one [1..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5559).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:informationRecipient">
            <sch:assert id="a-1198-5566-error" test="count(cda:intendedRecipient)=1">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:1198-5566).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-informationRecipient-intendedRecipient-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient">
            <sch:assert id="a-1198-5568-error" test="count(cda:name) &gt; 0">The informationRecipient, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5568).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-informationRecipient-intendedRecipient-receivedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization">
            <sch:assert id="a-1198-5578-error" test="count(cda:name)=1">The receivedOrganization, if present, SHALL contain exactly one [1..1] name (CONF:1198-5578).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator">
            <sch:assert id="a-1198-5580-error" test="count(cda:time)=1">The legalAuthenticator, if present, SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5580).</sch:assert>
            <sch:assert id="a-1198-5583-error" test="count(cda:signatureCode)=1">The legalAuthenticator, if present, SHALL contain exactly one [1..1] signatureCode (CONF:1198-5583).</sch:assert>
            <sch:assert id="a-1198-5585-error" test="count(cda:assignedEntity)=1">The legalAuthenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-5585).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:signatureCode">
            <sch:assert id="a-1198-5584-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CodeSystem: Participationsignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:1198-5584).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-legalAuthenticator-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:assignedEntity">
            <sch:assert id="a-1198-5586-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-5586).</sch:assert>
            <sch:assert id="a-1198-5589-error" test="count(cda:addr) &gt; 0">This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5589).</sch:assert>
            <sch:assert id="a-1198-5595-error" test="count(cda:telecom) &gt; 0">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1198-5595).</sch:assert>
            <sch:assert id="a-1198-5597-error" test="count(cda:assignedPerson)=1">This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:1198-5597).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-legalAuthenticator-assignedEntity-assignedPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson">
            <sch:assert id="a-1198-5598-error" test="count(cda:name) &gt; 0">This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5598).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-inFulfillmentOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:inFulfillmentOf">
            <sch:assert id="a-1198-9953-error" test="count(cda:order)=1">The inFulfillmentOf, if present, SHALL contain exactly one [1..1] order (CONF:1198-9953).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-inFulfillmentOf-order-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:inFulfillmentOf/cda:order">
            <sch:assert id="a-1198-9954-error" test="count(cda:id) &gt; 0">This order SHALL contain at least one [1..*] id (CONF:1198-9954).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf">
            <sch:assert id="a-1198-14836-error" test="count(cda:serviceEvent)=1">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:1198-14836).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent">
            <sch:assert id="a-1198-14837-error" test="count(cda:effectiveTime)=1">This serviceEvent SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14837).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-effectiveTime-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:effectiveTime">
            <sch:assert id="a-1198-14838-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-14838).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
            <sch:assert id="a-1198-14840-error" test="@typeCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.19601']/voc:code/@value">The performer, if present, SHALL contain exactly one [1..1] @typeCode, which SHALL be selected from ValueSet x_ServiceEventPerformer urn:oid:2.16.840.1.113883.1.11.19601 STATIC (CONF:1198-14840).</sch:assert>
            <sch:assert id="a-1198-14841-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-14841).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
            <sch:assert id="a-1198-14846-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-14846).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-componentOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:componentOf">
            <sch:assert id="a-1198-9956-error" test="count(cda:encompassingEncounter)=1">The componentOf, if present, SHALL contain exactly one [1..1] encompassingEncounter (CONF:1198-9956).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-componentOf-encompassingEncounter-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:componentOf/cda:encompassingEncounter">
            <sch:assert id="a-1198-9959-error" test="count(cda:id) &gt; 0">This encompassingEncounter SHALL contain at least one [1..*] id (CONF:1198-9959).</sch:assert>
            <sch:assert id="a-1198-9958-error" test="count(cda:effectiveTime)=1">This encompassingEncounter SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9958).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="US_Realm-pattern-warnings">
        <sch:rule id="US_Realm-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]">
            <sch:assert id="a-1198-5579-warning" test="count(cda:legalAuthenticator)=1">SHOULD contain zero or one [0..1] legalAuthenticator (CONF:1198-5579).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-confidentialityCode-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:confidentialityCode">
            <sch:assert id="a-1198-5259-v-warning" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC (CONF:1198-5259).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:telecom">
            <sch:assert id="a-1198-5375-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-5375).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient">
            <sch:assert id="a-1198-5303-warning" test="count(cda:maritalStatusCode)=1">This patient SHOULD contain zero or one [0..1] maritalStatusCode, which SHALL be selected from ValueSet Marital Status urn:oid:2.16.840.1.113883.1.11.12212 DYNAMIC (CONF:1198-5303).</sch:assert>
            <sch:assert id="a-1198-5406-warning" test="count(cda:languageCommunication) &gt; 0">This patient SHOULD contain zero or more [0..*] languageCommunication (CONF:1198-5406).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthTime-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
            <sch:assert id="a-1198-5300-warning" test="string-length(@value) &gt;= 8">SHOULD be precise to day (CONF:1198-5300).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian">
            <sch:assert id="a-1198-5326-warning" test="count(cda:code)=1">The guardian, if present, SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-5326).</sch:assert>
            <sch:assert id="a-1198-5359-warning" test="count(cda:addr) &gt; 0">The guardian, if present, SHOULD contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5359).</sch:assert>
            <sch:assert id="a-1198-5382-warning" test="count(cda:telecom) &gt; 0">The guardian, if present, SHOULD contain zero or more [0..*] telecom (CONF:1198-5382).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:telecom">
            <sch:assert id="a-1198-7993-warning" test="@use">The telecom, if present, SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7993).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthplace-place-addr-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr">
            <sch:assert id="a-1198-5404-warning" test="count(cda:country)=1">This addr SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:1198-5404).</sch:assert>
            <sch:assert id="a-1198-5402-warning" test="count(cda:state)=1 and (cda:country='US' or cda:country='USA')">If country is US, this addr SHALL contain exactly one [1..1] state, which SHALL be selected from ValueSet StateValueSet 2.16.840.1.113883.3.88.12.80.1 DYNAMIC (CONF:1198-5402).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-patient-languageCommunication-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication">
            <sch:assert id="a-1198-9965-warning" test="count(cda:proficiencyLevelCode)=1">The languageCommunication, if present, SHOULD contain zero or one [0..1] proficiencyLevelCode, which SHALL be selected from ValueSet LanguageAbilityProficiency urn:oid:2.16.840.1.113883.1.11.12199 DYNAMIC (CONF:1198-9965).</sch:assert>
            <sch:assert id="a-1198-5414-warning" test="count(cda:preferenceInd)=1">The languageCommunication, if present, SHOULD contain zero or one [0..1] preferenceInd (CONF:1198-5414).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-providerOrganization-id-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:id">
            <sch:assert id="a-1198-16820-warning" test="@root='2.16.840.1.113883.4.6'">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16820).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-recordTarget-patientRole-providerOrganization-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:telecom">
            <sch:assert id="a-1198-7994-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7994).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-author-assignedAuthor-assignedPerson-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:assignedPerson">
            <sch:assert id="a-1198-32882-warning" test="count(../cda:id[@root='2.16.840.1.113883.4.6'][@extension])=1">This assignedAuthor SHOULD contain zero or one [0..1] id (CONF:1198-32882) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-32884). SHOULD contain zero or one [0..1] @extension (CONF:1198-32885).</sch:assert>
            <sch:assert id="a-1198-16787-warning" test="count(../cda:code)=1">This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:1198-16787).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-author-assignedAuthor-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:telecom">
            <sch:assert id="a-1198-7995-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7995).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-dataEnterer-assignedEntity-id-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity/cda:id">
            <sch:assert id="a-1198-16821-warning" test="@root='2.16.840.1.113883.4.6'">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16821).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-dataEnterer-assignedEntity-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity/cda:telecom">
            <sch:assert id="a-1198-7996-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7996).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-custodian-assignedCustodian-representedCustodianOrganization-id-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:id">
            <sch:assert id="a-1198-16822-warning" test="@root='2.16.840.1.113883.4.6'">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16822).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-custodian-assignedCustodian-representedCustodianOrganization-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:telecom">
            <sch:assert id="a-1198-7998-warning" test="@use">This telecom SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7998).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-legalAuthenticator-assignedEntity-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:telecom">
            <sch:assert id="a-1198-7999-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7999).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent">
            <sch:assert id="a-1198-14839-warning" test="count(cda:performer) &gt; 0">This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:1198-14839).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-functionCode-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:functionCode">
            <sch:assert id="a-1198-32889-warning" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.10267']/voc:code/@value">The functionCode, if present, SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet ParticipationFunction urn:oid:2.16.840.1.113883.1.11.10267 STATIC (CONF:1198-32889).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-assignedEntity-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
            <sch:assert id="a-1198-14842-warning" test="count(cda:code)=1">This assignedEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-14842).</sch:assert>
        </sch:rule>
        <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-assignedEntity-id-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:id">
            <sch:assert id="a-1198-14847-warning" test="@root='2.16.840.1.113883.4.6'">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-14847).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>