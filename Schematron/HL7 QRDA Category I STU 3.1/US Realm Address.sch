<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="US-Realm-Address-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="US-Realm-Address-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="US-Realm-Address-pattern-errors">
        <sch:rule id="US-Realm-Address-errors" context="cda:addr[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']/cda:recordTarget/cda:patientRole
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3']]/cda:recordTarget/cda:patientRole
            or parent::cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]/cda:performer/cda:assignedEntity
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:assignedAuthor
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:dataEnterer/cda:assignedEntity
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:assignedEntity
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian]]">
            <sch:assert id="a-81-7292-error" test="count(cda:city)=1">SHALL contain exactly one [1..1] city (CONF:81-7292). </sch:assert>
            <sch:assert id="a-81-7291-error" test="count(cda:streetAddressLine)=1">SHALL contain exactly one [1..1] streetAddressLine (CONF:81-7291).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="US-Realm-Address-pattern-warnings">
        <sch:rule id="US-Realm-Address-warnings" context="cda:addr[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']/cda:recordTarget/cda:patientRole
            or parent::cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]/cda:performer/cda:assignedEntity
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:assignedAuthor
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:dataEnterer/cda:assignedEntity
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:assignedEntity
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian]]">
            <sch:assert id="a-81-7290-warning" test="@use">SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet PostalAddressUse urn:oid:2.16.840.1.113883.1.11.10637 STATIC 2005-05-01 (CONF:81-7290).</sch:assert>
            <sch:assert id="a-81-7295-warning" test="count(cda:country)=1">SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:81-7295).</sch:assert>
            <sch:assert id="a-81-7293-warning" test="count(cda:state)=1">SHOULD contain zero or one [0..1] state (ValueSet: StateValueSet urn:oid:2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:81-7293).</sch:assert>
            <sch:assert id="a-81-7294-warning" test="count(cda:postalCode)=1">SHOULD contain zero or one [0..1] postalCode, which SHOULD be selected from ValueSet PostalCode urn:oid:2.16.840.1.113883.3.88.12.80.2 DYNAMIC (CONF:81-7294).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>