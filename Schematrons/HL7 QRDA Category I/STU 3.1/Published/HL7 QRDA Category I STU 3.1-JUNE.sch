<?xml version="1.0" encoding="UTF-8"?>
<!--
    HL7 QRDA 1 STU 3.1 generated schematron 

    HL7 QRDA I STU 3.1 generated schematron.

    Tue May 30 10:40:29 MDT 2017 

-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:voc="http://www.lantanagroup.com/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:phase id="errors">
    <sch:active pattern="Assessment_performed-pattern-errors" />
    <sch:active pattern="Assessment_recommended-pattern-errors" />
    <sch:active pattern="Diagnosis_concern_act_V2-pattern-errors" />
    <sch:active pattern="Fulfills_V2-pattern-errors" />
    <sch:active pattern="Patient_data_section_QDM_V4-pattern-errors" />
    <sch:active pattern="QDM_based_QRDA_V4-pattern-errors" />
    <sch:active pattern="Symptom-Concern-Act-pattern-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="QDM_based_QRDA_V4-pattern-warnings" />
  </sch:phase>
  <sch:pattern id="Assessment_performed-pattern-errors">
    <sch:rule id="Assessment_performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144']]">
      <sch:assert id="a-3265-28670-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3265-28670).</sch:assert>
      <sch:assert id="a-3265-28669-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3265-28669).</sch:assert>
      <sch:assert id="a-3265-28652-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-28652) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.144" (CONF:3265-28660) SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28701).</sch:assert>
      <sch:assert id="a-3265-28656-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3265-28656).</sch:assert>
      <sch:assert id="a-3265-28653-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3265-28653).</sch:assert>
      <sch:assert id="a-3265-28654-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3265-28654).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_performed-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144']]/cda:code">
      <sch:assert id="a-3265-28667-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3265-28667).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144']]/cda:statusCode">
      <sch:assert id="a-3265-28662-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3265-28662).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_performed-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144']]/cda:effectiveTime">
      <sch:assert id="a-3265-28663-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3265-28663).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_performed-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144']]/cda:methodCode">
      <sch:assert id="a-3265-28698-error" test="@sdtc:valueSet">The methodCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3265-28698).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Assessment_recommended-pattern-errors">
    <sch:rule id="Assessment_recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145']]">
      <sch:assert id="a-3265-28682-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3265-28682).</sch:assert>
      <sch:assert id="a-3265-28681-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3265-28681).</sch:assert>
      <sch:assert id="a-3265-28673-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-28673) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.145" (CONF:3265-28676).</sch:assert>
      <sch:assert id="a-3265-28674-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3265-28674).</sch:assert>
      <sch:assert id="a-3265-28680-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:3265-28680) SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28702).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_recommended-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145']]/cda:code">
      <sch:assert id="a-3265-28679-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3265-28679).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_recommended-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145']]/cda:methodCode">
      <sch:assert id="a-3265-28700-error" test="@sdtc:valueSet">The methodCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3265-28700).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Diagnosis_concern_act_V2-pattern-errors">
    <sch:rule id="Diagnosis_concern_act_V2-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01']]">
      <sch:assert id="a-3265-28148-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3265-28148).</sch:assert>
      <sch:assert id="a-3265-28149-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3265-28149).</sch:assert>
      <sch:assert id="a-3265-28143-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-28143) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.137" (CONF:3265-28146). SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28692).</sch:assert>
      <sch:assert id="a-3265-28144-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3265-28144).</sch:assert>
      <sch:assert id="a-3265-28210-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3265-28210).</sch:assert>
      <sch:assert id="a-3265-28142-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135' ]])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3265-28142) such that it  SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3265-28151).  SHALL contain exactly one [1..1] Diagnosis (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.135) (CONF:3265-28145).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnosis_concern_act_V2-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01']]/cda:statusCode">
      <sch:assert id="a-3265-28150-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet QDM Diagnosis Status urn:oid:2.16.840.1.113762.1.4.1021.35 DYNAMIC (CONF:3265-28150).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnosis_concern_act_V2-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2016-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3265-28211-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3265-28211).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Fulfills_V2-pattern-errors">
    <sch:rule id="Fulfills_V2-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2016-08-01']]">
      <sch:assert id="a-3265-28381-error" test="@typeCode='FLFS'">SHALL contain exactly one [1..1] @typeCode="FLFS" Fulfills (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3265-28381).</sch:assert>
      <sch:assert id="a-3265-28379-error" test="count(sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] sdtc:templateId (CONF:3265-28379) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.126" (CONF:3265-28382).  SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:3265-28383).</sch:assert>
      <sch:assert id="a-3265-28380-error" test="count(sdtc:actReference)=1">SHALL contain exactly one [1..1] sdtc:actReference (CONF:3265-28380).</sch:assert>
    </sch:rule>
    <sch:rule id="Fulfills_V2-actReference-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2016-08-01']]/sdtc:actReference">
      <sch:assert id="a-3265-28384-error" test="@classCode">This sdtc:actReference SHALL contain exactly one [1..1] @classCode (CONF:3265-28384).</sch:assert>
      <sch:assert id="a-3265-28385-error" test="@moodCode">This sdtc:actReference SHALL contain exactly one [1..1] @moodCode (CONF:3265-28385).</sch:assert>
      <sch:assert id="a-3265-28386-error" test="count(sdtc:id)&gt;=1">This sdtc:actReference SHALL contain at least one [1..*] sdtc:id (CONF:3265-28386).</sch:assert>
    </sch:rule>
    <sch:rule id="Fulfills_V2-actReference-id-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2016-08-01']]/sdtc:actReference/sdtc:id">
      <sch:assert id="a-3265-28690-error" test="@root">Such sdtc:ids SHALL contain exactly one [1..1] @root (CONF:3265-28690).</sch:assert>
      <sch:assert id="a-3265-28691-error" test="@extension">Such sdtc:ids SHALL contain exactly one [1..1] @extension (CONF:3265-28691).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_data_section_QDM_V4-pattern-errors">
    <sch:rule id="Patient_data_section_QDM_V4-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2016-08-01']]">
      <sch:assert id="a-3265-12796-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-12796) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.1" (CONF:3265-12797). SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28405).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QDM_based_QRDA_V4-pattern-warnings">
    <sch:rule id="QDM_based_QRDA_V4-recordTarget-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:recordTarget">
      <sch:assert id="a-3265-16857-warning" test="cda:patientRole[count(cda:id[@root='2.16.840.1.113883.4.572'])=1]">This patientRole SHOULD contain zero or one [0..1] id (CONF:3265-16857) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.572" Medicare HIC number (CONF:3265-16858).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-3265-28241-warning" test="count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:3265-28241) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" CMS Certification Number (CONF:3265-28244). SHALL contain exactly one [1..1] @extension (CONF:3265-28245).</sch:assert>
      <sch:assert id="a-3265-28242-warning" test="count(cda:id[@root='2.16.840.1.113883.4.2'][@extension])=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:3265-28242) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:3265-28246). SHALL contain exactly one [1..1] @extension (CONF:3265-28247).</sch:assert>
      <sch:assert id="a-3265-28243-warning" test="count(cda:id[@root='1.3.6.1.4.1.33895'][@extension])=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] id (CONF:3265-28243) such that it SHALL contain exactly one [1..1] @root="1.3.6.1.4.1.33895" The Joint Commission’s Health Care Organization (HCO) Identification Number (CONF:3265-28248). SHALL contain exactly one [1..1] @extension (CONF:3265-28249).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-documentationOf-serviceEvent-performer-assignedEntity-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-3265-16587-warning" test="count(cda:id[@root='2.16.840.1.113883.4.6'])=1">This assignedEntity SHOULD contain zero or one [0..1] id (CONF:3265-16587) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:3265-16588).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-3265-16592-warning" test="count(cda:id[@root='2.16.840.1.113883.4.2'])=1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:3265-16592) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:3265-16593).</sch:assert>
      <sch:assert id="a-3265-16595-warning" test="count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:3265-16595) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" Facility CMS Certification Number (CONF:3265-16596). SHALL contain exactly one [1..1] @extension (CONF:3265-16597).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QDM_based_QRDA_V4-pattern-errors">
    <sch:rule id="QDM_based_QRDA_V4-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]">
      <sch:assert id="a-3265-12972-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-12972) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.2" (CONF:3265-26943). SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28696).</sch:assert>
      <sch:assert id="a-3265-16598-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:3265-16598).</sch:assert>
      <sch:assert id="a-3265-16600-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:3265-16600).</sch:assert>
      <sch:assert id="a-3265-12973-error" test="count(cda:component[count(cda:structuredBody)=1])=1">SHALL contain exactly one [1..1] component (CONF:3265-12973) such that it SHALL contain exactly one [1..1] structuredBody (CONF:3265-17081).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:recordTarget">
      <sch:assert id="a-3265-16856-error" test="count(cda:patientRole)=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:3265-16856).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-recordTarget-patientRole-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:recordTarget/cda:patientRole">
      <sch:assert id="a-3265-27570-error" test="count(cda:patient)=1">This patientRole SHALL contain exactly one [1..1] patient (CONF:3265-27570).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-recordTarget-patientRole-patient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:recordTarget/cda:patientRole/cda:patient">
      <sch:assert id="a-3265-27571-error" test="count(cda:birthTime)=1">This patient SHALL contain exactly one [1..1] birthTime (CONF:3265-27571).</sch:assert>
      <sch:assert id="a-3265-27572-error" test="count(cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode (CONF:3265-27572).</sch:assert>
      <sch:assert id="a-3265-27573-error" test="count(cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode (CONF:3265-27573).</sch:assert>
      <sch:assert id="a-3265-27574-error" test="count(cda:ethnicGroupCode)=1">This patient SHALL contain exactly one [1..1] ethnicGroupCode (CONF:3265-27574).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:custodian">
      <sch:assert id="a-3265-28239-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:3265-28239).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-3265-28240-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:3265-28240).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:informationRecipient">
      <sch:assert id="a-3265-16704-error" test="count(cda:intendedRecipient)=1">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:3265-16704).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-informationRecipient-intendedRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:informationRecipient/cda:intendedRecipient">
      <sch:assert id="a-3265-16705-error" test="count(cda:id) &gt; 0">This intendedRecipient SHALL contain at least one [1..*] id (CONF:3265-16705).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V4-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2016-08-01']]/cda:component/cda:structuredBody">
      <sch:assert id="a-3265-17082-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3265-17082). This component SHALL contain exactly one [1..1] Measure Section QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.3) (CONF:3265-17083).</sch:assert>
      <sch:assert id="a-3265-17090-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3265-17090). This component SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:3265-17092).</sch:assert>
      <sch:assert id="a-3265-17091-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2016-08-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3265-17091). This component SHALL contain exactly one [1..1] Patient Data Section QDM (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.2.1:2016-08-01) (CONF:3265-17093).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Symptom-Concern-Act-pattern-errors">
    <sch:rule id="Symptom-Concern-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01']]">
      <sch:assert id="a-3265-28547-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3265-28547).</sch:assert>
      <sch:assert id="a-3265-28548-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3265-28548).</sch:assert>
      <sch:assert id="a-3265-28539-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3265-28539) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.138" (CONF:3265-28544). SHALL contain exactly one [1..1] @extension="2016-08-01" (CONF:3265-28694).</sch:assert>
      <sch:assert id="a-3265-28540-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3265-28540).</sch:assert>
      <sch:assert id="a-3265-28541-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3265-28541).</sch:assert>
      <sch:assert id="a-3265-28538-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3265-28538) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3265-28543). SHALL contain exactly one [1..1] Symptom (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.136) (CONF:3265-28542).</sch:assert>
    </sch:rule>
    <sch:rule id="Symptom-Concern-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01']]/cda:statusCode">
      <sch:assert id="a-3265-28545-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3265-28545).</sch:assert>
    </sch:rule>
    <sch:rule id="Symptom-Concern-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2016-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3265-28546-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3265-28546).</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
