<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	
	<sch:phase id="errors">
		<sch:active pattern="Family_History_Organizer_QDM_V3-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="Family_History_Organizer_QDM_V3-pattern-errors">
		<sch:rule id="Family_History_Organizer_QDM_V3-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12']]">
			<sch:assert id="a-2228-14175-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12'][@extension='2016-02-01'])=1">
				SHALL contain exactly one [1..1] templateId (CONF:2228-14175) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.12" (CONF:2228-14176).
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26553).
			</sch:assert>
			<sch:assert id="a-2228-27715-error" test="(count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112']]) = 1]) &gt; 0)">
				SHALL contain at least one [1..*] component (CONF:2228-27715) such that it
					SHALL contain exactly one [1..1] Family History Observation QDM (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.112:2016-02-01) (CONF:2228-27716).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
