<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QDM_based_QRDA_V5-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="QDM_based_QRDA_V5-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="QDM_based_QRDA_V5-pattern-errors">
        <sch:rule id="QDM_based_QRDA_V5-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-12972-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12972) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.2" (CONF:3343-26943). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28696).</sch:assert>
            <sch:assert id="a-3343-16598-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:3343-16598).</sch:assert>
            <sch:assert id="a-3343-16600-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:3343-16600).</sch:assert>
            <!-- Changed 12973 by removing "such that" constraint to enforce the "only one component, period." rule. " -->
            <sch:assert id="a-3343-12973-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:3343-12973).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V5-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:recordTarget">
            <sch:assert id="a-3343-16856-error" test="count(cda:patientRole)=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:3343-16856).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V5-recordTarget-patientRole-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:recordTarget/cda:patientRole">
            <sch:assert id="a-3343-27570-error" test="count(cda:patient)=1">This patientRole SHALL contain exactly one [1..1] patient (CONF:3343-27570).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V5-recordTarget-patientRole-patient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:recordTarget/cda:patientRole/cda:patient">
            <sch:assert id="a-3343-27571-error" test="count(cda:birthTime)=1">This patient SHALL contain exactly one [1..1] birthTime (CONF:3343-27571).</sch:assert>
            <sch:assert id="a-3343-27572-error" test="count(cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode (CONF:3343-27572).</sch:assert>
            <sch:assert id="a-3343-27573-error" test="count(cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode (CONF:3343-27573).</sch:assert>
            <sch:assert id="a-3343-27574-error" test="count(cda:ethnicGroupCode)=1">This patient SHALL contain exactly one [1..1] ethnicGroupCode (CONF:3343-27574).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V5-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:custodian">
            <sch:assert id="a-3343-28239-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:3343-28239).</sch:assert>
        </sch:rule>
    	<sch:rule id="QDM_based_QRDA_V5-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:custodian/cda:assignedCustodian">
    		<sch:assert id="a-3343-28240-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:3343-28240).</sch:assert>
    	</sch:rule>
    	<sch:rule id="QDM_based_QRDA_V5-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:informationRecipient">
            <sch:assert id="a-3343-16704-error" test="count(cda:intendedRecipient)=1">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:3343-16704).</sch:assert>
        </sch:rule>
    	<sch:rule id="QDM_based_QRDA_V5-informationRecipient-intendedRecipient-errors" 	context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:informationRecipient/cda:intendedRecipient">
    		<sch:assert id="a-3343-16705-error" test="count(cda:id) &gt; 0">This intendedRecipient SHALL contain at least one [1..*] id (CONF:3343-16705).</sch:assert>
    	</sch:rule>
        <!-- Added constraint to insure component has only one structured body -->
        <sch:rule id="QDM_based_QRDA_V5-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:component">
            <sch:assert id="a-3343-17081-error" test="count(count(cda:structuredBody))=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:3343-17081).</sch:assert>
        </sch:rule>
            
    	<sch:rule id="QDM_based_QRDA_V5-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:component/cda:structuredBody">
    	    <sch:assert id="a-3343-17082-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-17082). This component SHALL contain exactly one [1..1] Measure Section QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.3) (CONF:3343-17083).</sch:assert>
    	    <sch:assert id="a-3343-17090-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-17090). This component SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:3343-17092).</sch:assert>
    	    <sch:assert id="a-3343-17091-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2017-08-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-17091). This component SHALL contain exactly one [1..1] Patient Data Section QDM (V5) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.2.1:2017-08-01) (CONF:3343-17093).</sch:assert>
    	</sch:rule>
        <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent">
            <sch:assert id="a-3343-16581-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CONF:3343-16581).</sch:assert>
            <sch:assert id="a-3343-16583-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:3343-16583).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
            <sch:assert id="a-3343-16584-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CONF:3343-16584).</sch:assert>
            <sch:assert id="a-3343-16586-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:3343-16586).</sch:assert>
        </sch:rule>
        <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
            <sch:assert id="a-3343-16591-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:3343-16591).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="QDM_based_QRDA_V5-pattern-warnings">
        <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-3343-16592-warning" test="count(cda:id[@root='2.16.840.1.113883.4.2'])=1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:3343-16592) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:3343-16593).</sch:assert>
            <!-- 03-09-2018 Removed 3343-16595 as it is a "MAY such that" rather than a SHOULD -->
        </sch:rule>
    </sch:pattern>
    
</sch:schema>