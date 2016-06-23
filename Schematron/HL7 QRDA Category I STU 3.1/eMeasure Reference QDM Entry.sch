<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="eMeasure-Reference-QDM-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="eMeasure-Reference-QDM-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="eMeasure-Reference-QDM-pattern-errors">
        <sch:rule id="eMeasure-Reference-QDM-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]">
            <sch:assert id="a-67-12805-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12805). </sch:assert>
            <sch:assert id="a-67-12806-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12806).</sch:assert>
            <sch:assert id="a-67-12807-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12807).</sch:assert>
            <sch:assert id="a-67-12808-error" test="count(cda:reference[@typeCode='REFR'] [count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:67-12808) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12809). SHALL contain exactly one [1..1] externalDocument (CONF:67-12810).</sch:assert>
        </sch:rule>       
        <sch:rule id="eMeasure-Reference-QDM-externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:externalDocument">
            <sch:assert id="a-67-27017-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-27017). </sch:assert>
            <sch:assert id="a-67-12811-error" test="count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1">This externalDocument SHALL contain exactly one [1..1] id (CONF:12811) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:12812). SHALL contain exactly one [1..1] @extension (CONF:12813).  </sch:assert>
        </sch:rule>       
        <sch:rule id="eMeasure-Reference-QDM-component-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component">
            <sch:assert id="a-67-16678-error" test="count(cda:observation)=1">The component, if present, SHALL contain exactly one [1..1] observation (CONF:67-16679). </sch:assert>
        </sch:rule>
        <sch:rule id="eMeasure-Reference-QDM-component-observation-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation">
            <sch:assert id="a-67-16679-error" test="@negationInd">This observation SHALL contain exactly one [1..1] @negationInd (CONF:67-16680). </sch:assert>
            <sch:assert id="a-67-16681-error" test="count(cda:code)=1">This observation SHALL contain exactly one [1..1] code (CONF:67-16681).  </sch:assert>
            <sch:assert id="a-67-16683-error" test="count(cda:value[@xsi:type='CD'])=1">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:67-16683).   </sch:assert>
            <sch:assert id="a-67-16684-error" test="count(cda:reference)=1">This observation SHALL contain exactly one [1..1] reference (CONF:67-16684).  </sch:assert>       
        </sch:rule> 
        <sch:rule id="eMeasure-Reference-QDM-component-observation-code-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:code">
            <sch:assert id="a-67-16682-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:67-16682). </sch:assert>
            <sch:assert id="a-67-27010-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:67-27010). </sch:assert>
        </sch:rule>
        <sch:rule id="eMeasure-Reference-QDM-component-observation-reference-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:reference">
            <sch:assert id="a-67-16685-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-16685).  </sch:assert>
            <sch:assert id="a-67-16686-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:67-16686).</sch:assert>
        </sch:rule>
        <sch:rule id="eMeasure-Reference-QDM-component-observation-reference-externalObservation-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:reference/cda:externalObservation">
            <sch:assert id="a-67-16693-error" test="@classCode='OBS'">This externalObservation SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-16693).   </sch:assert>
            <sch:assert id="a-67-16694-error" test="@moodCode='EVN'">This externalObservation SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-16694).    </sch:assert>
            <sch:assert id="a-67-16687-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:67-16687).</sch:assert>
        </sch:rule>
        <sch:rule id="eMeasure-Reference-QDM-component-observation-referenceRange-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:referenceRange">
            <sch:assert id="a-67-16690-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:67-16690).  </sch:assert>
        </sch:rule>
        <sch:rule id="eMeasure-Reference-QDM-component-observation-referenceRange-observationRange-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:referenceRange/observationRange">
            <sch:assert id="a-67-16691-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:67-16691).  </sch:assert>
        </sch:rule>       
    </sch:pattern>
    
    <sch:pattern id="eMeasure-Reference-QDM-pattern-warnings">
         <sch:rule id="eMeasure-Reference-QDM-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference/cda:externalDocument">
             <sch:assert id="a-67-12864-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CONF:67-12864). </sch:assert>
             <sch:assert id="a-67-12865-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:67-12865). </sch:assert>
             <sch:assert id="a-67-12867-warning" test="count(cda:setId)=1">This externalDocument SHOULD contain zero or one [0..1] setId (CONF:67-12867).  </sch:assert>
             <sch:assert id="a-67-12869-warning" test="count(cda:versionNumber)=1">This externalDocument SHOULD contain zero or one [0..1] versionNumber (CONF:67-12869).</sch:assert>
         </sch:rule>
        <sch:rule id="eMeasure-Reference-QDM-reference-externalDocument-code-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference/cda:externalDocument/cda:code">
            <sch:assert id="a-67-27015-warning" test="@code='57024-2'">The code, if present, SHOULD contain zero or one [0..1] @code="57024-2" Health Quality Measure Document (CONF:67-27015).  </sch:assert>
            <sch:assert id="a-67-27016-warning" test="@codeSystem='2.16.840.1.113883.6.1'">The code, if present, SHOULD contain zero or one [0..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27016).</sch:assert>
        </sch:rule> 
    </sch:pattern>
    
</sch:schema>