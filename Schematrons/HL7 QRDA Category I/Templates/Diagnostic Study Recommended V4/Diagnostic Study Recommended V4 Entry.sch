<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnostic-Study-Recommended-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Diagnostic-Study-Recommended-pattern-errors">
        <sch:rule id="Diagnostic-Study-Recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27406-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27406). </sch:assert>
            <sch:assert id="a-3343-13392-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13392).</sch:assert>
            <sch:assert id="a-3343-13393-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-13393) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.19" (CONF:3343-13394). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27070). </sch:assert>
            <sch:assert id="a-3343-27619-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27619). </sch:assert>
            <sch:assert id="a-3343-13400-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1])=1">SHALL contain exactly one [1..1] author (CONF:3343-13400) such that it SHALL contain exactly one [1..1] time (CONF:3343-29044).  SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29043).</sch:assert>     
         </sch:rule>       
        <sch:rule id="Diagnostic-Study-Recommended-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29045-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29045).  </sch:assert>
         </sch:rule>
      </sch:pattern>
    
</sch:schema>