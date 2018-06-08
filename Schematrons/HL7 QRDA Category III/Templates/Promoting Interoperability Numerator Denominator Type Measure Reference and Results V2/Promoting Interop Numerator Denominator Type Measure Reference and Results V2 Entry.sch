<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-errors" />
    </sch:phase>
 
    <sch:phase id="warnings">
        <sch:active pattern="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-errors">
        <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]">
            <sch:assert id="a-3338-21273-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3338-21273).</sch:assert>
            <sch:assert id="a-3338-21274-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3338-21274).</sch:assert>
            <sch:assert id="a-3338-21248-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3338-21248) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.28" (CONF:3338-21266). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:3338-21396).</sch:assert>
            <sch:assert id="a-3338-21242-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:3338-21242) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:3338-21265). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3338-21243). </sch:assert>
            <sch:assert id="a-3338-21312-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.31'][@extension='2016-09-01']])=1])=1">SHALL contain exactly one [1..1] component (CONF:3338-21312) such that it SHALL contain exactly one [1..1] Advancing Care Information Numerator Denominator Type Measure Numerator Data (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.31:2016-09-01) (CONF:3338-21313).</sch:assert>
            <sch:assert id="a-3338-21320-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.32'][@extension='2016-09-01']])=1])=1">SHALL contain exactly one [1..1] component (CONF:3338-21320) such that it SHALL contain exactly one [1..1] Advancing Care Information Numerator Denominator Type Measure Denominator Data (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.32:2016-09-01) (CONF:3338-21321).</sch:assert>
        </sch:rule>
        
        <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results_reference_externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]/cda:reference/cda:externalDocument">
            <sch:assert id="a-3338-21264-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3338-21264). </sch:assert>
            <sch:assert id="a-3338-21247-error" test="count(cda:id[@root='2.16.840.1.113883.3.7031'][@extension])=1">This externalDocument SHALL contain exactly one [1..1] id (CONF:3338-21247) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.7031" (CONF:3338-21402). SHALL contain exactly one [1..1] @extension (CONF:3338-21403).  </sch:assert>
         </sch:rule>
     </sch:pattern>
 
    <sch:pattern id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-pattern-warnings">
        <sch:rule id="Promoting_Interoperability_Numerator_Denominator_Measure_Reference_and_Results-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.28'][@extension='2017-06-01']]/cda:reference/cda:externalDocument">
            <sch:assert id="a-3338-21263-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:3338-21263).</sch:assert>
        </sch:rule>   
    </sch:pattern>
</sch:schema>