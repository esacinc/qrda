<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Measure_Reference_and_Results-pattern-errors" />
    </sch:phase>
 
    <sch:phase id="warnings">
        <sch:active pattern="Measure_Reference_and_Results-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Measure_Reference_and_Results-pattern-errors">
        <sch:rule id="Measure_Reference_and_Results-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
            <sch:assert id="a-2226-17887-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17887).</sch:assert>
            <sch:assert id="a-2226-17888-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17888).</sch:assert>
            <sch:assert id="a-2226-17908-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:2226-17909). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21170).</sch:assert>
            <sch:assert id="a-2226-17889-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-17889).</sch:assert>
            <sch:assert id="a-2226-17890-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'][count(cda:id [@root='2.16.840.1.113883.4.738'] [@extension])=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2226-17890) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:2226-17891). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17892). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2226-19548). This externalDocument SHALL contain exactly one [1..1] id (CONF:2226-18192) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:2226-18193).  SHALL contain exactly one [1..1] @extension (CONF:2226-21169). </sch:assert>
            <sch:assert id="a-2226-18425-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5' and @extension = '2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:2226-18425) such that it SHALL contain exactly one [1..1] Measure Data (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.5:2016-02-01) (CONF:2226-18426).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure_Reference_and_Results-statusCode-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:statusCode">
            <sch:assert id="a-2226-19552-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19552).</sch:assert>
        </sch:rule>
        <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-code-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference/cda:externalDocument/cda:code">
             <sch:assert id="a-2226-19553-error" test="@code='57024-2'">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19553). </sch:assert>
        </sch:rule>
     </sch:pattern>
 
    <sch:pattern id="Measure_Reference_and_Results-pattern-warnings">
        <sch:rule id="Measure_Reference_and_Results-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
            <sch:assert id="a-2226-18353-warning" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1][count(cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1'])=1][count(cda:text)=1])=1])=1">SHOULD contain exactly one [1..1] reference (CONF:2226-18353) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2226-18354). This externalObservation SHALL contain at least one [1..*] id (CONF:2226-18355). This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19554). This externalObservation SHALL contain exactly one [1..1] text (CONF:2226-18358). </sch:assert>
        </sch:rule>  
        <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference/cda:externalDocument">
            <sch:assert id="a-2226-17896-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-17896).  </sch:assert>
            <sch:assert id="a-2226-17897-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:2226-17897). </sch:assert>
        </sch:rule>   
    </sch:pattern>
</sch:schema>