<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Result-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Result-Observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Result-Observation-pattern-errors">
        <sch:rule id="Result-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]">
            <sch:assert id="a-1198-7130-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7130).</sch:assert>
            <sch:assert id="a-1198-7131-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7131). </sch:assert>
            <sch:assert id="a-1198-7136-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-7136) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.2" (CONF:1198-9138). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32575). </sch:assert>
            <sch:assert id="a-1198-7137-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1198-7137). </sch:assert>
            <sch:assert id="a-1198-7133-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1198-7133). </sch:assert>
            <sch:assert id="a-1198-7134-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-7134).  </sch:assert>
            <sch:assert id="a-1198-7140-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-7140). </sch:assert>
            <sch:assert id="a-1198-7143-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1198-7143).  </sch:assert>
        </sch:rule>
        <sch:rule id="Result-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]/cda:statusCode">
            <sch:assert id="a-1198-14849-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Result Status urn:oid:2.16.840.1.113883.11.20.9.39 STATIC (CONF:1198-14849). </sch:assert>
        </sch:rule>
        <sch:rule id="Result-Observation-interpretationCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]/cda:interpretationCode">
            <sch:assert id="a-1198-32476-error" test="@code">The interpretationCode, if present, SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Observation Interpretation (HL7) urn:oid:2.16.840.1.113883.1.11.78 STATIC (CONF:1198-32476).   </sch:assert>
        </sch:rule>
        <sch:rule id="Result-Observation-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]/cda:referenceRange">
            <sch:assert id="a-1198-7151-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:1198-7151). </sch:assert>
        </sch:rule>
        
        <sch:rule id="Result-Observation-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]/cda:referenceRange/cda:observationRange">
            <sch:assert id="a-1198-7152-error" test="count(cda:code)=0">This observationRange SHALL NOT contain [0..0] code (CONF:1198-7152). </sch:assert>
            <sch:assert id="a-1198-32175-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:1198-32175). </sch:assert>
        </sch:rule>        
    </sch:pattern>
    
    <sch:pattern id="Result-Observation-pattern-warnings">
        <sch:rule id="Result-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]">
            <sch:assert id="a-1198-7147-warning" test="count(cda:interpretationCode)&gt;=1">SHOULD contain zero or more [0..*] interpretationCode (CONF:1198-7147).  </sch:assert>
            <sch:assert id="a-1198-7149-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-7149). </sch:assert>
            <sch:assert id="a-1198-7150-warning" test="count(cda:referenceRange)&gt;=1">SHOULD contain zero or more [0..*] referenceRange (CONF:1198-7150). </sch:assert>
         </sch:rule>            
    </sch:pattern>
    
</sch:schema>