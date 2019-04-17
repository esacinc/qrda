<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-430 -->
<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-pattern-errors" />
    </sch:phase>
 
    <sch:pattern id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-pattern-errors">
        <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]">
            <sch:assert id="a-3259-21360-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21360).</sch:assert>
            <sch:assert id="a-3259-21361-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21361).</sch:assert>
            <sch:assert id="a-3259-21324-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21324) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.31" (CONF:3259-21342). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21401).</sch:assert>
            <sch:assert id="a-3259-21323-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3259-21323).</sch:assert>
            <sch:assert id="a-3259-21332-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3259-21332).</sch:assert>
            <sch:assert id="a-3259-21336-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3259-21336).</sch:assert>
            <sch:assert id="a-3259-21322-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3259-21322) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:3259-21338). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3259-21339). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:3259-21337).</sch:assert>
         </sch:rule>
        
        <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]/cda:code">
            <sch:assert id="a-3259-21340-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3259-21340).</sch:assert>
            <sch:assert id="a-3259-21341-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3259-21341).</sch:assert>
        </sch:rule>
 
        <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]/cda:statusCode">
            <sch:assert id="a-3259-21358-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3259-21358).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Type_Measure_Numerator-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']]/cda:value">
            <sch:assert id="a-3259-21362-error" test="@code='NUMER'">This value SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:3259-21362).</sch:assert>
            <sch:assert id="a-3259-21363-error" test="@codeSystem='2.16.840.1.113883.5.4'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4 STATIC) (CONF:3259-21363).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>