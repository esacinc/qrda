<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="CMS_QRDA_Category_I_Patient_Data_Section_QDM_CMS_pattern-errors" />
	</sch:phase>
	<sch:pattern id="CMS_QRDA_Category_I_Patient_Data_Section_QDM_CMS_pattern-errors">
		<sch:rule id="CMS_QRDA_Category_I_Patient_Data_Section_QDM_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1.1'][@extension='2017-07-01']]">
			<sch:assert id="a-CMS_0036-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1.1'][@extension='2017-07-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:CMS_0036) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.1.1" (CONF:CMS_0037). SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:CMS_0038).</sch:assert> 
			<sch:assert id="a-CMS_0051-error" test="count(cda:entry[*[cda:templateId[@root != '2.16.840.1.113883.10.20.24.3.55']]]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:CMS_0051) such that it SHALL contain exactly one [1..1] entry template that is other than the Patient Characteristic Payer (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.55) (CONF:CMS_0039).</sch:assert>
			<sch:assert id="a-3265-14430_C01-error" test="count(cda:entry[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:3265-14430_C01) such that it SHALL contain exactly one [1..1] Patient Characteristic Payer (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.55) (CONF:3265-14431).</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>