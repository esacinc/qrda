<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Performed-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Performed-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Performed-pattern-errors">
        <sch:rule id="Procedure-Performed-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27308-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27308).</sch:assert>
            <sch:assert id="a-3343-11261-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11261).</sch:assert>
            <sch:assert id="a-3343-11262-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11262) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.64" (CONF:3343-11263). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27129).</sch:assert>
            <sch:assert id="a-3343-27309-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27309).</sch:assert>
            <sch:assert id="a-3343-27305-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-27305).</sch:assert>
            <sch:assert id="a-3343-11669-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-11669).</sch:assert>
        </sch:rule>        
        <sch:rule id="Procedure-Performed-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:statusCode">
            <sch:assert id="a-3343-27367-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-27367).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-11670-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-11670).</sch:assert>
            <sch:assert id="a-3343-11671-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-11671).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-targetSiteCode-translation-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:targetSiteCode/cda:translation">
            <sch:assert id="a-3343-27766-error" test="@sdtc:valueSet">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3343-27766).  </sch:assert>
        </sch:rule>   
        <sch:rule id="Procedure-Performed-author-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29074-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29074).   </sch:assert>
            <sch:assert id="a-3343-29073-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29073). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-author-assignedAuthor-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29075-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29075).  </sch:assert>
         </sch:rule>  
        
     </sch:pattern>
    
    <sch:pattern id="Procedure-Performed-pattern-warnings">
        <sch:rule id="Procedure-Performed-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27312-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode (CONF:3343-27312).</sch:assert> 
            <sch:assert id="a-3343-28937-warning" test="count(cda:author)=1">SHOULD contain zero or one [0..1] author (CONF:3343-28937).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Performed-targetSiteCode-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:targetSiteCode/cda:translation">
            <sch:assert id="a-3343-27766-warning" test="@sdtc:valueSet">The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3343-27766) </sch:assert>
        </sch:rule>       
    </sch:pattern>
    
</sch:schema>