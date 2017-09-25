<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Family_History_Death_Observation-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Family_History_Death_Observation-pattern-errors">
        <sch:rule id="Family_History_Death_Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]">
            <sch:assert id="a-81-8621-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8621).</sch:assert>
            <sch:assert id="a-81-8622-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8622).</sch:assert>
            <sch:assert id="a-81-8623-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:81-8623) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.47" (CONF:81-10495). </sch:assert>
            <sch:assert id="a-81-19141-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19141).</sch:assert>
            <sch:assert id="a-81-8625-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-8625).</sch:assert>
            <sch:assert id="a-81-8626-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:81-8626).</sch:assert>
        </sch:rule>

    	<sch:rule id="Family_History_Death_Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]/cda:code">
	    	<sch:assert id="a-81-19142-error" test="@code ='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:81-19142).</sch:assert>
	    	<sch:assert id="a-81-26504-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:81-26504).</sch:assert>
    	</sch:rule>

    	<sch:rule id="Family_History_Death_Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]/cda:statusCode">
    		<sch:assert id="a-81-19097-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19097).   </sch:assert>
    	</sch:rule>
    	
    	<sch:rule id="Family_History_Death_Observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]/cda:value">
    		<sch:assert id="a-81-26470-error" test="@code='419099009'">This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:81-26470).</sch:assert>
    	</sch:rule>
    	
    </sch:pattern>
</sch:schema>