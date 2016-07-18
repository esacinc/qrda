<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Act_intolerance_Adverse_Event_V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Act_intolerance_Adverse_Event_V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Act_intolerance_Adverse_Event_V3-pattern-errors">
        <sch:rule id="Act_intolerance_Adverse_Event_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-16379-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-16379).</sch:assert>
            <sch:assert id="a-2228-16380-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-16380).</sch:assert>
            <sch:assert id="a-2228-28039-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28039).</sch:assert>
            <sch:assert id="a-2228-16381-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-16381) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.104" (CONF:2228-16382). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27010).</sch:assert>
            <sch:assert id="a-2228-16384-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:2228-16384).</sch:assert>
            <sch:assert id="a-2228-16385-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-16385).</sch:assert>
            <sch:assert id="a-2228-16387-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-16387).</sch:assert>
            <sch:assert id="a-2228-16389-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-16389).</sch:assert>
            <sch:assert id="a-2228-16406-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-16406).</sch:assert>
            <sch:assert id="a-2228-16392-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-16392) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16393). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-16394).</sch:assert>
        </sch:rule>
        <sch:rule id="Act_intolerance_Adverse_Event_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01']]/cda:code">
            <sch:assert id="a-2228-16386-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2228-16386).</sch:assert>
            <sch:assert id="a-2228-27575-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2228-27575).</sch:assert>
        </sch:rule>
        <sch:rule id="Act_intolerance_Adverse_Event_V3-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01']]/cda:statusCode">
            <sch:assert id="a-2228-16388-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-16388).</sch:assert>
        </sch:rule>
        <sch:rule id="Act_intolerance_Adverse_Event_V3-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01']]/cda:effectiveTime">
            <sch:assert id="a-2228-16390-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-16390).</sch:assert>
        </sch:rule>
        <sch:rule id="Act_intolerance_Adverse_Event_V3-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01']]/cda:value[@xsi:type='CD']">
            <sch:assert id="a-2228-16407-error" test="@code">This value SHALL contain exactly one [1..1] @code, which MAY be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:2228-16407).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Act_intolerance_Adverse_Event_V3-pattern-warnings">
        <sch:rule id="Act_intolerance_Adverse_Event_V3-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-16396-warning" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85' and @extension = '2014-12-01']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:2228-16396) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16397). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2228-16398). SHALL contain exactly one [1..1] Reaction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.85:2014-12-01) (CONF:2228-16399).</sch:assert>
        </sch:rule>
        <sch:rule id="Act_intolerance_Adverse_Event_V3-effectiveTime-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104'][@extension='2016-02-01']]/cda:effectiveTime">
            <sch:assert id="a-2228-16391-warning" test="count(cda:high)=1">This effectiveTime SHOULD contain zero or one [0..1] high (CONF:2228-16391).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>