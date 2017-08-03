<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	
	<sch:phase id="errors">
		<sch:active pattern="Family_History_Observation_QDM-pattern-errors"/>
	</sch:phase>
	

	<sch:pattern id="Family_History_Observation_QDM-pattern-errors">
		<sch:rule id="Family_History_Observation_QDM-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2017-08-01']]">
			<sch:assert id="a-3343-27685-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27685).</sch:assert>
			<sch:assert id="a-3343-27686-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-27686).</sch:assert>
			<sch:assert id="a-3343-28057-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28057).</sch:assert>
			<sch:assert id="a-3343-27675-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-27675) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.112" (CONF:3343-27681). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27682).</sch:assert>
			<sch:assert id="a-3343-27688-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-27688).</sch:assert>
			<sch:assert id="a-3343-28661-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12'][@extension='2017-08-01'])=1">This template SHALL be contained by a Family History Organizer QDM (V4) (CONF:3343-28661).</sch:assert>
		</sch:rule>
	
		<sch:rule id="Family_History_Observation_QDM-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2017-08-01']]/cda:author">
			<sch:assert id="a-3343-29008-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29008). </sch:assert>
			<sch:assert id="a-3343-29007-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29007). </sch:assert>
		</sch:rule>
		<sch:rule id="Family_History_Observation_QDM-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
			<sch:assert id="a-3343-29009-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29009). </sch:assert>
		</sch:rule>
		
	</sch:pattern>

</sch:schema>
