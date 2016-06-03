<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Planned-Supply-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Planned-Supply-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Planned-Supply-pattern-errors">
		<sch:rule id="Planned-Supply-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43']]">
			 <sch:assert id="a-1098-8577-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8577).</sch:assert>
			 <sch:assert id="a-1098-8578-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8578).</sch:assert>
			 <sch:assert id="a-1098-30463-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30463) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.43" (CONF:1098-30464). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32556).</sch:assert>
			 <sch:assert id="a-1098-8580-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8580).</sch:assert>
			 <sch:assert id="a-1098-30458-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30458).</sch:assert>
		</sch:rule>       
        <sch:rule id="Planned-Supply-statusCode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43']]/cda:statusCode">
			 <sch:assert id="a-1098-32047-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32047).</sch:assert>
        </sch:rule>                     
    </sch:pattern>
    
    <sch:pattern id="Planned-Supply-pattern-warnings">
		<sch:rule id="Planned-Supply-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43']]">
			<sch:assert id="a-1098-30459-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30459). </sch:assert>
			<sch:assert id="a-1098-32325-warning" test="count(cda:product)=1">SHOULD contain zero or one [0..1] product (CONF:1098-32325). </sch:assert>
			<sch:assert id="a-1098-31129-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31129). </sch:assert>
		</sch:rule>
    </sch:pattern>
    
</sch:schema>