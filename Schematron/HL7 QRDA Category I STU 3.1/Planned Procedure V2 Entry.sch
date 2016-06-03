<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Planned-Procedure-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Planned-Procedure-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Planned-Procedure-pattern-errors">
		<sch:rule id="Planned-Procedure-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]">
			  <sch:assert id="a-1098-8568-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8568).</sch:assert>
			  <sch:assert id="a-1098-8569-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8569).</sch:assert>
			  <sch:assert id="a-1098-30444-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30444) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.41" (CONF:1098-30445). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32554).</sch:assert>
			  <sch:assert id="a-1098-8571-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8571).</sch:assert>
			  <sch:assert id="a-1098-30446-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30446).</sch:assert>
			  <sch:assert id="a-1098-31976-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31976).</sch:assert>
		</sch:rule>       
        <sch:rule id="Planned-Procedure-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]/cda:statusCode">
			 <sch:assert id="a-1098-31978-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31978).</sch:assert>
        </sch:rule>                      
    </sch:pattern>
    
    <sch:pattern id="Planned-Procedure-pattern-warnings">
		<sch:rule id="Planned-Procedure-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]">
			<sch:assert id="a-1098-30447-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30447). </sch:assert>
			<sch:assert id="a1098-31979-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31979). </sch:assert>
		</sch:rule>
		<sch:rule id="Planned-Procedure-code-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]/cda:code">
			<sch:assert id="a-1098-31977-warning" test="@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.6.96' or @codeSystem='2.16.840.1.113883.6.12' or @codeSystem='2.16.840.1.113883.6.4'">The procedure/code in a planned procedure SHOULD be selected from LOINC (codeSystem 2.16.840.1.113883.6.1) *OR* SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96), and *MAY* be selected from CPT-4 (CodeSystem: 2.16.840.1.113883.6.12) *OR* ICD10 PCS (CodeSystem: 2.16.840.1.113883.6.4) (CONF:1098-31977).</sch:assert>
		</sch:rule>
    </sch:pattern>
    
</sch:schema>