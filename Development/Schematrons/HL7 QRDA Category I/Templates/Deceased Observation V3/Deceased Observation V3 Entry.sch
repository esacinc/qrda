<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Deceased-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Deceased-Observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Deceased-Observation-pattern-errors">
        <sch:rule id="Deceased-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]">
            <sch:assert id="a-1198-14851-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14851).  </sch:assert>
            <sch:assert id="a-1198-14852-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14852).  </sch:assert>
            <sch:assert id="a-1198-14871-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14871) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.79" (CONF:1198-14872) SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32541). </sch:assert>
            <sch:assert id="a-1198-14873-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1198-14873).</sch:assert>
            <sch:assert id="a-1198-14854-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-14854).</sch:assert>
            <sch:assert id="a-1198-14853-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-14853).</sch:assert>
            <sch:assert id="a-1198-14855-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14855). </sch:assert>
            <sch:assert id="a-1198-14857-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1198-14857).</sch:assert>
        </sch:rule>
        <sch:rule id="Deceased-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:code">
            <sch:assert id="a-1198-19135-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1198-19135).</sch:assert>
            <sch:assert id="a-1198-32158-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1198-32158). </sch:assert>
        </sch:rule>
        <sch:rule id="Deceased-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:statusCode">
            <sch:assert id="a-1198-19095-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19095). </sch:assert>
        </sch:rule>
        <sch:rule id="Deceased-Observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:value">
            <sch:assert id="a-1198-15142-error" test="@code='419099009'">This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:1198-15142).</sch:assert>
        </sch:rule>
        <sch:rule id="Deceased-Observation-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:effectiveTime">
            <sch:assert id="a-1198-14874-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-14874). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Deceased-Observation-pattern-warnings">
        <sch:rule id="Deceased-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79']]">
            <sch:assert id="a-1198-14868-warning" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']])=1])&lt;=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1198-14868) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" Is etiology for (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14875). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1198-32900). SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14870).  </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>