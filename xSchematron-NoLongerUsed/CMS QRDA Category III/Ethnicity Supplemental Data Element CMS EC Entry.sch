<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Ethnicity_supp_data_element_CMS-pattern-errors" />
    </sch:phase>
    
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
</sch:schema>