<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="QRDA_Category_I_Reporting_Parameters_Section_CMS_EH-pattern-errors" />
	</sch:phase>
	<sch:pattern id="QRDA_Category_I_Reporting_Parameters_Section_CMS_EH-pattern-errors">
		<sch:rule id="QRDA_Category_I_Reporting_Parameters_Section_CMS_EH-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1.1']]">
			<sch:assert id="a-CMS_0040-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1.1'][@extension='2016-03-01']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:CMS_0040) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.17.2.1.1" (CONF:CMS_0041).
					SHALL contain exactly one [1..1] @extension='2016-03-01" (CONF:CMS_0042).
			</sch:assert>
			<sch:assert id="a-CMS_0023-error" test="count(cda:entry[count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8.1'][@extension='2016-03-01']])=1]) = 1">
				SHALL contain exactly one [1..1] entry (CONF:CMS_0023) such that it
					SHALL contain exactly one [1..1] Reporting Parameters Act - CMS (identifier: urn:hl7ii:2.16.840.1.113883.10.20.17.3.8.1:2016-03-01) (CONF:CMS_0024).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>