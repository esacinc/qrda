<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Priority-Preference-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Priority-Preference-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Priority-Preference-pattern-errors">
		<sch:rule id="Priority-Preference-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]">
			  <sch:assert id="a-1098-30949-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30949).</sch:assert>
			  <sch:assert id="a-1098-30950-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-30950).</sch:assert>
			  <sch:assert id="a-1098-30951-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30951) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.143" (CONF:1098-30952).</sch:assert>
			  <sch:assert id="a-1098-30953-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-30953).</sch:assert>
			  <sch:assert id="a-1098-30954-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-30954).</sch:assert>
			  <sch:assert id="a-1098-30957-error" test="count(cda:value[@xsi:type='CD' and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.60']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Priority Level urn:oid:2.16.840.1.113883.11.20.9.60 STATIC 2014-06-11 (CONF:1098-30957).</sch:assert>
		</sch:rule>
        
        <sch:rule id="Priority-Preference-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]/cda:code">
			  <sch:assert id="a-1098-30955" test="@code='225773000'">This code SHALL contain exactly one [1..1] @code="225773000" Preference (CONF:1098-30955).</sch:assert>
			  <sch:assert id="a-1098-30956" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30956).</sch:assert>
        </sch:rule>               
    </sch:pattern>
    
    <sch:pattern id="Priority-Preference-pattern-warnings">
		<sch:rule id="Priority-Preference-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]">
			<sch:assert id="a-1098-32327-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-32327). </sch:assert>
			<sch:assert id="a-1098-30958-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-30958). </sch:assert>

		</sch:rule>

    </sch:pattern>
</sch:schema>