<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:voc="http://www.lantanagroup.com/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:phase id="errors">
    <sch:active pattern="Aggregate_count-pattern-errors" />
    <sch:active pattern="Continuous_variable_measure_value-pattern-errors" />
    <sch:active pattern="Ethnicity_supp_data_element-pattern-errors" />
    <sch:active pattern="Measure_data-pattern-errors" />
    <sch:active pattern="Measure_Reference-pattern-errors" />
    <sch:active pattern="Measure_Reference_and_Results-pattern-errors" />
    <sch:active pattern="Payer_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Performance_Rate_for_Proportion_Measure-pattern-errors" />
    <sch:active pattern="Postal_Code_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Measure-pattern-errors" />
    <sch:active pattern="QRDA_Category_III-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Reporting_Parameters-pattern-errors" />
    <sch:active pattern="Race_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Reporting_Rate_for_Proportion_Measure-pattern-errors" />
    <sch:active pattern="Reporting_Stratum-pattern-errors" />
    <sch:active pattern="Service_Encounter-pattern-errors" />
    <sch:active pattern="Sex_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Measure-section-pattern-errors" />
    <sch:active pattern="Reporting-parameters-section-pattern-errors" />
    <sch:active pattern="Reporting-Parameters-Act-pattern-errors" />
    <sch:active pattern="Aggregate_count_CMS-pattern-errors" />
    <sch:active pattern="Continuous_variable_measure_value_CMS-pattern-errors" />
    <sch:active pattern="Ethnicity_supp_data_element_CMS-pattern-errors" />
    <sch:active pattern="Measure_data_CMS-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Measure_CMS-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_CMS-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Reporting_Parameters_CMS-pattern-errors" />
    <sch:active pattern="Race_Supplemental_Data_Element_CMS-pattern-errors" />
    <sch:active pattern="Reporting-Parameters-Act-CMS-pattern-errors" />
    <sch:active pattern="Reporting_Stratum_CMS-pattern-errors" />
    <sch:active pattern="Sex_Supplemental_Data_Element_CMS-pattern-errors" />
    <sch:active pattern="p-validate_PQ-errors" />
    <sch:active pattern="p-validate_REAL-errors" />
    <sch:active pattern="p-validate_CS-errors" />
    <sch:active pattern="p-validate_CD_CE-errors" />
    <sch:active pattern="p-validate_TS-errors" />
    <sch:active pattern="p-validate_NPI_format-errors" />
    <sch:active pattern="p-validate_TIN_format-errors" />
    <sch:active pattern="p-validate_II-errors" />
    <sch:active pattern="p-validate_ST-errors" />
    <sch:active pattern="p-validate_INT-errors" />
    <sch:active pattern="p-validate_BL-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="Measure_Reference-pattern-warnings" />
    <sch:active pattern="Measure_Reference_and_Results-pattern-warnings" />
    <sch:active pattern="QRDA_Category_III-pattern-warnings" />
    <sch:active pattern="Reporting_Stratum-pattern-warnings" />
    <sch:active pattern="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-warnings" />
    <sch:active pattern="QRDA_Category_III_CMS-pattern-warnings" />
    <sch:active pattern="Reporting_Stratum_CMS-pattern-warnings" />
  </sch:phase>
  <sch:pattern id="Aggregate_count-pattern-errors">
    <sch:rule id="Aggregate_count-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
      <sch:assert id="a-77-17563-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17563).</sch:assert>
      <sch:assert id="a-77-17564-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17564).</sch:assert>
      <sch:assert id="a-77-17565-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-17565) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.3" (CONF:77-18095).</sch:assert>
      <sch:assert id="a-77-17566-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17566).</sch:assert>
      <sch:assert id="a-77-17567-error" test="count(cda:value[@xsi:type='INT'])=1">SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-17567).</sch:assert>
      <sch:assert id="a-77-19509-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode (CONF:77-19509).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:code">
      <sch:assert id="a-77-19508-error" test="@code='MSRAGG'">This code SHALL contain exactly one [1..1] @code="MSRAGG" rate aggregation (CONF:77-19508).</sch:assert>
      <sch:assert id="a-77-21160-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21160).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:value[@xsi:type='INT']">
      <sch:assert id="a-77-17568-error" test="@value">This value SHALL contain exactly one [1..1] @value (CONF:77-17568).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:methodCode">
      <sch:assert id="a-77-19510-error" test="@code='COUNT'">This methodCode SHALL contain exactly one [1..1] @code="COUNT" Count (CONF:77-19510).</sch:assert>
      <sch:assert id="a-77-21161-error" test="@codeSystem='2.16.840.1.113883.5.84'">This methodCode SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.84" (CodeSystem: ObservationMethod urn:oid:2.16.840.1.113883.5.84) (CONF:77-21161).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange">
      <sch:assert id="a-77-18393-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18393).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18394-error" test="count(cda:value[@xsi:type='INT'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-18394).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Continuous_variable_measure_value-pattern-errors">
    <sch:rule id="Continuous_variable_measure_value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
      <sch:assert id="a-77-17569-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17569).</sch:assert>
      <sch:assert id="a-77-17570-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17570).</sch:assert>
      <sch:assert id="a-77-18096-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18096) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.2" (CONF:77-18097).</sch:assert>
      <sch:assert id="a-77-17571-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17571).</sch:assert>
      <sch:assert id="a-77-17572-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:77-17572).</sch:assert>
      <sch:assert id="a-77-18242-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode, which SHALL be selected from ValueSet ObservationMethodAggregate urn:oid:2.16.840.1.113883.1.11.20450 DYNAMIC (CONF:77-18242).</sch:assert>
      <sch:assert id="a-77-18243-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18243).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference">
      <sch:assert id="a-77-18244-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18244).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-18245-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18245).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange">
      <sch:assert id="a-77-18390-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18390).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18391-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:77-18391).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Ethnicity_supp_data_element-pattern-errors">
    <sch:rule id="Ethnicity_supp_data_element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]">
      <sch:assert id="a-77-18216-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18216).</sch:assert>
      <sch:assert id="a-77-18217-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18217).</sch:assert>
      <sch:assert id="a-77-18218-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18218) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.7" (CONF:77-18219).</sch:assert>
      <sch:assert id="a-77-18220-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18220).</sch:assert>
      <sch:assert id="a-77-18118-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18118).</sch:assert>
      <sch:assert id="a-77-18222-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:77-18222).</sch:assert>
      <sch:assert id="a-77-18120-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18120) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18121). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18122). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18123).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]/cda:code">
      <sch:assert id="a-77-18221-error" test="@code='364699009'">This code SHALL contain exactly one [1..1] @code="364699009" Ethnic Group (CONF:77-18221).</sch:assert>
      <sch:assert id="a-77-21164-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]/cda:statusCode">
      <sch:assert id="a-77-18119-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18119).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_data-pattern-errors">
    <sch:rule id="Measure_data-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]">
      <sch:assert id="a-2226-17615-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17615).</sch:assert>
      <sch:assert id="a-2226-17616-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17616).</sch:assert>
      <sch:assert id="a-2226-17912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:2226-17913). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21161).</sch:assert>
      <sch:assert id="a-2226-17617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-17617).</sch:assert>
      <sch:assert id="a-2226-18199-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18199).</sch:assert>
      <sch:assert id="a-2226-17618-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2226-17618).</sch:assert>
      <sch:assert id="a-2226-17619-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-17619) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:2226-17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-17911). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-17620).</sch:assert>
      <sch:assert id="a-2226-18239-error" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2226-18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2226-18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:2226-18241).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:code">
      <sch:assert id="a-2226-18198-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2226-18198).</sch:assert>
      <sch:assert id="a-2226-21164-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2226-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:statusCode">
      <sch:assert id="a-2226-19555-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19555).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:value[@xsi:type='CD']">
      <sch:assert id="a-2226-21162-error" test="@code">This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet PopulationInclusionObservationType urn:oid:2.16.840.1.113883.1.11.20476 DYNAMIC (CONF:2226-21162).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-warnings">
    <sch:rule id="Measure_Reference-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-67-12997-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:12997).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-errors">
    <sch:rule id="Measure_Reference-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:assert id="a-67-12979-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12979).</sch:assert>
      <sch:assert id="a-67-12980-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12980).</sch:assert>
      <sch:assert id="a-67-19532-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'])=1">SHALL contain exactly one [1..1] templateId (CONF:19532) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:19533).</sch:assert>
      <sch:assert id="a-67-26992-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:67-26992).</sch:assert>
      <sch:assert id="a-67-12981-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12981).</sch:assert>
      <sch:assert id="a-67-12982-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'] [count(cda:id[@root])&gt;=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:12982) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:12983).  SHALL contain exactly one [1..1] externalDocument (CONF:12984).  This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:19534).  This externalDocument SHALL contain at least one [1..*] id (CONF:12985) such that it  SHALL contain exactly one [1..1] @root (CONF:12986).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference_and_Results-pattern-warnings">
    <sch:rule id="Measure_Reference_and_Results-warnings" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:assert id="a-2226-18353-warning" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1][count(cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1'])=1][count(cda:text)=1])=1])=1">SHOULD contain exactly one [1..1] reference (CONF:2226-18353) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2226-18354). This externalObservation SHALL contain at least one [1..*] id (CONF:2226-18355). This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19554). This externalObservation SHALL contain exactly one [1..1] text (CONF:2226-18358).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-warnings" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-2226-17896-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-17896).</sch:assert>
      <sch:assert id="a-2226-17897-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:2226-17897).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference_and_Results-pattern-errors">
    <sch:rule id="Measure_Reference_and_Results-errors" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:assert id="a-2226-17887-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17887).</sch:assert>
      <sch:assert id="a-2226-17888-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17888).</sch:assert>
      <sch:assert id="a-2226-17908-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:2226-17909). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21170).</sch:assert>
      <sch:assert id="a-2226-17889-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-17889).</sch:assert>
      <sch:assert id="a-2226-17890-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'][count(cda:id [@root='2.16.840.1.113883.4.738'] [@extension])=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2226-17890) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:2226-17891). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17892). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2226-19548). This externalDocument SHALL contain exactly one [1..1] id (CONF:2226-18192) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:2226-18193).  SHALL contain exactly one [1..1] @extension (CONF:2226-21169).</sch:assert>
      <sch:assert id="a-2226-18425-error" test="count(cda:component[count(cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5' and @extension = '2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:2226-18425) such that it SHALL contain exactly one [1..1] Measure Data (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.5:2016-02-01) (CONF:2226-18426).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-statusCode-errors" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:statusCode">
      <sch:assert id="a-2226-19552-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19552).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-code-errors" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference/cda:externalDocument/cda:code">
      <sch:assert id="a-2226-19553-error" test="@code='57024-2'">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19553).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Payer_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Payer_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]">
      <sch:assert id="a-2226-21155-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-21155).</sch:assert>
      <sch:assert id="a-2226-21156-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-21156).</sch:assert>
      <sch:assert id="a-2226-18237-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-18237) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:2226-18238). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21157).</sch:assert>
      <sch:assert id="a-2226-21158-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-21158).</sch:assert>
      <sch:assert id="a-2226-18106-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-18106).</sch:assert>
      <sch:assert id="a-2226-18250-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:2226-18250).</sch:assert>
      <sch:assert id="a-2226-18108-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18108) such that it SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-18111). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18109). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18110).</sch:assert>
    </sch:rule>
    <sch:rule id="Payer_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]/cda:code">
      <sch:assert id="a-2226-21159-error" test="@code='48768-6'">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source  (CONF:2226-21159).</sch:assert>
      <sch:assert id="a-2226-21165-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21165).</sch:assert>
    </sch:rule>
    <sch:rule id="Payer_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]/cda:statusCode">
      <sch:assert id="a-2226-18107-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18107).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Performance_Rate_for_Proportion_Measure-pattern-errors">
    <sch:rule id="Performance_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]">
      <sch:assert id="a-77-18395-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18395).</sch:assert>
      <sch:assert id="a-77-18396-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18396).</sch:assert>
      <sch:assert id="a-77-19649-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:77-19650).</sch:assert>
      <sch:assert id="a-77-18397-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18397).</sch:assert>
      <sch:assert id="a-77-18421-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18421).</sch:assert>
      <sch:assert id="a-77-18399-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18399).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:code">
      <sch:assert id="a-77-18398-error" test="@code='72510-1'">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:77-18398).</sch:assert>
      <sch:assert id="a-77-21170-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21170).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:statusCode">
      <sch:assert id="a-77-18422-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18422).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference">
      <sch:assert id="a-77-19652-error" test="@typeCode='REFR'">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:77-19652).</sch:assert>
      <sch:assert id="a-77-19653-error" test="count(cda:externalObservation)=1">The reference, if present, SHALL contain exactly one [1..1] externalObservation (CONF:77-19653).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-19654-error" test="@classCode">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:77-19654).</sch:assert>
      <sch:assert id="a-77-19657-error" test="count(cda:code)=1">This externalObservation SHALL contain exactly one [1..1] code (CONF:77-19657).</sch:assert>
      <sch:assert id="a-77-19655-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-19655).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-id-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation/cda:id">
      <sch:assert id="a-77-19656-error" test="@root">This id SHALL contain exactly one [1..1] @root (CONF:77-19656).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation/cda:code">
      <sch:assert id="a-77-19658-error" test="@code='NUMER'">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:77-19658).</sch:assert>
      <sch:assert id="a-77-21165-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21165).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:referenceRange">
      <sch:assert id="a-77-18401-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18401).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18402-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18402).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Postal_Code_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Postal_Code_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]">
      <sch:assert id="a-77-18209-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18209).</sch:assert>
      <sch:assert id="a-77-18210-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18210).</sch:assert>
      <sch:assert id="a-77-18211-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18211) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.10" (CONF:77-18212).</sch:assert>
      <sch:assert id="a-77-18213-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18213).</sch:assert>
      <sch:assert id="a-77-18100-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18100).</sch:assert>
      <sch:assert id="a-77-18215-error" test="count(cda:value[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] value with @xsi:type="ST" (CONF:77-18215).</sch:assert>
      <sch:assert id="a-77-18102-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18102) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18103). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18104). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18105).</sch:assert>
    </sch:rule>
    <sch:rule id="Postal_Code_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]/cda:code">
      <sch:assert id="a-77-18214-error" test="@code='184102003'">This code SHALL contain exactly one [1..1] @code="184102003" Patient postal code (CONF:77-18214).</sch:assert>
      <sch:assert id="a-77-21166-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21166).</sch:assert>
    </sch:rule>
    <sch:rule id="Postal_Code_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]/cda:statusCode">
      <sch:assert id="a-77-18101-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18101).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Measure-pattern-errors">
    <sch:rule id="QRDA_Category_III_Measure-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']]">
      <sch:assert id="a-2226-17284-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:2226-17285). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21171).</sch:assert>
      <sch:assert id="a-2226-17906-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:2226-17906) such that it SHALL contain exactly one [1..1] Measure Reference and Results (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.1:2016-02-01) (CONF:2226-17907)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III-pattern-errors">
    <sch:rule id="QRDA_Category_III-errors" context="cda:ClinicalDocument">
      <sch:assert id="a-2226-17226-error" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:2226-17226).</sch:assert>
      <sch:assert id="a-2226-18186-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:2226-18186).</sch:assert>
      <sch:assert id="a-2226-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:2226-17209). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21168).</sch:assert>
      <sch:assert id="a-2226-17236-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2226-17236).</sch:assert>
      <sch:assert id="a-2226-17210-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-17210).</sch:assert>
      <sch:assert id="a-2226-17211-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:2226-17211).</sch:assert>
      <sch:assert id="a-2226-17237-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2226-17237).</sch:assert>
      <sch:assert id="a-2226-17238-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:2226-17238).</sch:assert>
      <sch:assert id="a-2226-17239-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:2226-17239).</sch:assert>
      <sch:assert id="a-2226-17212-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:2226-17212).</sch:assert>
      <sch:assert id="a-2226-18156-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) &gt; 0">SHALL contain at least one [1..*] author (CONF:2226-18156) such that it SHALL contain exactly one [1..1] time (CONF:2226-18158). SHALL contain exactly one [1..1] assignedAuthor (CONF:2226-18157).</sch:assert>
      <sch:assert id="a-2226-17213-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:2226-17213).</sch:assert>
      <sch:assert id="a-2226-17225-error" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:2226-17225).</sch:assert>
      <sch:assert id="a-2226-17217-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:2226-17217).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:typeId">
      <sch:assert id="a-2226-18187-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:2226-18187).</sch:assert>
      <sch:assert id="a-2226-18188-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:2226-18188).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-realmCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:realmCode">
      <sch:assert id="a-2226-17227-error" test="@code='US'">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:2226-17227).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:code">
      <sch:assert id="a-2226-19549-error" test="@code='55184-6'">This code SHALL contain exactly one [1..1] @code="55184-6" Quality Reporting Document Architecture Calculated Summary Report (CONF:2226-19549).</sch:assert>
      <sch:assert id="a-2226-21166-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21166).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:languageCode">
      <sch:assert id="a-2226-19669-error" test="@code">This languageCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:2226-19669).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:recordTarget">
      <sch:assert id="a-2226-17232-error" test="count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1" />
    </sch:rule>
    <sch:rule id="QRDA_Category_III-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-2226-18163-error" test="count(cda:representedOrganization)=1">This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:2226-18163).</sch:assert>
      <sch:assert id="a-2226-19667-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:2226-19667).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-author-assignedAuthor-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:author/cda:assignedAuthor/cda:representedOrganization">
      <sch:assert id="a-2226-18265-error" test="count(cda:name) &gt; 0">This representedOrganization SHALL contain at least one [1..*] name (CONF:2226-18265).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
      <sch:assert id="a-2226-18262-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:2226-18262).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian">
      <sch:assert id="a-2226-17214-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:2226-17214).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-2226-17215-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:2226-17215).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-2226-18165-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:2226-18165).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator">
      <sch:assert id="a-2226-18167-error" test="count(cda:time)=1">This legalAuthenticator SHALL contain exactly one [1..1] time (CONF:2226-18167).</sch:assert>
      <sch:assert id="a-2226-18168-error" test="count(cda:signatureCode)=1">This legalAuthenticator SHALL contain exactly one [1..1] signatureCode (CONF:2226-18168).</sch:assert>
      <sch:assert id="a-2226-19670-error" test="count(cda:assignedEntity)=1">This legalAuthenticator SHALL contain exactly one [1..1] assignedEntity (CONF:2226-19670).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator/cda:signatureCode">
      <sch:assert id="a-2226-18169-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CONF:2226-18169).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2226-19672-error" test="count(cda:id) &gt; 0">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:2226-19672).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf">
      <sch:assert id="a-2226-18171-error" test="count(cda:serviceEvent)=1">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:2226-18171).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent">
      <sch:assert id="a-2226-18172-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-18172).</sch:assert>
      <sch:assert id="a-2226-18173-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:2226-18173).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent/cda:performer">
      <sch:assert id="a-2226-18174-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2226-18174).</sch:assert>
      <sch:assert id="a-2226-18176-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:2226-18176).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-2226-19474-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:2226-19474).</sch:assert>
      <sch:assert id="a-2226-18180-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:2226-18180).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization">
      <sch:assert id="a-2226-18360-error" test="count(cda:consent)=1">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:2226-18360).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-consent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization/cda:consent">
      <sch:assert id="a-2226-18361-error" test="count(cda:id)=1">This consent SHALL contain exactly one [1..1] id (CONF:2226-18361).</sch:assert>
      <sch:assert id="a-2226-18363-error" test="count(cda:code)=1">This consent SHALL contain exactly one [1..1] code (CONF:2226-18363).</sch:assert>
      <sch:assert id="a-2226-18364-error" test="count(cda:statusCode)=1">This consent SHALL contain exactly one [1..1] statusCode (CONF:2226-18364).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-consent-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization/cda:consent/cda:code">
      <sch:assert id="a-2226-19550-error" test="@code='425691002'">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CONF:2226-19550).</sch:assert>
      <sch:assert id="a-2226-21172-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2226-21172).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-consent-statusCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization/cda:consent/cda:statusCode">
      <sch:assert id="a-2226-19551-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19551).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:component">
      <sch:assert id="a-2226-17235-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:2226-17235).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:component/cda:structuredBody">
      <sch:assert id="a-2226-17281-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2226-17281) such that it SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.27.2.2) (CONF:2226-17282).</sch:assert>
      <sch:assert id="a-2226-17283-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2016-02-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2226-17283) such that it SHALL contain exactly one [1..1] QRDA Category III Measure Section (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.2.1:2016-02-01) (CONF:2226-17301).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III-pattern-warnings">
    <sch:rule id="QRDA_Category_III-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]">
      <sch:assert id="a-2226-17238-v-warning" test="count(cda:confidentialityCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value])=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:2226-17238).</sch:assert>
      <sch:assert id="a-2226-18260-warning" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:2226-18260).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-2226-18166-warning" test="count(cda:name)=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:2226-18166).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2226-19673-warning" test="count(cda:name)=1">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:2226-19673).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2226-19659-error" test="count(cda:name) &gt; 0">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:2226-19659).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Reporting_Parameters-pattern-errors">
    <sch:rule id="QRDA_Category_III_Reporting_Parameters-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']]">
      <sch:assert id="a-1109-18323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:18323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.2" (CONF:18324).</sch:assert>
      <sch:assert id="a-1109-18325-error" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1]) &gt; 0" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Race_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Race_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]">
      <sch:assert id="a-77-18223-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18223).</sch:assert>
      <sch:assert id="a-77-18224-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18224).</sch:assert>
      <sch:assert id="a-77-18225-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:77-18226).</sch:assert>
      <sch:assert id="a-77-18227-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18227).</sch:assert>
      <sch:assert id="a-77-18112-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18112).</sch:assert>
      <sch:assert id="a-77-18114-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18116). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18117).</sch:assert>
      <sch:assert id="a-77-18229-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Race urn:oid:2.16.840.1.114222.4.11.836 DYNAMIC (CONF:77-18229).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]/cda:code">
      <sch:assert id="a-77-18228-error" test="@code='103579009'">This code SHALL contain exactly one [1..1] @code="103579009" Race (CONF:77-18228).</sch:assert>
      <sch:assert id="a-77-21167-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21167).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]/cda:statusCode">
      <sch:assert id="a-77-18113-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18113).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Rate_for_Proportion_Measure-pattern-errors">
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]">
      <sch:assert id="a-77-18411-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18411).</sch:assert>
      <sch:assert id="a-77-18412-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18412).</sch:assert>
      <sch:assert id="a-77-21157-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-21157) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.15" (CONF:77-21158).</sch:assert>
      <sch:assert id="a-77-18413-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18413).</sch:assert>
      <sch:assert id="a-77-18419-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18419).</sch:assert>
      <sch:assert id="a-77-18415-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18415).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:code">
      <sch:assert id="a-77-18414-error" test="@code='72509-3'">This code SHALL contain exactly one [1..1] @code="72509-3" Reporting Rate (CONF:77-18414).</sch:assert>
      <sch:assert id="a-77-21168-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21168).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:statusCode">
      <sch:assert id="a-77-18420-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18420).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:referenceRange">
      <sch:assert id="a-77-18417-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18417).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18418-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18418).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum-pattern-warnings">
    <sch:rule id="Reporting_Stratum-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:assert id="a-77-17580-warning" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:17580).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum-pattern-errors">
    <sch:rule id="Reporting_Stratum-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:assert id="a-77-17575-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17575).</sch:assert>
      <sch:assert id="a-77-17576-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17576).</sch:assert>
      <sch:assert id="a-77-18093-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18093) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.4" (CONF:77-18094).</sch:assert>
      <sch:assert id="a-77-17577-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17577).</sch:assert>
      <sch:assert id="a-77-17579-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-17579).</sch:assert>
      <sch:assert id="a-77-17581-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:77-17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-17583). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-17584).</sch:assert>
      <sch:assert id="a-77-18204-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18204).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:code">
      <sch:assert id="a-77-17578-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:77-17578).</sch:assert>
      <sch:assert id="a-77-21169-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21169).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:statusCode">
      <sch:assert id="a-77-18201-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18201).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:reference">
      <sch:assert id="a-77-18205-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18205).</sch:assert>
      <sch:assert id="a-77-18206-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18206).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-18207-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18207).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Service_Encounter-pattern-errors">
    <sch:rule id="Service_Encounter-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11']]">
      <sch:assert id="a-77-18312-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18312).</sch:assert>
      <sch:assert id="a-77-21154-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-21154).</sch:assert>
      <sch:assert id="a-77-18369-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.11" (CONF:77-18370).</sch:assert>
      <sch:assert id="a-77-18314-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:77-18314).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Sex_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Sex_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]">
      <sch:assert id="a-2226-18230-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-18230).</sch:assert>
      <sch:assert id="a-2226-18231-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-18231).</sch:assert>
      <sch:assert id="a-2226-18232-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'] [@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-18232) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.6" (CONF:2226-18233).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21160).</sch:assert>
      <sch:assert id="a-2226-18234-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-18234).</sch:assert>
      <sch:assert id="a-2226-18124-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-18124).</sch:assert>
      <sch:assert id="a-2226-18236-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet ONC Administrative Sex urn:oid:2.16.840.1.113762.1.4.1 DYNAMIC (CONF:2226-18236).</sch:assert>
      <sch:assert id="a-2226-18126-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18126) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18127). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18128). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-18129).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]/cda:code">
      <sch:assert id="a-2226-18235-error" test="@code='184100006'">This code SHALL contain exactly one [1..1] @code="184100006" Patient sex (CONF:2226-18235).</sch:assert>
      <sch:assert id="a-2226-21163-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:2226-21163).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]/cda:statusCode">
      <sch:assert id="a-2226-18125-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18125).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure-section-pattern-errors">
    <sch:rule id="Measure-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:assert id="a-67-12801-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:12802).</sch:assert>
      <sch:assert id="a-67-12798-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:12798).</sch:assert>
      <sch:assert id="a-67-12799-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:12799).</sch:assert>
      <sch:assert id="a-67-12800-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:12800).</sch:assert>
      <sch:assert id="a-67-13003-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:13003).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]/cda:code">
      <sch:assert id="a-67-19230-error" test="@code='55186-1'">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CONF:19230).</sch:assert>
      <sch:assert id="a-67-27012-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:27012).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure-section-entry-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]/cda:entry">
      <sch:assert id="a-67-16677-error" test="count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']])=1">Such entries SHALL contain exactly one [1..1] Measure Reference (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.98) (CONF:16677).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting-parameters-section-pattern-errors">
    <sch:rule id="Reporting-parameters-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:assert id="a-23-14611-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1'])=1">SHALL contain exactly one [1..1] templateId (CONF:23-14611) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.1" (CONF:23-14612).</sch:assert>
      <sch:assert id="a-23-18191-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:23-18191).</sch:assert>
      <sch:assert id="a-23-4142-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='reporting parameters'])=1">SHALL contain exactly one [1..1] title="Reporting Parameters" (CONF:23-4142).</sch:assert>
      <sch:assert id="a-23-4143-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:23-4143).</sch:assert>
      <sch:assert id="a-23-3277-error" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:23-3277) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:23-3278). SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:23-17496).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-parameters-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]/cda:code">
      <sch:assert id="a-23-19229-error" test="@code='55187-9'">This code SHALL contain exactly one [1..1] @code="55187-9" Reporting Parameters (CONF:23-19229).</sch:assert>
      <sch:assert id="a-23-26552-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:23-26552).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting-Parameters-Act-pattern-errors">
    <sch:rule id="Reporting-Parameters-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:assert id="a-23-3269-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:23-3269).</sch:assert>
      <sch:assert id="a-23-3270-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:23-3270).</sch:assert>
      <sch:assert id="a-23-7323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:23-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:23-18099).</sch:assert>
      <sch:assert id="a-23-26549-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:23-26549).</sch:assert>
      <sch:assert id="a-23-3272-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:23-3272).</sch:assert>
      <sch:assert id="a-23-3273-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:23-3273).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]/cda:code">
      <sch:assert id="a-23-26550-error" test="@code='252116004'">This code SHALL contain exactly one [1..1] @code="252116004" Observation Parameters (CONF:23-26550).</sch:assert>
      <sch:assert id="a-23-26551-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:23-26551).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]/cda:effectiveTime">
      <sch:assert id="a-23-3274-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:23-3274).</sch:assert>
      <sch:assert id="a-23-3275-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:23-3275).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Aggregate_count_CMS-pattern-errors">
    <sch:rule id="Aggregate_count_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]">
      <sch:assert id="a-1109-17563-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1109-17563).</sch:assert>
      <sch:assert id="a-1109-17564-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1109-17564).</sch:assert>
      <sch:assert id="a-1109-711262-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-711262) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.24" (CONF:1109-711263).</sch:assert>
      <sch:assert id="a-1109-17565-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-17565) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.3" (CONF:1109-18095).</sch:assert>
      <sch:assert id="a-1109-17566-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1109-17566).</sch:assert>
      <sch:assert id="a-1109-711244-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1109-711244).</sch:assert>
      <sch:assert id="a-1109-17567-error" test="count(cda:value[@xsi:type='INT'])=1">SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:1109-17567).</sch:assert>
      <sch:assert id="a-1109-19509-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode (CONF:1109-19509).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]/cda:code">
      <sch:assert id="a-1109-19508-error" test="@code='MSRAGG'">This code SHALL contain exactly one [1..1] @code="MSRAGG" rate aggregation (CONF:1109-19508).</sch:assert>
      <sch:assert id="a-1109-21160-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1109-21160).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]/cda:statusCode">
      <sch:assert id="a-1109-711245-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1109-711245).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count_CMS-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]/cda:value[@xsi:type='INT']">
      <sch:assert id="a-1109-17568-error" test="@value">This value SHALL contain exactly one [1..1] @value (CONF:1109-17568).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count_CMS-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]/cda:methodCode">
      <sch:assert id="a-1109-19510-error" test="@code='COUNT'">This methodCode SHALL contain exactly one [1..1] @code="COUNT" Count (CONF:1109-19510).</sch:assert>
      <sch:assert id="a-1109-21161-error" test="@codeSystem='2.16.840.1.113883.5.84'">This methodCode SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.84" (CodeSystem: ObservationMethod urn:oid:2.16.840.1.113883.5.84) (CONF:1109-21161).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Continuous_variable_measure_value_CMS-pattern-errors">
    <sch:rule id="Continuous_variable_measure_value_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26']]">
      <sch:assert id="a-1109-17569-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1109-17569).</sch:assert>
      <sch:assert id="a-1109-17570-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1109-17570).</sch:assert>
      <sch:assert id="a-1109-711264-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-711264) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.26" (CONF:1109-711265).</sch:assert>
      <sch:assert id="a-1109-18096-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-18096) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.2" (CONF:1109-18097).</sch:assert>
      <sch:assert id="a-1109-17571-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1109-17571).</sch:assert>
      <sch:assert id="a-1109-711241-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1109-711241).</sch:assert>
      <sch:assert id="a-1109-17572-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1109-17572).</sch:assert>
      <sch:assert id="a-1109-18242-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode, which SHALL be selected from ValueSet ObservationMethodAggregate urn:oid:2.16.840.1.113883.1.11.20450 DYNAMIC (CONF:1109-18242).</sch:assert>
      <sch:assert id="a-1109-18243-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:1109-18243).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26']]/cda:statusCode">
      <sch:assert id="a-1109-711242-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1109-711242).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value_CMS-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26']]/cda:reference">
      <sch:assert id="a-1109-18244-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:1109-18244).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value_CMS-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-1109-711205-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:1109-711205).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Ethnicity_supp_data_element_CMS-pattern-errors">
    <sch:rule id="Ethnicity_supp_data_element_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22']]">
      <sch:assert id="a-1109-18216-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1109-18216).</sch:assert>
      <sch:assert id="a-1109-18217-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1109-18217).</sch:assert>
      <sch:assert id="a-1109-711253-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-711253) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.22" (CONF:1109-711254).</sch:assert>
      <sch:assert id="a-1109-18218-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-18218) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.7" (CONF:1109-18219).</sch:assert>
      <sch:assert id="a-1109-18220-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1109-18220).</sch:assert>
      <sch:assert id="a-1109-18118-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1109-18118).</sch:assert>
      <sch:assert id="a-1109-18222-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:1109-18222).</sch:assert>
      <sch:assert id="a-1109-18120-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:1109-18120) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1109-18121). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:1109-18122). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:1109-711201).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22']]/cda:code">
      <sch:assert id="a-1109-18221-error" test="@code='364699009'">This code SHALL contain exactly one [1..1] @code="364699009" Ethnic Group (CONF:1109-18221).</sch:assert>
      <sch:assert id="a-1109-21164-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1109-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22']]/cda:statusCode">
      <sch:assert id="a-1109-18119-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1109-18119).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_data_CMS-pattern-errors">
    <sch:rule id="Measure_data_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]">
      <sch:assert id="a-2233-17615-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-17615).</sch:assert>
      <sch:assert id="a-2233-17616-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2233-17616).</sch:assert>
      <sch:assert id="a-2233-711266-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711266) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.16" (CONF:2233-711267). SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711287).</sch:assert>
      <sch:assert id="a-2233-17912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:2233-17913). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2233-21161).</sch:assert>
      <sch:assert id="a-2233-17617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-17617).</sch:assert>
      <sch:assert id="a-2233-18199-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2233-18199).</sch:assert>
      <sch:assert id="a-2233-17618-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2233-17618).</sch:assert>
      <sch:assert id="a-2233-17619-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2233-17619) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:2233-17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2233-17911). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:2233-711198).</sch:assert>
      <sch:assert id="a-2233-711190-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21'][@extension='2016-03-01']])=1])=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711190) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18137). SHALL contain exactly one [1..1] Sex Supplemental Data Element (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.21:2016-03-01) (CONF:2233-711181).</sch:assert>
      <sch:assert id="a-2233-711191-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22']])=1])=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711191) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18144). SHALL contain exactly one [1..1] Ethnicity Supplemental Data Element (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.22) (CONF:2233-711182).</sch:assert>
      <sch:assert id="a-2233-711192-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19']])=1])=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711192) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18145). SHALL contain exactly one [1..1] Race Supplemental Data Element (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.19) (CONF:2233-711183).</sch:assert>
      <sch:assert id="a-2233-711193-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'][@extension='2016-03-01']])=1])=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711193) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18146). SHALL contain exactly one [1..1] Payer Supplemental Data Element (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.18:2016-03-01) (CONF:2233-711184).</sch:assert>
      <sch:assert id="a-2233-18239-error" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2233-18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2233-18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:2233-711233).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]/cda:code">
      <sch:assert id="a-2233-18198-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2233-18198).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]/cda:statusCode">
      <sch:assert id="a-2233-19555-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2233-19555).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data_CMS-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]/cda:value[@xsi:type='CD']">
      <sch:assert id="a-2233-21162-error" test="@code">This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet PopulationInclusionObservationType urn:oid:2.16.840.1.113883.1.11.20476 DYNAMIC (CONF:2233-21162).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-warnings">
    <sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-externalDocument-warnings" context="cda:organizer[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.17']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-2233-17896-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2233-17896).</sch:assert>
      <sch:assert id="a-2233-17897-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:2233-17897).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-errors">
    <sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-errors" context="cda:organizer[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.17']]">
      <sch:assert id="a-2233-17887-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-17887).</sch:assert>
      <sch:assert id="a-2233-17888-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2233-17888).</sch:assert>
      <sch:assert id="a-2233-711268-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2016-03-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2233-711268) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.17" (CONF:2233-711269).
					SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711297).</sch:assert>
      <sch:assert id="a-2233-19532-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']) = 1">SHALL contain exactly one [1..1] templateId (CONF:67-19532) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:67-19533).</sch:assert>
      <sch:assert id="a-2233-17908-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-02-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2233-17908) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:2233-17909).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2233-21170).</sch:assert>
      <sch:assert id="a-2233-17889-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:2233-17889).</sch:assert>
      <sch:assert id="a-2233-17890-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1]) = 1">SHALL contain exactly one [1..1] reference (CONF:2233-17890) such that it
					SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:2233-17891).
					SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-17892).</sch:assert>
      <sch:assert id="a-2233-18425-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2016-03-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:2233-18425) such that it
					SHALL contain exactly one [1..1] Measure Data (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.16:2016-03-01) (CONF:2233-711296).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-statusCode-errors" context="cda:organizer[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.17']]/cda:statusCode">
      <sch:assert id="a-2233-19552-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2233-19552).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-externalDocument-errors" context="cda:organizer[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.17']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-2233-19548-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2233-19548).</sch:assert>
      <sch:assert id="a-2233-18192-error" test="count(cda:id[@root='2.16.840.1.113883.4.738'][@extension]) =1">This externalDocument SHALL contain exactly one [1..1] id (CONF:2233-18192) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:2233-18193).
					SHALL contain exactly one [1..1] @extension (CONF:2233-711289).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-externalDocument-code-errors" context="cda:organizer[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.17']]/cda:reference/cda:externalDocument/cda:code">
      <sch:assert id="a-2233-19553-error" test="@code='57024-2'">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-19553).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Measure_CMS-pattern-errors">
    <sch:rule id="QRDA_Category_III_Measure_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]">
      <sch:assert id="a-2233-711276-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711276) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.3" (CONF:2233-711277). SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711286).</sch:assert>
      <sch:assert id="a-2233-12801-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:2233-12802).</sch:assert>
      <sch:assert id="a-2233-17284-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:2233-17285). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2233-21171).</sch:assert>
      <sch:assert id="a-2233-12798-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-12798).</sch:assert>
      <sch:assert id="a-2233-12799-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:2233-12799).</sch:assert>
      <sch:assert id="a-2233-12800-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:2233-12800).</sch:assert>
      <sch:assert id="a-2233-711283-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2016-03-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:2233-711283) such that it SHALL contain exactly one [1..1] Measure Reference and Results (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.17:2016-03-01) (CONF:2233-711284).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Measure_CMS-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]/cda:code">
      <sch:assert id="a-2233-19230-error" test="@code='55186-1'">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-19230).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-pattern-errors">
    <sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18']]">
      <sch:assert id="a-2233-21155-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-21155).</sch:assert>
      <sch:assert id="a-2233-21156-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2233-21156).</sch:assert>
      <sch:assert id="a-2233-711270-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'][@extension='2016-03-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2233-711270) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.18" (CONF:2233-711271).
					SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711299).</sch:assert>
      <sch:assert id="a-2233-18237-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2233-18237) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:2233-18238).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2233-21157).</sch:assert>
      <sch:assert id="a-2233-12564-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2233-12564).</sch:assert>
      <sch:assert id="a-2233-21158-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:2233-21158).</sch:assert>
      <sch:assert id="a-2233-18106-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:2233-18106).</sch:assert>
      <sch:assert id="a-2233-711196-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2233-711196).</sch:assert>
      <sch:assert id="a-2233-18108-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]]) = 1">SHALL contain exactly one [1..1] entryRelationship (CONF:2233-18108) such that it
					SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18109).
					SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2233-18110).
					SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:2233-711199).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-code-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.18']]/cda:code">
      <sch:assert id="a-2233-21159-error" test="@code='48768-6'">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source  (CONF:2233-21159).</sch:assert>
      <sch:assert id="a-2233-21165-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-21165).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-statusCode-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.18']]/cda:statusCode">
      <sch:assert id="a-2233-18107-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2233-18107).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-value-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.18']]/cda:value">
      <sch:assert id="a-2233-711230-error" test="count(cda:translation)=1">This value SHALL contain exactly one [1..1] translation (CONF:2233-711230).</sch:assert>
      <sch:assert id="a-2233-711229-error" test="@nullFlavor='OTH'">This value SHALL contain exactly one [1..1] @nullFlavor="OTH" (CONF:2233-711229).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-translation-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.18']]/cda:value/cda:translation">
      <sch:assert id="a-2233-711231-error" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.249.14.102']/voc:code/@value">This translation SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet CMS Payer Groupings urn:oid:2.16.840.1.113883.3.249.14.102 (CONF:2233-711231).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-pattern-errors">
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]">
      <sch:assert id="a-1109-18395-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1109-18395).</sch:assert>
      <sch:assert id="a-1109-18396-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1109-18396).</sch:assert>
      <sch:assert id="a-1109-711255-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1109-711255) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.25" (CONF:1109-711256).</sch:assert>
      <sch:assert id="a-1109-19649-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1109-19649) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:1109-19650).</sch:assert>
      <sch:assert id="a-109-18397-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:1109-18397).</sch:assert>
      <sch:assert id="a-1109-18421-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1109-18421).</sch:assert>
      <sch:assert id="a-1109-18399-error" test="count(cda:value[@xsi:type='REAL']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:1109-18399).</sch:assert>
      <sch:assert id="a-1109-711203-error" test="count(cda:reference) = 1">SHALL contain exactly one [1..1] reference (CONF:1109-711203).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-code-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:code">
      <sch:assert id="a-1109-18398-error" test="@code='72510-1'">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:1109-18398).</sch:assert>
      <sch:assert id="a-1109-21170-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1109-21170).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-statusCode-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:statusCode">
      <sch:assert id="a-1109-18422-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1109-18422).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-value-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:value">
      <sch:assert id="a-1109-711294-error" test="(@value &gt;= 0) and (@value &lt;= 1)">The value, if present, SHALL be greater than or equal to 0 and less than or equal to 1 (CONF:1109-711294).</sch:assert>
      <sch:assert id="a-1109-711295-error" test="string-length(substring-after(@value,'.')) &lt;= 6">The value, if present, SHALL contain no more than 6 digits to the right of the decimal (CONF:1109-711295).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-reference-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference">
      <sch:assert id="a-1109-19652-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1109-19652).</sch:assert>
      <sch:assert id="a-1109-19653-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:1109-19653).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-externalObservation-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-1109-19654-error" test="@classCode">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1109-19654).</sch:assert>
      <sch:assert id="a-1109-19655-error" test="count(cda:id) = 1">This externalObservation SHALL contain exactly one [1..1] id (CONF:1109-19655).</sch:assert>
      <sch:assert id="a-1109-19657-error" test="count(cda:code) = 1">This externalObservation SHALL contain exactly one [1..1] code (CONF:1109-19657).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-id-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference/cda:externalObservation/cda:id">
      <sch:assert id="a-1109-19656-error" test="@root">This id SHALL contain exactly one [1..1] @root (CONF:1109-19656).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-externalObservation-code-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference/cda:externalObservation/cda:code">
      <sch:assert id="a-1109-19658-error" test="@code='NUMER'">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:1109-19658).</sch:assert>
      <sch:assert id="a-1109-21165-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1109-21165).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_CMS-pattern-errors">
    <sch:rule id="QRDA_Category_III_CMS-errors" context="cda:ClinicalDocument">
      <sch:assert id="a-2233-17226-error" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:2233-17226).</sch:assert>
      <sch:assert id="a-2233-18186-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:2233-18186).</sch:assert>
      <sch:assert id="a-2233-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:2233-17209). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2233-21168).</sch:assert>
      <sch:assert id="a-2233-711280-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711280) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.2" (CONF:2233-711281). SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711305).</sch:assert>
      <sch:assert id="a-2233-17236-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2233-17236).</sch:assert>
      <sch:assert id="a-2233-17210-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-17210).</sch:assert>
      <sch:assert id="a-2233-17211-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:2233-17211).</sch:assert>
      <sch:assert id="a-2233-17237-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2233-17237).</sch:assert>
      <sch:assert id="a-2233-711174-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode (CONF:2233-711174).</sch:assert>
      <sch:assert id="a-2233-711173-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:2233-711173).</sch:assert>
      <sch:assert id="a-2233-17212-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:2233-17212).</sch:assert>
      <sch:assert id="a-2233-18156-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) &gt; 0">SHALL contain at least one [1..*] author (CONF:2233-18156) such that it SHALL contain exactly one [1..1] time (CONF:2233-18158). SHALL contain exactly one [1..1] assignedAuthor (CONF:2233-18157).</sch:assert>
      <sch:assert id="a-2233-17213-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:2233-17213).</sch:assert>
      <sch:assert id="a-2233-711158-error" test="count(cda:informationRecipient)=1">SHALL contain exactly one [1..1] informationRecipient (CONF:2233-711158).</sch:assert>
      <sch:assert id="a-2233-17225-error" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:2233-17225).</sch:assert>
      <sch:assert id="a-2233-711214-error" test="count(cda:documentationOf)=1">SHALL contain exactly one [1..1] documentationOf (CONF:2233-711214).</sch:assert>
      <sch:assert id="a-2233-17217-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:2233-17217).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:typeId">
      <sch:assert id="a-2233-18187-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:2233-18187).</sch:assert>
      <sch:assert id="a-2233-18188-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:2233-18188).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-realmCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:realmCode">
      <sch:assert id="a-2233-17227-error" test="@code='US'">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:2233-17227).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:code">
      <sch:assert id="a-2233-19549-error" test="@code='55184-6'">This code SHALL contain exactly one [1..1] @code="55184-6" Quality Reporting Document Architecture Calculated Summary Report (CONF:2233-19549).</sch:assert>
      <sch:assert id="a-2233-21166-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-21166).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-confidentialityCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:confidentialityCode">
      <sch:assert id="a-2233-711246-error" test="@code='N'">This confidentialityCode SHALL contain exactly one [1..1] @code="N" Normal (CodeSystem: ConfidentialityCode urn:oid:2.16.840.1.113883.5.25 STATIC) (CONF:2233-711246).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:languageCode">
      <sch:assert id="a-2233-711247-error" test="@code='en'">This languageCode SHALL contain exactly one [1..1] @code="en" English (CodeSystem: Language urn:oid:2.16.840.1.113883.6.121) (CONF:2233-711247).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:recordTarget">
      <sch:assert id="a-2233-17232-error" test="count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1" />
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-2233-711240-error" test="count(cda:id)=1">This assignedAuthor SHALL contain exactly one [1..1] id (CONF:2233-711240).</sch:assert>
      <sch:assert id="a-2233-18163-error" test="count(cda:representedOrganization)=1">This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:2233-18163).</sch:assert>
      <sch:assert id="a-2233-19667-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:2233-19667).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-author-assignedAuthor-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:author/cda:assignedAuthor/cda:representedOrganization">
      <sch:assert id="a-2233-18265-error" test="count(cda:name) &gt; 0">This representedOrganization SHALL contain at least one [1..*] name (CONF:2233-18265).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
      <sch:assert id="a-2233-18262-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:2233-18262).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:custodian">
      <sch:assert id="a-2233-17214-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:2233-17214).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-2233-17215-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:2233-17215).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-2233-18165-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:2233-18165).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:informationRecipient">
      <sch:assert id="a-2233-711159-error" test="count(cda:intendedRecipient)=1">This informationRecipient SHALL contain exactly one [1..1] intendedRecipient (CONF:2233-711159).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-informationRecipient-intendedRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:informationRecipient/cda:intendedRecipient">
      <sch:assert id="a-2233-711160-error" test="count(cda:id)=1">This intendedRecipient SHALL contain exactly one [1..1] id (CONF:2233-711160).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-informationRecipient-intendedRecipient-id-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:informationRecipient/cda:intendedRecipient/cda:id">
      <sch:assert id="a-2233-711161-error" test="@root='2.16.840.1.113883.3.249.7'">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.7" CMS Program (CONF:2233-711161).</sch:assert>
      <sch:assert id="a-2233-711162-error" test="@extension=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.249.14.101']/voc:code/@value">This id SHALL contain exactly one [1..1] @extension, which SHALL be selected from ValueSet CMS Program Name urn:oid:2.16.840.1.113883.3.249.14.101 STATIC (CONF:2233-711162).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-informationRecipient-intendedRecipient-id-extension-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:informationRecipient/cda:intendedRecipient/cda:id[@extension='CPC']">
      <sch:assert id="a-2233-711248-error" test="../../../cda:participant[@typeCode='LOC']">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPC", then ClinicalDocument/participant/@typeCode="LOC" SHALL be present (CONF:2233-711248).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:legalAuthenticator">
      <sch:assert id="a-2233-18167-error" test="count(cda:time)=1">This legalAuthenticator SHALL contain exactly one [1..1] time (CONF:2233-18167).</sch:assert>
      <sch:assert id="a-2233-18168-error" test="count(cda:signatureCode)=1">This legalAuthenticator SHALL contain exactly one [1..1] signatureCode (CONF:2233-18168).</sch:assert>
      <sch:assert id="a-2233-19670-error" test="count(cda:assignedEntity)=1">This legalAuthenticator SHALL contain exactly one [1..1] assignedEntity (CONF:2233-19670).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:legalAuthenticator/cda:signatureCode">
      <sch:assert id="a-2233-18169-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CONF:2233-18169).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2233-19672-error" test="count(cda:id) &gt; 0">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:2233-19672).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:documentationOf">
      <sch:assert id="a-2233-18171-error" test="count(cda:serviceEvent)=1">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:2233-18171).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:documentationOf/cda:serviceEvent">
      <sch:assert id="a-2233-18172-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-18172).</sch:assert>
      <sch:assert id="a-2233-711220-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:2233-711220).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:documentationOf/cda:serviceEvent/cda:performer">
      <sch:assert id="a-2233-18174-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2233-18174).</sch:assert>
      <sch:assert id="a-2233-18176-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:2233-18176).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-2233-711167-error" test="count(cda:id[@root='2.16.840.1.113883.4.6'][@extension])=1">This assignedEntity SHALL contain exactly one [1..1] id (CONF:2233-711167) such that it MAY contain zero or one [0..1] @nullFlavor="NA" (CONF:2233-711249). SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:2233-711169). SHALL contain exactly one [1..1] @extension (CONF:2233-711170).</sch:assert>
      <sch:assert id="a-2233-18180-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:2233-18180).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2233-711168-error" test="count(cda:id[@root='2.16.840.1.113883.4.2'][@extension])=1">This representedOrganization SHALL contain exactly one [1..1] id (CONF:2233-711168) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:2233-711171). SHALL contain exactly one [1..1] @extension (CONF:2233-711172).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-authorization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:authorization">
      <sch:assert id="a-2233-18360-error" test="count(cda:consent)=1">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:2233-18360).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-authorization-consent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:authorization/cda:consent">
      <sch:assert id="a-2233-18361-error" test="count(cda:id)=1">This consent SHALL contain exactly one [1..1] id (CONF:2233-18361).</sch:assert>
      <sch:assert id="a-2233-18363-error" test="count(cda:code)=1">This consent SHALL contain exactly one [1..1] code (CONF:2233-18363).</sch:assert>
      <sch:assert id="a-2233-18364-error" test="count(cda:statusCode)=1">This consent SHALL contain exactly one [1..1] statusCode (CONF:2233-18364).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-authorization-consent-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:authorization/cda:consent/cda:code">
      <sch:assert id="a-2233-19550-error" test="@code='425691002'">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CONF:2233-19550).</sch:assert>
      <sch:assert id="a-2233-21172-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2233-21172).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-authorization-consent-statusCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:authorization/cda:consent/cda:statusCode">
      <sch:assert id="a-2233-19551-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2233-19551).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:component">
      <sch:assert id="a-2233-17235-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:2233-17235).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:component/cda:structuredBody">
      <sch:assert id="a-2233-711141-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6'][@extension='2016-03-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2233-17281) such that it SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.2.6:2016-03-01) (CONF:2233-711141).</sch:assert>
      <sch:assert id="a-2233-711142-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2016-03-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2233-17283) such that it SHALL contain exactly one [1..1] QRDA Category III Measure Section (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.2.3:2016-03-01) (CONF:2233-711142).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_CMS-pattern-warnings">
    <sch:rule id="QRDA_Category_III_CMS-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]">
      <sch:assert id="a-2233-18260-warning" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:2233-18260).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-2233-18166-warning" test="count(cda:name)=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:2233-18166).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-legalAuthenticator-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2233-19673-warning" test="count(cda:name)=1">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:2233-19673).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2233-19659-error" test="count(cda:name) &gt; 0">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:2233-19659).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Reporting_Parameters_CMS-pattern-errors">
    <sch:rule id="QRDA_Category_III_Reporting_Parameters_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6']]">
      <sch:assert id="a-2233-711278-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6'][@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711278) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.6" (CONF:2233-711279). SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711306).</sch:assert>
      <sch:assert id="a-2233-14611-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-14611) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.1" (CONF:2233-14612).</sch:assert>
      <sch:assert id="a-2233-18323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-18323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.2" (CONF:2233-18324).</sch:assert>
      <sch:assert id="a-2233-18191-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-18191).</sch:assert>
      <sch:assert id="a-2233-4142-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='reporting parameters'])=1">SHALL contain exactly one [1..1] title="Reporting Parameters" (CONF:2233-4142).</sch:assert>
      <sch:assert id="a-2233-4143-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:2233-4143).</sch:assert>
      <sch:assert id="a-2233-711303-error" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:2233-711303) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-711304). SHALL contain exactly one [1..1] Reporting Parameters Act (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.23:2016-03-01) (CONF:2233-711175).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III_Reporting_Parameters_CMS-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]/cda:code">
      <sch:assert id="a-2233-19229-error" test="@code='55187-9'">This code SHALL contain exactly one [1..1] @code="55187-9" Reporting Parameters (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2233-19229).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Race_Supplemental_Data_Element_CMS-pattern-errors">
    <sch:rule id="Race_Supplemental_Data_Element_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19']]">
      <sch:assert id="a-1109-18223-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1109-18223).</sch:assert>
      <sch:assert id="a-1109-18224-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1109-18224).</sch:assert>
      <sch:assert id="a-1109-711257-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-711257) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.19" (CONF:1109-711258).</sch:assert>
      <sch:assert id="a-1109-18225-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:1109-18226).</sch:assert>
      <sch:assert id="a-1109-18227-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1109-18227).</sch:assert>
      <sch:assert id="a-1109-18112-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1109-18112).</sch:assert>
      <sch:assert id="a-1109-18229-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Race urn:oid:2.16.840.1.114222.4.11.836 DYNAMIC (CONF:1109-18229).</sch:assert>
      <sch:assert id="a-1109-18114-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:1109-18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1109-18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:1109-18116).  SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:1109-711200).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19']]/cda:code">
      <sch:assert id="a-1109-18228-error" test="@code='103579009'">This code SHALL contain exactly one [1..1] @code="103579009" Race (CONF:1109-18228).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19']]/cda:statusCode">
      <sch:assert id="a-1109-18113-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1109-18113).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting-Parameters-Act-CMS-pattern-errors">
    <sch:rule id="Reporting-Parameters-Act-CMS-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']]">
      <sch:assert id="a-2233-3269-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-3269).</sch:assert>
      <sch:assert id="a-2233-3270-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2233-3270).</sch:assert>
      <sch:assert id="a-2233-711272-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711272) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.23" (CONF:2233-711273).</sch:assert>
      <sch:assert id="a-2233-18098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:2233-18099).</sch:assert>
      <sch:assert id="a-2233-3272-error" test="@code='252116004'">SHALL contain exactly one [1..1] code="252116004" Observation Parameters (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:2233-3272).</sch:assert>
      <sch:assert id="a-2233-3273-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2233-3273).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-CMS-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']]/cda:effectiveTime">
      <sch:assert id="a-2233-3274-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2233-3274).</sch:assert>
      <sch:assert id="a-2233-3275-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2233-3275).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-CMS-effectiveTime-low-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']]/cda:effectiveTime/cda:low">
      <sch:assert id="a-2233-711292-error" test="@value='20170101'">This low SHALL contain exactly one [1..1] @value="20170101" (CONF:2233-711292).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-CMS-effectiveTime-high-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']]/cda:effectiveTime/cda:high">
      <sch:assert id="a-2233-711293-error" test="@value='20171231'">This high SHALL contain exactly one [1..1] @value="20171231" (CONF:2233-711293).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum_CMS-pattern-errors">
    <sch:rule id="Reporting_Stratum_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]">
      <sch:assert id="a-1109-17575-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1109-17575).</sch:assert>
      <sch:assert id="a-1109-17576-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1109-17576).</sch:assert>
      <sch:assert id="a-1109-711274-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-711274) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.20" (CONF:1109-711275).</sch:assert>
      <sch:assert id="a-1109-18093-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4'])=1">SHALL contain exactly one [1..1] templateId (CONF:1109-18093) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.4" (CONF:1109-18094).</sch:assert>
      <sch:assert id="a-1109-17577-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1109-17577).</sch:assert>
      <sch:assert id="a-1109-17579-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1109-17579).</sch:assert>
      <sch:assert id="a-1109-17581-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:1109-17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:1109-17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:1109-17583). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:1109-711197).</sch:assert>
      <sch:assert id="a-1109-18204-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:1109-18204).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:code">
      <sch:assert id="a-1109-17578-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1109-17578).</sch:assert>
      <sch:assert id="a-1109-21169-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1109-21169).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:statusCode">
      <sch:assert id="a-1109-18201-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1109-18201).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum_CMS-entryRelationship-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:entryRelationship">
      <sch:assert id="a-1109-711211-error" test="count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26']])=1">SHALL contain exactly one [1..1] Continuous Variable Measure Value (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.26) (CONF:1109-711211).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum_CMS-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:reference">
      <sch:assert id="a-1109-18205-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1109-18205).</sch:assert>
      <sch:assert id="a-1109-18206-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:1109-18206).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum_CMS-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-1109-711210-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:1109-711210).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum_CMS-pattern-warnings">
    <sch:rule id="Reporting_Stratum_CMS-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]">
      <sch:assert id="a-1109-17580-warning" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:1109-17580).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Sex_Supplemental_Data_Element_CMS-pattern-errors">
    <sch:rule id="Sex_Supplemental_Data_Element_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21']]">
      <sch:assert id="a-2233-18230-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-18230).</sch:assert>
      <sch:assert id="a-2233-18231-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2233-18231).</sch:assert>
      <sch:assert id="a-2233-711259-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21'] [@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711259) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.21" (CONF:2233-711260).  SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711301).</sch:assert>
      <sch:assert id="a-2233-18232-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'] [@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-18232) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.6" (CONF:2233-18233). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2233-711302).</sch:assert>
      <sch:assert id="a-2233-18234-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-18234).</sch:assert>
      <sch:assert id="a-2233-18124-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2233-18124).</sch:assert>
      <sch:assert id="a-2233-711291-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet ONC Administrative Sex urn:oid:2.16.840.1.113762.1.4.1 DYNAMIC (CONF:2233-711291).</sch:assert>
      <sch:assert id="a-2233-18126-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2233-18126) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18127).  SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2233-18128).  SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:2233-711202).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21']]/cda:code">
      <sch:assert id="a-2233-18235-error" test="@code='184100006'">This code SHALL contain exactly one [1..1] @code="184100006" Patient sex (CONF:2233-18235).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21']]/cda:statusCode">
      <sch:assert id="a-2233-18125-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2233-18125).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_PQ-errors">
    <sch:rule id="r-validate_PQ-errors" context="//cda:value[@xsi:type='PQ']|cda:quantity">
      <sch:assert id="a-validate_PQ-c-error" test="((@value and @unit) or @nullFlavor) and not (@value and @nullFlavor) and not(@unit and @nullFlavor) and not(not(@value) and @unit)">Data types of PQ SHALL have either @value or @nullFlavor but SHALL NOT have both @value and @nullFlavor. If @value is present then @unit SHALL be present but @unit SHALL NOT be present if @value is not present. (Rule: validate_PQ)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_REAL-errors">
    <sch:rule id="r-validate_REAL-errors" context="//cda:value[@xsi:type='REAL']">
      <sch:assert id="a-validate_REAL-c-error" test="(@value or @nullFlavor) and not (@value and @nullFlavor)">Data types of REAL SHALL NOT have both @value and @nullFlavor. (Rule: validate_REAL)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_CS-errors">
    <sch:rule id="r-validate_CS-errors" context="//cda:value[@xsi:type='CS']|cda:regionOfInterest/cda:code|cda:languageCode|cda:realmCode">
      <sch:assert id="a-validate_CS-c-error" test="(@code or @nullFlavor) and not (@code and @nullFlavor)">Data types of CS SHALL have either @code or @nullFlavor but SHALL NOT have both @code and @nullFlavor (Rule: validate_CS)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_CD_CE-errors">
    <sch:rule id="r-validate_CD_CE-errors" context="//cda:code|cda:value[@xsi:type='CD']|cda:value[@xsi:type='CE']|cda:administrationUnitCode|cda:administrativeGenderCode|cda:awarenessCode|cda:confidentialityCode|cda:dischargeDispositionCode|cda:ethnicGroupCode|cda:functionCode|cda:interpretationCode|cda:maritalStatusCode|cda:methodCode|cda:modeCode|cda:priorityCode|cda:proficiencyLevelCode|cda:RaceCode|cda:religiousAffiliationCode|cda:routeCode|cda:standardIndustryClassCode">
      <sch:assert id="a-validate_CD_CE-c-error" test="(parent::cda:regionOfInterest) or ((@code or @nullFlavor or (@codeSystem and @nullFlavor='OTH')) and not(@code and @nullFlavor) and not(@codeSystem and @nullFlavor!='OTH'))">Data types of CD or CE SHALL have either @code or @nullFlavor or both (@codeSystem and @nullFlavor="OTH") but SHALL NOT have both @code and @nullFlavor and SHALL NOT have @codeSystem and @nullFlavor not equal to "OTH" (Rule: validate_CD_CE)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_TS-errors">
    <sch:rule id="r-validate_TS-errors-abstract" context="//cda:birthTime | //cda:time | //cda:effectiveTime | //cda:time/cda:low | //cda:time/cda:high | //cda:effectiveTime/cda:low | //cda:effectiveTime/cda:high">
      <sch:assert id="a-validate_TS-c-error" test="count(@value | @nullFlavor)&lt;2">Data types of TS SHALL have either @value or @nullFlavor but SHALL NOT have @value and @nullFlavor. (Rule: validate_TS)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_NPI_format-errors">
    <sch:rule id="r-validate_NPI_format-errors" context="//cda:id[@root='2.16.840.1.113883.4.6']">
      <sch:let name="s" value="normalize-space(@extension)" />
      <sch:let name="n" value="string-length($s)" />
      <sch:let name="sum" value="24 + (number(substring($s, $n - 1, 1))*2) mod 10 + floor(number(substring($s, $n - 1,1))*2 div 10) + number(substring($s, $n - 2, 1)) +(number(substring($s, $n - 3, 1))*2) mod 10 + floor(number(substring($s, $n - 3,1))*2 div 10) + number(substring($s, $n - 4, 1)) + (number(substring($s, $n - 5, 1))*2) mod 10 + floor(number(substring($s, $n - 5,1))*2 div 10) + number(substring($s, $n - 6, 1)) + (number(substring($s, $n - 7, 1))*2) mod 10 + floor(number(substring($s, $n - 7,1))*2 div 10) + number(substring($s, $n - 8, 1)) + (number(substring($s, $n - 9, 1))*2) mod 10 + floor(number(substring($s, $n - 9,1))*2 div 10)" />
      <sch:assert id="r-validate_NPI_format-errors-1-c-error" test="not(@extension) or $n = 10">The NPI should have 10 digits. (Rule: p-validate_NPI_format)</sch:assert>
      <sch:assert id="r-validate_NPI_format-errors-2-c-error" test="not(@extension) or number($s)=$s">The NPI should be composed of all digits. (Rule: p-validate_NPI_format)</sch:assert>
      <sch:assert id="r-validate_NPI_format-errors-3-c-error" test="not(@extension) or number(substring($s, $n, 1)) = (10 - ($sum mod 10)) mod 10">The NPI should have a correct checksum, using the Luhn algorithm. (Rule: p-validate_NPI_format)</sch:assert>
      <sch:assert id="r-validate_NPI_format-errors-4-c-error" test="count(@extension|@nullFlavor)=1">The NPI should have @extension or @nullFlavor, but not both. (Rule: p-validate_NPI_format)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_TIN_format-errors">
    <sch:rule id="r-validate_TIN_format-errors-abstract" context="//cda:id[@root='2.16.840.1.113883.4.2']">
      <sch:assert id="a-validate_TIN_format-1-c-error" test="not(@extension) or ((number(@extension)=@extension) and string-length(@extension)=9)">When a Tax Identification Number is used, the provided TIN must be in valid format (9 decimal digits).  (Rule: validate_TIN_format)</sch:assert>
      <sch:assert id="a-validate_TIN_format-2-c-error" test="count(@extension|@nullFlavor)=1">The TIN SHALL have either @extension or @nullFlavor, but not both. (Rule: p-validate_TIN_format)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_II-errors">
    <sch:rule id="r-validate_II-errors" context="//cda:value[@xsi:type='II']|cda:id|cda:setId|cda:templateId">
      <sch:assert id="a-validate_II-c-error" test="(@root or @nullFlavor or (@root and @nullFlavor) or (@root and @extension)) and not (@root and @extension and @nullFlavor)">Data types of II SHALL have either @root or @nullFlavor or (@root and @nullFlavor) or (@root and @extension) but SHALL NOT have all three of (@root and @extension and @nullFlavor) (Rule: validate_II)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_ST-errors">
    <sch:rule id="r-validate_ST-errors" context="//cda:value[@xsi:type='ST']|cda:title|cda:lotNumberText|cda:derivationExpr">
      <sch:assert id="a-validate_ST-c-error" test="string-length()&gt;=1 or @nullFlavor">Data types of ST SHALL either not be empty or have @nullFlavor. (Rule: validate_ST)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_INT-errors">
    <sch:rule id="r-validate_INT-errors" context="//cda:value[@xsi:type='INT']|cda:sequenceNumber|cda:versionNumber">
      <sch:assert id="a-validate_INT-c-error" test="(@value or @nullFlavor) and not (@value and @nullFlavor)">Data types of INT SHALL NOT have both @value and @nullFlavor. (Rule: validate_INT)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-validate_BL-errors">
    <sch:rule id="r-validate_BL-errors" context="//cda:value[@xsi:type='BL']|cda:contextConductionInd|inversionInd|negationInd|independentInd|seperatableInd|preferenceInd">
      <sch:assert id="a-validate_BL-c-error" test="(@value or @nullFlavor) and not(@value and @nullFlavor)">Data types of BL SHALL have either @value or @nullFlavor but SHALL NOT have both @value and @nullFlavor (Rule: validate_BL)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
