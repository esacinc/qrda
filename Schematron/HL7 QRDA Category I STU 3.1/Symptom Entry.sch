<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Symptom-pattern-errors" />
    </sch:phase>
   
    <sch:pattern id="Symptom-pattern-errors">
        <sch:rule id="Symptom-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']]">
            <sch:assert id="a-2228-28524-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28524). </sch:assert>
            <sch:assert id="a-2228-28525-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28525). </sch:assert>
            <sch:assert id="a-2228-28526-error" test="not(@negationId)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28526).</sch:assert>
            <sch:assert id="a-2228-28514-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-28514) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.136" (CONF:2228-28518). </sch:assert>
            <sch:assert id="a-2228-28515-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-28515). </sch:assert>
            <sch:assert id="a-2228-28516-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-28516).  </sch:assert>
        </sch:rule>
        <sch:rule id="Symptom-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']]/cda:code">
            <sch:assert id="a-2228-28520-error" test="@code='75325-1'">This code SHALL contain exactly one [1..1] @code="75325-1" Symptom (CONF:2228-28520). </sch:assert>
            <sch:assert id="a-2228-28521-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28521).  </sch:assert>
        </sch:rule>
        <sch:rule id="Symptom-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136']]/cda:value">
            <sch:assert id="a-2228-28523-error" test="@sdtc:valueSet">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-28523).  </sch:assert>
         </sch:rule>
    </sch:pattern>
    
</sch:schema>