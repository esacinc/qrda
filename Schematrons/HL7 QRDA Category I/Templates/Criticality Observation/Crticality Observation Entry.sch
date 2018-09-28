<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <!-- Updated for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460  
         Changed conformance prefixes from 1181-  to 81-  to match Trifolia IG -->
    
    <sch:phase id="errors">
        <sch:active pattern="Criticality-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Criticality-Observation-pattern-errors">
        <sch:rule id="Criticality-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145']]">
            <sch:assert id="a-81-32921-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-32921).</sch:assert>
            <sch:assert id="a-81-32922-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-32922). </sch:assert>
            <sch:assert id="a-81-32918-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:81-32918) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.145" (CONF:81-32923). </sch:assert>
            <sch:assert id="a-81-32919-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-32919).</sch:assert>
            <sch:assert id="a-81-32920-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-32920).</sch:assert>
            <sch:assert id="a-81-32928-error" test="count(cda:value[@xsi:type='CD' and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.20549']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Criticality Observation urn:oid:2.16.840.1.113883.1.11.20549 STATIC 2015-08-01 (CONF:81-32928).</sch:assert>
        </sch:rule>
        <sch:rule id="Criticality-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145']]/cda:code">
            <sch:assert id="a-81-32925-error" test="@code='82606-5'"> This code SHALL contain exactly one [1..1] @code="82606-5" Criticality (CONF:81-32925). </sch:assert>
            <sch:assert id="a-81-32926-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-32926). </sch:assert>
        </sch:rule>
        <sch:rule id="Criticality-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.145']]/cda:statusCode">
            <sch:assert id="a-81-32927-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-32927). </sch:assert>
        </sch:rule>
   </sch:pattern>
    
</sch:schema>