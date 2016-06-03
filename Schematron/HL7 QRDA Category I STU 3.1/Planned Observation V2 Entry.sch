<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Planned-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Planned-Observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Planned-Observation-pattern-errors">
		<sch:rule id="Planned-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44']]">
			  <sch:assert id="a-1098-8581-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8581).</sch:assert>
			  <sch:assert id="a-1098-8582-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.25']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Observation) urn:oid:2.16.840.1.113883.11.20.9.25 STATIC 2011-09-30 (CONF:1098-8582).</sch:assert>
			  <sch:assert id="a-1098-30451-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30451) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.44" (CONF:1098-30452). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32555).</sch:assert>
			  <sch:assert id="a-1098-8584-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8584).</sch:assert>
			  <sch:assert id="a-1098-30453-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30453).</sch:assert>
			  <sch:assert id="a-1098-31030-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31030).</sch:assert>
		</sch:rule>       
        <sch:rule id="Planned-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44']]/cda:statusCode">
			  <sch:assert id="a-1098-32032-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32032).</sch:assert>
        </sch:rule>                      
    </sch:pattern>
    
    <sch:pattern id="Planned-Observation-pattern-warnings">
		<sch:rule id="Planned-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44']]">
			<sch:assert id="a-1098-30454-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30454).  </sch:assert>
			<sch:assert id="a-1098-32033" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt;= 1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32033).</sch:assert>
			<sch:assert id="a-1098-32044" test="count(cda:targetSiteCode) &gt;= 1">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-32044).</sch:assert>
		</sch:rule>
     </sch:pattern>
    
</sch:schema>