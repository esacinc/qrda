<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	
	<sch:phase id="errors">
		<sch:active pattern="Family_History_Observation_QDM_V2-pattern-errors"/>
	</sch:phase>
	
	<sch:phase id="warnings">
		<sch:active pattern="Family_History_Observation_QDM_V2-pattern-warnings"/>
	</sch:phase>
	
	<sch:pattern id="Family_History_Observation_QDM_V2-pattern-errors">
		<sch:rule id="Family_History_Observation_QDM_V2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2016-02-01']]">
			<sch:assert id="a-2228-27685-error" test="@classCode='OBS'">
				SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27685).
			</sch:assert>
			<sch:assert id="a-2228-27686-error" test="@moodCode='EVN'">
				SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27686).
			</sch:assert>
			<sch:assert id="a-2228-28057-error" test="not(@negationInd)">
				SHALL NOT contain [0..0] @negationInd (CONF:2228-28057).
			</sch:assert>
			<sch:assert id="a-2228-27675-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2016-02-01'])=1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-27675) such that it 
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.112" (CONF:2228-27681). 
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27682).
			</sch:assert>
			<sch:assert id="a-2228-27688-error" test="count(cda:value[@xsi:type='CD'])=1">
				SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2228-27688).
			</sch:assert>
		</sch:rule>
	
		<sch:rule id="Family_History_Observation_QDM_V2-may-code-translation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2016-02-01']]/cda:code/cda:translation">
				<sch:assert id="a-2228-27695-error" test="@sdtc:valueSet">
					The translation, if present, SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27695).
				</sch:assert>
		</sch:rule>
	</sch:pattern>

	<sch:pattern id="Family_History_Observation_QDM_V2-pattern-warnings">
		<sch:rule id="Family_History_Observation_QDM_V2-value-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2016-02-01']]/cda:value">
			<sch:assert id="a-2228-27694-warning" test="@sdtc:valueSet">
				This value SHOULD contain zero or one [0..1] @sdtc:valueSet (CONF:2228-27694).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
