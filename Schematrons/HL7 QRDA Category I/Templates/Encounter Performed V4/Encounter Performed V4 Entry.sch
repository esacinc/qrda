<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Performed-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Performed-pattern-errors">
        <sch:rule id="Encounter-Performed-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27532-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27532).</sch:assert>
            <sch:assert id="a-3343-27533-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-27533).</sch:assert>
            <sch:assert id="a-3343-11861-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11861) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.23" (CONF:3343-11862).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26552).</sch:assert>
            <sch:assert id="a-3343-28802-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-28802).</sch:assert>
            <sch:assert id="a-3343-27624-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27624).</sch:assert>
            <sch:assert id="a-3343-11874-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-11874).</sch:assert>
            <sch:assert id="a-3343-11876-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-11876).</sch:assert>
        </sch:rule>   
        <sch:rule id="Encounter-Performed-id-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:id">
            <sch:assert id="a-3343-28804-error" test="@root">Such ids SHALL contain exactly one [1..1] @root (CONF:3343-28804).</sch:assert>
        </sch:rule>
        <sch:rule id="Encounter-Performed-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-27625-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:3343-27625).</sch:assert>
        </sch:rule>
        <sch:rule id="Encounter-Performed-statusCode-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:statusCode">
            <sch:assert id="a-3343-11875-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11875).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Encounter-Performed-effectiveTime-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-11877-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-11877).</sch:assert>
            <sch:assert id="a-3343-11878-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-11878).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Encounter-Performed-author-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29083-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29083). </sch:assert>
            <sch:assert id="a-3343-29082-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29082).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Encounter-Performed-author-assignedAuthor-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29084-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29084). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>