<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Related-To-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Related-To-pattern-errors">
        <sch:rule id="Related-To-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-29113-error" test="@typeCode='FLFS'">SHALL contain exactly one [1..1] @typeCode="FLFS" Fulfills (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-29113).</sch:assert>
            <sch:assert id="a-3343-29104-error" test="count(sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] sdtc:templateId (CONF:3343-29104) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.150" (CONF:3343-29107). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29108).</sch:assert>
            <sch:assert id="a-3343-29105-error" test="count(sdtc:actReference)=1">SHALL contain exactly one [1..1] sdtc:actReference (CONF:3343-29105).</sch:assert>
         </sch:rule>
        <sch:rule id="Related-To-actReference-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01']]/sdtc:actReference">
            <sch:assert id="a-3343-29114-error" test="@classCode">This sdtc:actReference SHALL contain exactly one [1..1] @classCode (CONF:3343-29114). </sch:assert>
            <sch:assert id="a-3343-29110-error" test="@classCode">This sdtc:actReference SHALL contain exactly one [1..1] @moodCode (CONF:3343-29110).  </sch:assert>
            <sch:assert id="a-3343-29106-error" test="count(sdtc:id)&gt;=1">This sdtc:actReference SHALL contain at least one [1..*] sdtc:id (CONF:3343-29106)</sch:assert>
         </sch:rule>
        <sch:rule id="Related-To-actReference-id-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01']]/sdtc:actReference/sdtc:id">
            <sch:assert id="a-3343-29111-error" test="@root">Such sdtc:ids SHALL contain exactly one [1..1] @root (CONF:3343-29111).</sch:assert>
         </sch:rule>
        
     </sch:pattern>
 
</sch:schema>