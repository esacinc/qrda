<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Diagnosis-pattern-errors" />
    </sch:phase>
    <sch:phase id="warnings">
        <sch:active pattern="Diagnosis-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Diagnosis-pattern-errors">
        <sch:rule id="Diagnosis-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28510-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28510).</sch:assert>
            <sch:assert id="a-3343-28511-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28511).</sch:assert>
            <sch:assert id="a-3343-28512-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28512).</sch:assert>
            <sch:assert id="a-3343-28498-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28498) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.135" (CONF:3343-28503). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28887).</sch:assert>
            <sch:assert id="a-3343-28499-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28499).</sch:assert>
            <sch:assert id="a-3343-28885-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2017-08-01'])=1">This template SHALL be contained by a Diagnosis Concern Act (V3) (CONF:3343-28885).</sch:assert>
        </sch:rule>       
        <sch:rule id="Diagnosis-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-28505-error" test="@code='29308-4'">This code SHALL contain exactly one [1..1] @code="29308-4" diagnosis (CONF:3343-28505). </sch:assert>
            <sch:assert id="a-3343-28506-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28506).</sch:assert>
            <sch:assert id="a-3343-28886-error" test="count(cda:translation)=1">This code SHALL contain exactly one [1..1] translation (CONF:3343-28886).</sch:assert>
        </sch:rule>
        <sch:rule id="Diagnosis-code-translation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]/cda:code/cda:translation">
            <sch:assert id="a-3343-28888-error" test="@code='282291009'">This translation SHALL contain exactly one [1..1] @code="282291009" 2.16.840.1.113883.6.96 (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-28888).</sch:assert>
        </sch:rule>
        <sch:rule id="Diagnosis-code-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29065-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29065). </sch:assert>
            <sch:assert id="a-3343-29064-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29064).</sch:assert>
        </sch:rule>
        <sch:rule id="Diagnosis-code-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29066-error" test="count(cda:id)&gt;=1"> This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29066). </sch:assert>
        </sch:rule>           
    </sch:pattern>
    
    <sch:pattern id="Diagnosis-pattern-warnings">
        <sch:rule id="Diagnosis-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28889-warning" test="count(cda:author)=1">SHOULD contain zero or one [0..1] author (CONF:3343-28889).</sch:assert>
        </sch:rule>
    </sch:pattern>
            
    
</sch:schema>