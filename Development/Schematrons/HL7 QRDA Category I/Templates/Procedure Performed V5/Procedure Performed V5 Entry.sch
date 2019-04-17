<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
 
    <!-- Update: 09-26-2018 for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460 
		 Updated prefixes and templateId extension
		 Added 4388-28608 Status observation value
    -->
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Performed-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Performed-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Performed-pattern-errors">
        <sch:rule id="Procedure-Performed-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-27308-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4388-27308).</sch:assert>
            <sch:assert id="a-4388-11261-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4388-11261).</sch:assert>
            <sch:assert id="a-4388-11262-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-11262) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.64" (CONF:4388-11263). SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-27129).</sch:assert>
            <sch:assert id="a-4388-27309-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4388-27309).</sch:assert>
            <sch:assert id="a-4388-27305-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:4388-27305).</sch:assert>
            <sch:assert id="a-4388-11669-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:4388-11669).</sch:assert>
        </sch:rule>        
        <sch:rule id="Procedure-Performed-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2018-10-01']]/cda:statusCode">
            <sch:assert id="a-4388-27367-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4388-27367).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2018-10-01']]/cda:effectiveTime">
            <sch:assert id="a-4388-11670-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:4388-11670).</sch:assert>
            <sch:assert id="a-4388-11671-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:4388-11671).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-entryRelationship-REFR-status-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2018-10-01']]/cda:entryRelationship[@typeCode='REFR']/cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']">
            <sch:assert id="a-4388-28608-error" test="count(../cda:value[@xsi:type='CD'])=1">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:4388-28608). </sch:assert>
         </sch:rule>
        
     </sch:pattern>
    
    <sch:pattern id="Procedure-Performed-pattern-warnings">
        <sch:rule id="Procedure-Performed-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-27312-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode (CONF:4388-27312).</sch:assert> 
         </sch:rule>
     </sch:pattern>
    
</sch:schema>