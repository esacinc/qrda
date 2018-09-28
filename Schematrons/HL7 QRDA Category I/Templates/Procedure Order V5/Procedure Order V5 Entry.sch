<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />

    <!-- Update: 09-26-2018 for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460 
		 Updated prefixes and templateId extension
    -->
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Order-pattern-errors" />
    </sch:phase>
 
    <sch:pattern id="Procedure-Order-pattern-errors">
        <sch:rule id="Procedure-Order-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-27323-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4388-27323).</sch:assert>
            <sch:assert id="a-4388-11097-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4388-11097).</sch:assert>
            <sch:assert id="a-4388-11098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-11098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.63" (CONF:4388-11099). SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-27083).</sch:assert>
            <sch:assert id="a-4388-27324-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4388-27324).</sch:assert>
            <sch:assert id="a-4388-27346-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:4388-27346).</sch:assert>
        </sch:rule>       
         <sch:rule id="Procedure-Order-author-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2018-10-01']]/cda:author">
             <sch:assert id="a-4388-29056-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:4388-29056). </sch:assert>
             <sch:assert id="a-4388-29055-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:4388-29055) </sch:assert>
        </sch:rule>    
        <sch:rule id="Procedure-Order-author-assignedAuthor-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2018-10-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-4388-29057-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:4388-29057).  </sch:assert>
        </sch:rule>
     </sch:pattern>
    
</sch:schema>