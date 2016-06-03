<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Precondition-For-Substance-Administration-pattern-errors" />
    </sch:phase>
     
    <sch:pattern id="Precondition-For-Substance-Administration-pattern-errors">
		<sch:rule id="Precondition-For-Substance-Administration-errors" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25']]">
			  <sch:assert id="a-1098-7372-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7372) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.25" (CONF:1098-10517). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32603).</sch:assert>
			  <sch:assert id="a-1098-32396-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code with @xsi:type="CD" (CONF:1098-32396).</sch:assert>
			  <sch:assert id="a-098-7369-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1098-7369). </sch:assert>
		</sch:rule>      
        <sch:rule id="Precondition-For-Substance-Administration-code-errors" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25']]/cda:code">
			  <sch:assert id="a-1098-32397-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-32397). </sch:assert>
			  <sch:assert id="a-1098-32398-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32398). </sch:assert>
        </sch:rule>               
    </sch:pattern>
 
</sch:schema>