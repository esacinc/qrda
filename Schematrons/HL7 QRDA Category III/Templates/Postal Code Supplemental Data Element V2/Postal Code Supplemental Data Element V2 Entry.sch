<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Postal_Code_Supplemental_Data_Element_V2-pattern-errors" />
    </sch:phase>
 
    <sch:pattern id="Postal_Code_Supplemental_Data_Element_V2-pattern-errors">
        <sch:rule id="Postal_Code_Supplemental_Data_Element_V2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01']]">
            <sch:assert id="a-3259-18209-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-18209).</sch:assert>
            <sch:assert id="a-3259-18210-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-18210).</sch:assert>
            <sch:assert id="a-3259-18211-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-18211) such that it	SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.10" (CONF:3259-18212).	SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21175).</sch:assert>
            <sch:assert id="a-3259-18213-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-18213).</sch:assert>
            <sch:assert id="a-3259-18100-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-18100).</sch:assert>
            <sch:assert id="a-3259-18215-error" test="count(cda:value[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] value with @xsi:type="ST" (CONF:3259-18215).</sch:assert>
            <sch:assert id="a-3259-18102-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-18102) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:3259-18103). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-18104). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-18105).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Postal_Code_Supplemental_Data_Element_V2-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01']]/cda:code">
            <sch:assert id="a-3259-18214-error" test="@code='45401-7'">This code SHALL contain exactly one [1..1] @code="45401-7" Zip code (CONF:3259-18214).</sch:assert>
            <sch:assert id="a-3259-21174-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3259-21174).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Postal_Code_Supplemental_Data_Element_V2-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'][@extension='2016-09-01']]/cda:statusCode">
            <sch:assert id="a-3259-18101-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3259-18101).</sch:assert>
        </sch:rule>
         
    </sch:pattern>
             
</sch:schema>