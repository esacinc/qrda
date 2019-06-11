<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Recommended-pattern-errors" />
    </sch:phase>
    
     
    <sch:pattern id="Procedure-Recommended-pattern-errors">
        <sch:rule id="Procedure-Recommended-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27337-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27337).</sch:assert>
            <sch:assert id="a-3343-11103-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11103).</sch:assert>
            <sch:assert id="a-3343-11104-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11104) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.65" (CONF:3343-11105). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27086).</sch:assert>
            <sch:assert id="a-3343-11107-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11107).</sch:assert>
            <sch:assert id="a-4388-27352-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:4388-27352).</sch:assert>
            <!-- 05-29-2019 https://tracker.esacinc.com/browse/QRDA-587 Retroactive fix. Removed following in favor of the version above. -->
            <!-- <sch:assert id="a-3343-27352-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27352).</sch:assert> -->
         </sch:rule>    
        <!-- 05-29-2019  https://tracker.esacinc.com/browse/QRDA-587 Retroactive fix.  None of the following rules should have been present in V4... -->
        <!--
        <sch:rule id="Procedure-Recommended-author-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29059-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29059).</sch:assert>
            <sch:assert id="a-3343-29058-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29058). </sch:assert>
        </sch:rule> 
        
        <sch:rule id="Procedure-Recommended-author-assignedAuthor-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29060-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29060).</sch:assert>
        </sch:rule>    
        -->
     </sch:pattern>
    
  
</sch:schema>