<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Adverse_Event-pattern-errors" />
        <sch:active pattern="Adverse_Event-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Adverse_Event-pattern-errors">
        <sch:rule id="Adverse_Event-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28773-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28773).</sch:assert>
            <sch:assert id="a-3343-28774-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28774).</sch:assert>
            <sch:assert id="a-3343-28776-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28776).</sch:assert>
            <sch:assert id="a-3343-28751-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28751) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.146" (CONF:3343-28761). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28762).</sch:assert>
            <sch:assert id="a-3343-28775-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-28775).</sch:assert>
            <sch:assert id="a-3343-28752-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28752).</sch:assert>
            <sch:assert id="a-3343-28753-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28753).</sch:assert>
            <sch:assert id="a-3343-28754-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28754).</sch:assert>
            <sch:assert id="a-3343-28756-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28756).</sch:assert>
            <sch:assert id="a-3343-28755-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28755) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28768). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3343-28769). SHALL contain exactly one [1..1] Adverse Event Cause Observation Assertion (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.148:2017-08-01) (CONF:3343-28770).</sch:assert>
        </sch:rule>
        <sch:rule id="Adverse_Event-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:code">
            <sch:assert id="a-3343-28763-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28763).</sch:assert>
            <sch:assert id="a-3343-28764-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28764).</sch:assert>
        </sch:rule>
        <sch:rule id="Adverse_Event-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:statusCode">
            <sch:assert id="a-3343-28765-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28765).</sch:assert>
        </sch:rule>
        <sch:rule id="Adverse_Event-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-28766-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28766).</sch:assert>
        </sch:rule>
        <sch:rule id="Adverse_Event-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:value">
            <sch:assert id="a-3343-28771-error" test="@code='281647001'">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CONF:3343-28771).</sch:assert>
            <sch:assert id="a-3343-28772-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" SNOMED CT (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-28772).</sch:assert>
        </sch:rule>
        <sch:rule id="Adverse_Event-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-28983-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-28983).</sch:assert>
            <sch:assert id="a-3343-28982-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-28982).</sch:assert>
        </sch:rule>
        <sch:rule id="Adverse_Event-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-28984-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-28984).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Adverse_Event-pattern-warnings">
        <sch:rule id="Adverse_Event-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28750-warning" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09'])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:3343-28750) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28759). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3343-28760). SHALL contain exactly one [1..1] Reaction Observation (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:3343-28758).</sch:assert>
        </sch:rule>
        <sch:rule id="Adverse_Event-effectiveTime-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-28767-warning" test="count(cda:high)=1">This effectiveTime SHOULD contain zero or one [0..1] high (CONF:3343-28767).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>