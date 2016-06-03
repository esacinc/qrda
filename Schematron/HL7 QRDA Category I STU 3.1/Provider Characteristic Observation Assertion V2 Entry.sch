<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Provider-Characteristic-Observation-Assertion-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Provider-Characteristic-Observation-Assertion-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Provider-Characteristic-Observation-Assertion-pattern-errors">
        <sch:rule id="Provider-Characteristic-Observation-Assertion-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]">
		  <sch:assert id="a-2228-27773-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:2228-27773).</sch:assert>
		  <sch:assert id="a-2228-27774-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27774).</sch:assert>
		  <sch:assert id="a-2228-28101-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28101).</sch:assert>
		  <sch:assert id="a-2228-27768-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-27768) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.114" (CONF:2228-27772). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27780).</sch:assert>
		  <sch:assert id="a-2228-27775-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:2228-27775).</sch:assert>
		  <sch:assert id="a-2228-27767-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27767).</sch:assert>
		  <sch:assert id="a-2228-27776-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:2228-27776).</sch:assert>
		  <sch:assert id="a-2228-27769-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-27769).</sch:assert>
		  <sch:assert id="a-2228-27770-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-27770).</sch:assert>		  
		</sch:rule>       
        <sch:rule id="Provider-Characteristic-Observation-Assertion-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]/cda:code">
		  <sch:assert id="a-2228-27771-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2228-27771).</sch:assert>
		  <sch:assert id="a-2228-28136-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2228-28136).</sch:assert>
        </sch:rule>               
        <sch:rule id="Provider-Characteristic-Observation-Assertion-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]/cda:effectiveTime">
 		  <sch:assert id="a-2228-27777-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27777).</sch:assert>
       </sch:rule>        
        <sch:rule id="Provider-Characteristic-Observation-Assertion-value-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]/cda:value[@xsi:type='CD']">
		  <sch:assert id="a-2228-27779-error" test="@sdtc:valueSet">This value SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27779).</sch:assert>
        </sch:rule>
        <sch:rule id="Provider-Characteristic-Observation-Assertion-participant-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]/cda:participant">
		  <sch:assert id="a-2228-28219-error" test="@typeCode='IND'">The participant, if present, SHALL contain exactly one [1..1] @typeCode="IND" individual (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-28219).</sch:assert>
 		  <sch:assert id="a-2228-28218-error" test="count(cda:participantRole)=1">The participant, if present, SHALL contain exactly one [1..1] participantRole (CONF:2228-28218).</sch:assert>
        </sch:rule>           
      </sch:pattern>
    
    <sch:pattern id="Provider-Characteristic-Observation-Assertion-pattern-warnings">
        <sch:rule id="Provider-Characteristic-Observation-Assertion-participant-participantRole-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114']]/cda:participant/cda:participantRole">
 		  <sch:assert id="a-2228-28221-warning" test="count(cda:id [@root='2.16.840.1.113883.4.6'][@extension])&gt;=1">This participantRole SHOULD contain zero or more [0..*] id (CONF:2228-28221) such that it  SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:2228-28222).  SHOULD contain zero or one [0..1] @extension (CONF:2228-28223). </sch:assert>
 		  <sch:assert id="a-2228-28218-warning" test="count(cda:code)=1">This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 (CONF:2228-28220). </sch:assert>
        </sch:rule>  
    </sch:pattern>
    
</sch:schema>