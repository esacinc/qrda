<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Improvement_Activity_Performed_Measure_Referencea_and_Results_CMS-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="Improvement_Activity_Performed_Measure_Referencea_and_Results_CMS-pattern-errors">
		<sch:rule id="Improvement_Activity_Performed_Measure_Referencea_and_Results_CMS-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.3.249.20.3.1'][@extension='2018-05-01']]">
			<sch:assert id="a-CMS_71-error" test="count(cda:templateId[@root='2.16.840.1.113883.3.249.20.3.1'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_71) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.20.3.1" (CONF:CMS_72). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_73). </sch:assert>
			<sch:assert id="a-CMS_74-error" test="count(cda:component[count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=1]) = 1">SHALL contain exactly one [1..1] component (CONF:CMS_74) such that it  SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_75). </sch:assert>
		</sch:rule>

	</sch:pattern>
	
</sch:schema>
