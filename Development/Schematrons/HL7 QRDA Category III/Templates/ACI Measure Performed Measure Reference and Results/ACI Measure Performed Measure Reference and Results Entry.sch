<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="ACI_Measure_Performed_Reference_and_Result-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="ACI_Measure_Performed_Reference_and_Result-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="ACI_Measure_Performed_Reference_and_Result-pattern-errors">
        <sch:rule id="ACI_Measure_Performed_Reference_and_Result-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01']]">
            <sch:assert id="a-3259-21419-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21419).</sch:assert>
            <sch:assert id="a-3259-21420-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3259-21420).</sch:assert>
            <sch:assert id="a-3259-21408-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3259-21408) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.29" (CONF:3259-21417). SHALL contain exactly one [1..1] @extension="2016-09-01" (CONF:3259-21418).</sch:assert>
            <sch:assert id="a-3259-21405-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'][count(cda:id[@root='2.16.840.1.113883.3.7031'][@extension])=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:3259-21405) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:3259-21416). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3259-21406). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3259-21415). This externalDocument SHALL contain exactly one [1..1] id (CONF:3259-21407) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.7031" (CONF:3259-21412). SHALL contain exactly one [1..1] @extension (CONF:3259-21413).</sch:assert>
            <sch:assert id="a-3259-21404-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.27'][@extension='2016-09-01']])=1])=1">SHALL contain exactly one [1..1] component (CONF:3259-21404) such that it SHALL contain exactly one [1..1] Measure Performed (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.27:2016-09-01) (CONF:3259-21411)</sch:assert>
        </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="ACI_Measure_Performed_Reference_and_Result-pattern-warnings">
        <sch:rule id="ACI_Measure_Performed_Reference_and_Result-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.29'][@extension='2016-09-01']]/cda:reference/cda:externalDocument">
            <sch:assert id="a-3259-21414-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:3259-21414).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>