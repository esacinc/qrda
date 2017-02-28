<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_I_Report_CMS-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="QRDA_Category_I_Report_CMS-pattern-errors">
        <sch:rule id="QRDA_Category_I_Report_CMS-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]">
            <sch:assert id="a-CMS_0001-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_0001) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.3" (CONF:CMS_0002). SHALL contain exactly one [1..1] @extension="2017-07-01" (CONF:CMS_0003).</sch:assert>
            <sch:assert id="a-2228-16703_C01-error" test="count(cda:informationRecipient)=1">SHALL contain exactly one [1..1] informationRecipient (CONF:2228-16703_C01).</sch:assert>
            <sch:assert id="a-1198-10003_C01-error" test="count(cda:participant)=1">SHALL contain exactly one [1..1] participant (CONF:1198-10003_C01).</sch:assert>
            <sch:assert id="a-3265-16579_C01-error" test="count(cda:documentationOf[count(cda:serviceEvent)=1])=1">SHALL contain exactly one [1..1] documentationOf (CONF:3265-16579_C01) such that it SHALL contain exactly one [1..1] serviceEvent (CONF:3265-16580).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:languageCode">
            <sch:assert id="a-CMS_0010-error" test="@code='en'">This languageCode SHALL contain exactly one [1..1] @code="en" (CONF:CMS_0010).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-recordTarget-patientRole-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:recordTarget/cda:patientRole">
            <sch:assert id="a-CMS_0009-error" test="count(cda:id[@root!='2.16.840.1.113883.4.572'][@extension])=1">This patientRole SHALL contain exactly one [1..1] id (CONF:CMS_0009) such that it SHALL contain exactly one [1..1] @root (CONF:CMS_0053). SHALL contain exactly one [1..1] @extension (CONF:CMS_0103).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-recordTarget-patientRole-patient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:recordTarget/cda:patientRole/cda:patient">
            <sch:assert id="a-1198-5284_C01-error" test="count(cda:name)=1">This patient SHALL contain exactly one [1..1] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5284_C01).</sch:assert>
            <sch:assert id="a-CMS_0011-error" test="count(cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode, which SHALL be selected from ValueSet ONC Administrative Sex urn:oid:2.16.840.1.113762.1.4.1 DYNAMIC (CONF:CMS_0011).</sch:assert>
            <sch:assert id="a-CMS_0013-error" test="count(cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode, which SHALL be selected from ValueSet Race urn:oid:2.16.840.1.114222.4.11.836 DYNAMIC (CONF:CMS_0013).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-recordTarget-patientRole-patient-birthTime-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
            <sch:assert id="a-1198-5300_C01-error" test="string-length(@value)&gt;=8">SHALL be precise to day (CONF:1198-5300_C01).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
            <sch:assert id="a-2228-28241_C01-error" test="count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1">This representedCustodianOrganization SHALL contain exactly one [1..1] id (CONF:2228-28241_C01) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" CMS Certification Number (CONF:2228-28244). SHALL contain exactly one [1..1] @extension (CONF:2228-28245).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-custodian-representedCustodianOrganization-id-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:id[@root='2.16.840.1.113883.4.336'][@extension]">
    		<sch:assert id="a-CMS_0035-error" test="string-length(normalize-space(@extension)) &gt;= 6 and string-length(normalize-space(@extension)) &lt;= 10">
		    	CCN SHALL be six to ten characters in length (CONF:CMS_0035).
    		</sch:assert>
    	</sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-informationRecipient-intendedRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:informationRecipient/cda:intendedRecipient">
            <sch:assert id="a-2228-16705_C01-error" test="count(cda:id)=1">This intendedRecipient SHALL contain exactly one [1..1] id (CONF:2228-16705_C01).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-informationRecipient-intendedRecipient-id-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:informationRecipient/cda:intendedRecipient/cda:id">
            <sch:assert id="a-CMS_0025-error" test="@root='2.16.840.1.113883.3.249.7'">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.7" (CONF:CMS_0025).</sch:assert>
            <sch:assert id="a-CMS_0026-error" test="@extension=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.249.14.103']/voc:code/@value">This id SHALL contain exactly one [1..1] @extension, which SHALL be selected from ValueSet QRDA-I CMS Program Name urn:oid:2.16.840.1.113883.3.249.14.103 STATIC 2016-03-01 (CONF:CMS_0026).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-participant-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:participant">
            <sch:assert id="a-CMS_0004-error" test="count(cda:associatedEntity)=1">This participant SHALL contain exactly one [1..1] associatedEntity (CONF:CMS_0004).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-participant-associatedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:participant/cda:associatedEntity">
            <sch:assert id="a-CMS_0005-error" test="count(cda:id)=1">This associatedEntity SHALL contain exactly one [1..1] id (CONF:CMS_0005).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_I_Report_CMS-participant-associatedEntity-id-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'][@extension='2017-07-01']]/cda:participant/cda:associatedEntity/cda:id">
            <sch:assert id="a-CMS_0006-error" test="@root='2.16.840.1.113883.3.2074.1'">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.2074.1" CMS EHR Certification Identification Number (CONF:CMS_0006).</sch:assert>
            <sch:assert id="a-CMS_0008-error" test="@extension">This id SHALL contain exactly one [1..1] @extension (CONF:CMS_0008).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>