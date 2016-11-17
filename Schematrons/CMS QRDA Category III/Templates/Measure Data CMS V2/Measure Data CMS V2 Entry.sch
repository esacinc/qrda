<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Measure_data_CMS-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Measure_data_CMS-pattern-errors">
        <sch:rule id="Measure_data_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]">
            <sch:assert id="a-2233-17615-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2233-17615).</sch:assert>
            <sch:assert id="a-2233-17616-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2233-17616).</sch:assert>
            <sch:assert id="a-2233-711266-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2016-11-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-711266) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.16" (CONF:2233-711267). SHALL contain exactly one [1..1] @extension="2016-11-01" (CONF:2233-711287).</sch:assert>
            <sch:assert id="a-2233-17912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:2233-17913). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:2233-711288).</sch:assert>
            <sch:assert id="a-2233-17617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2233-17617).</sch:assert>
            <sch:assert id="a-2233-18199-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2233-18199).</sch:assert>
            <sch:assert id="a-2233-17618-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2233-17618).</sch:assert>
            <sch:assert id="a-2233-17619-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2233-17619) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:2233-17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2233-17911). SHALL contain exactly one [1..1] Aggregate Count - CMS (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:2233-711198).</sch:assert>
            <sch:assert id="a-2233-711190-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21'][@extension='2016-11-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711190) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18137). SHALL contain exactly one [1..1] Sex Supplemental Data Element - CMS (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.21:2016-11-01) (CONF:2233-711181).</sch:assert>
            <sch:assert id="a-2233-711191-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22'][@extension='2016-11-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711191) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18144). SHALL contain exactly one [1..1] Ethnicity Supplemental Data Element - CMS (V2) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.22:2016-11-01) (CONF:2233-711182).</sch:assert>
            <sch:assert id="a-2233-711192-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19'][@extension='2016-11-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711192) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18145). SHALL contain exactly one [1..1] Race Supplemental Data Element - CMS (V2) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.19:2016-11-01) (CONF:2233-711183).</sch:assert>
            <sch:assert id="a-2233-711193-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'][@extension='2016-11-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:2233-711193) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2233-18146). SHALL contain exactly one [1..1] Payer Supplemental Data Element - CMS (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.18:2016-11-01) (CONF:2233-711184).</sch:assert>
            <sch:assert id="a-2233-18239-error" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2233-18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2233-18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:2233-711233).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure_data_CMS-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]/cda:code">
            <sch:assert id="a-2233-18198-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2233-18198).</sch:assert>
            <sch:assert id="a-2233-21164-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2233-21164).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure_data_CMS-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]/cda:statusCode">
            <sch:assert id="a-2233-19555-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2233-19555).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>