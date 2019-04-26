<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-575 -->
<!-- Updated extension for template 2.16.840.1.113883.10.20.27.3.17 to 2019-05-01 throughout -->
<!-- Replaced conformance id prefix of 3259- with 4427- throughout -->

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Measure_Reference_and_Results-template-pattern-errors"/>
		<sch:active pattern="Measure_Reference_and_Results_CMS-pattern-errors"/> 
	</sch:phase>

	<sch:pattern id="Measure_Reference_and_Results-template-pattern-errors">
		<sch:rule id="Measure_Reference_and_Results-template-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-09-01']]">
			<sch:assert id="a-CMS_54-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2019-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_54) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.17" (CONF:CMS_55). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_56). </sch:assert>
		</sch:rule>	
	</sch:pattern>
	<sch:pattern id="Measure_Reference_and_Results_CMS-pattern-errors">
		<sch:rule id="Measure_Reference_and_Results_CMS-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'][@extension='2019-05-01']]">
			<sch:assert id="a-4427-18425_C01-error" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2019-05-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:4427-18425_C01) such that it SHALL contain exactly one [1..1] Measure Data - CMS (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.16:2019-05-01) (CONF:4427-18426_C01). </sch:assert>
		</sch:rule>
	</sch:pattern>

</sch:schema>
