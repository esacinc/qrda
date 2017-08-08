<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnostic-Study-Performed-pattern-errors" />
    </sch:phase>
    <sch:phase id="warnings">
        <sch:active pattern="Diagnostic-Study-Performed-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Diagnostic-Study-Performed-pattern-errors">
        <sch:rule id="Diagnostic-Study-Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-27369-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27369). </sch:assert>
            <sch:assert id="a-3343-12950-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12950).</sch:assert>
            <sch:assert id="a-3343-12951-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12951) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.18" (CONF:3343-12952). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27141). </sch:assert>
            <sch:assert id="a-3343-27617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27617). </sch:assert>
            <sch:assert id="a-3343-12956-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-12956).  </sch:assert>     
            <sch:assert id="a-3343-12958-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12958).   </sch:assert>  
            <sch:assert id="a-3343-29135-error" test="count(cda:value)=0">SHALL NOT contain [0..0] value (CONF:3343-29135).  </sch:assert>
         </sch:rule>       
         <sch:rule id="Diagnostic-Study-Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]/cda:statusCode">
            <sch:assert id="a-3343-12957-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-12957). </sch:assert>
        </sch:rule>       
        <sch:rule id="Diagnostic-Study-Performed-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-12959-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-12959).  </sch:assert>
            <sch:assert id="a-3343-12960-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-12960). </sch:assert>
        </sch:rule>    
        <sch:rule id="Diagnostic-Study-Performed-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29068-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29068). </sch:assert>
            <sch:assert id="a-3343-29067-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29067).</sch:assert>
        </sch:rule>
        <sch:rule id="Diagnostic-Study-Performed-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29069-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29069). </sch:assert>
         </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Diagnostic-Study-Performed-pattern-warnings">
        <sch:rule id="Diagnostic-Study-Performed-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28873-error" test="count(cda:author)=1">SHOULD contain zero or one [0..1] author (CONF:3343-28873). </sch:assert>
        </sch:rule>
    </sch:pattern>
            
</sch:schema>