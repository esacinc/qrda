<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />

    <!-- Updated for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460 
		 Updated prefixes and templateId extension
		 Adjusted conformance 4388-27352 to correctly test for author
		 Remvoed sub rules on Author, as not present in template.
    -->
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Recommended-pattern-errors" />
    </sch:phase>
    
     
    <sch:pattern id="Procedure-Recommended-pattern-errors">
        <sch:rule id="Procedure-Recommended-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-27337-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4388-27337).</sch:assert>
            <sch:assert id="a-4388-11103-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4388-11103).</sch:assert>
            <sch:assert id="a-4388-11104-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-11104) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.65" (CONF:4388-11105). SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-27086).</sch:assert>
            <sch:assert id="a-4388-11107-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4388-11107).</sch:assert>
            <sch:assert id="a-4388-27352-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:4388-27352).</sch:assert>
         </sch:rule>      
        <!-- author sub rules not present in Procedure Recommended V5 -->
        <!--
        <sch:rule id="Procedure-Recommended-author-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2018-10-01']]/cda:author">
            <sch:assert id="a-4388-29059-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:4388-29059).</sch:assert>
            <sch:assert id="a-4388-29058-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:4388-29058). </sch:assert>
        </sch:rule> 
        <sch:rule id="Procedure-Recommended-author-assignedAuthor-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2018-10-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-4388-29060-warning" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:4388-29060).</sch:assert>
        </sch:rule> 
        -->
     </sch:pattern>
    
  
</sch:schema>