<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:phase id="errors">
		<sch:active pattern="Functional_Status_Performed-pattern-errors"/>
	</sch:phase>
	<sch:pattern id="Functional_Status_Performed-pattern-errors">
		<sch:rule id="Functional_Status_Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-27372-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27372).</sch:assert>
			<sch:assert id="a-2228-12752-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12752).</sch:assert>
			<sch:assert id="a-2228-12753-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2228-12753) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.26" (CONF:2228-12754). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27138).</sch:assert>
			<sch:assert id="a-2228-27628-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:2228-27628).</sch:assert>
			<sch:assert id="a-2228-12758-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:2228-12758).</sch:assert>
			<sch:assert id="a-2228-12760-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-12760).</sch:assert>
		</sch:rule>

		<sch:rule id="Functional_Status_Performed-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01']]/cda:code">
			<sch:assert id="a-2228-27629-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27629).</sch:assert>
		</sch:rule>

		<sch:rule id="Functional_Status_Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01']]/cda:statusCode">
			<sch:assert id="a-2228-12759-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-12759).</sch:assert>
		</sch:rule>
		
		<sch:rule id="Functional_Status_Performed-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01']]/cda:effectiveTime">
			<sch:assert id="a-2228-27560-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27560).</sch:assert>
		</sch:rule>
			
		<sch:rule id="Functional_Status_Performed-may-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26'][@extension='2016-02-01']]/cda:methodCode">
			<sch:assert id="a-2228-27718-error" test="@sdtc:valueSet">The methodCode, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27718).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
