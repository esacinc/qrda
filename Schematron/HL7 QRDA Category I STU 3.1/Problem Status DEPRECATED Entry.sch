<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Problem-Status-pattern-errors" />
    </sch:phase>
    
    
    <sch:pattern id="Problem-Status-pattern-errors">
        <sch:rule id="Problem-Status-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]">
		    <sch:assert id="a-1098-7357-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7357).</sch:assert>
		    <sch:assert id="a-1098-7358-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7358). </sch:assert>
		    <sch:assert id="a-1098-10518-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7359) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.6" (CONF:1098-10518).</sch:assert>
		    <sch:assert id="a-1098-19162-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19162).</sch:assert>
    	    <sch:assert id="a-1098-7364-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7364).</sch:assert>
		</sch:rule>
        
        <sch:rule id="Problem-Status-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]/cda:code">
            <sch:assert id="a-1098-19163-error" test="@code='33999-4'">This code SHALL contain exactly one [1..1] @code="33999-4" Status (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1098-19163). </sch:assert>
        </sch:rule>               
        <sch:rule id="Problem-Status-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]/cda:statusCode">
            <sch:assert id="a-1098-19113-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19113). </sch:assert>
        </sch:rule>               
          
    </sch:pattern>
    
 </sch:schema>