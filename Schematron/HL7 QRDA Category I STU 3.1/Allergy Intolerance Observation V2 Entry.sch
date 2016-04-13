<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Allergy_intolerance_V2-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Allergy_intolerance_V2-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Allergy_intolerance_V2-pattern-errors">
        <sch:rule id="Allergy_intolerance_V2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
            <sch:assert id="a-1098-7379" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7379).</sch:assert>
            <sch:assert id="a-1098-7380" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7380).</sch:assert>
            <sch:assert id="a-1098-7381" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7381) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.7" (CONF:1098-10488). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32526).</sch:assert>
            <sch:assert id="a-1098-7382" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7382).</sch:assert>
            <sch:assert id="a-1098-15947" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-15947).</sch:assert>
            <sch:assert id="a-1098-19084" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-19084).</sch:assert>
            <sch:assert id="a-1098-7387" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7387).</sch:assert>
            <sch:assert id="a-1098-7390" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:1098-7390).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_intolerance_V2-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:code">
            <sch:assert id="a-1098-15948" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-15948).</sch:assert>
            <sch:assert id="a-1098-32153" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32153).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_intolerance_V2-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:statusCode">
            <sch:assert id="a-1098-19085" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19085).</sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_intolerance_V2-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:effectiveTime">
            <sch:assert id="a-1098-" test="count(cda:low)=1"></sch:assert>
        </sch:rule>
        <sch:rule id="Allergy_intolerance_V2-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:value[@xsi:type='CD']">
            <sch:assert id="a-1098-" test="@code"></sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Allergy_intolerance_V2-pattern-warnings">
        <sch:rule id="Allergy_intolerance_V2-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
            <sch:assert id="a-1098-" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-16396) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16397). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-16398). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-16399).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>