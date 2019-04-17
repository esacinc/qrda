<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Fulfills-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Fulfills-pattern-errors">
        <sch:rule id="Fulfills-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2014-12-01']]">
            <sch:assert id="a-1140-28381-error" test="@typeCode='FLFS'">SHALL contain exactly one [1..1] @typeCode="FLFS" Fulfills (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1140-28381). </sch:assert>
            <sch:assert id="a-1140-28379-error" test="count(sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] sdtc:templateId (CONF:1140-28379) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.126" (CONF:1140-28382).  SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-28383). </sch:assert>
            <sch:assert id="a-1140-28380-error" test="count(sdtc:actReference)=1">SHALL contain exactly one [1..1] sdtc:actReference (CONF:1140-28380).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Fulfills-actReference-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2014-12-01']]/sdtc:actReference">
            <sch:assert id="a-1140-28384-error" test="@classCode">This sdtc:actReference SHALL contain exactly one [1..1] @classCode (CONF:1140-28384).</sch:assert>
            <sch:assert id="a-1140-28385-error" test="@moodCode">This sdtc:actReference SHALL contain exactly one [1..1] @moodCode (CONF:1140-28385).</sch:assert>
            <sch:assert id="a-1140-28386-error" test="count(sdtc:id)&gt;=1">This sdtc:actReference SHALL contain at least one [1..*] sdtc:id (CONF:1140-28386).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Fulfills-actReference-id-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.126'][@extension='2014-12-01']]/sdtc:actReference/sdtc:id">
            <sch:assert id="a-1140-28406-error" test="@root">Such sdtc:ids SHALL contain exactly one [1..1] @root (CONF:1140-28406).</sch:assert>
            <sch:assert id="a-1140-28407-error" test="@extension">Such sdtc:ids SHALL contain exactly one [1..1] @extension (CONF:1140-28407).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>