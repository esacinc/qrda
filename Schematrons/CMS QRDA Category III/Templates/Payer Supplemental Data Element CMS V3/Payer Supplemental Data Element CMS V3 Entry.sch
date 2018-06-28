<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->
<!-- JIRA https://tracker.esacinc.com/browse/QRDA-444 -->

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	
	<sch:phase id="errors">
		<sch:active pattern="Payer_Supplemental_Data_Element-template-pattern-errors"/>
		<sch:active pattern="Payer_Supplemental_Data_Element_CMS-pattern-errors"/>
	</sch:phase>

	<sch:pattern id="Payer_Supplemental_Data_Element-template-pattern-errors">
		<sch:rule id="Payer_Supplemental_Data_Element-template-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01']]">
			<sch:assert id="a-CMS_47-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_47) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.18" (CONF:CMS_48). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_49).</sch:assert>
		</sch:rule>	
	</sch:pattern>
	<sch:pattern id="Payer_Supplemental_Data_Element_CMS-pattern-errors">
		<sch:rule id="Payer_Supplemental_Data_Element_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'][@extension='2018-05-01']]">
			<sch:assert id="a-CMS_50-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:CMS_50). </sch:assert>
		</sch:rule>

		<sch:rule id="Payer_Supplemental_Data_Element_CMS-value-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.18'][@extension='2018-05-01']]/cda:value">
			<sch:assert id="a-CMS_52-error" test="count(cda:translation)=1">This value SHALL contain exactly one [1..1] translation (CONF:CMS_52).</sch:assert>
			<sch:assert id="a-CMS_51-error" test="@nullFlavor='OTH'">This value SHALL contain exactly one [1..1] @nullFlavor="OTH" (CONF:CMS_51).</sch:assert>
		</sch:rule>

		<sch:rule id="Payer_Supplemental_Data_Element_CMS-translation-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.18']]/cda:value/cda:translation">
			<sch:assert id="a-CMS_53-error" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.249.14.102']/voc:code/@value">This translation SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet CMS Payer Groupings urn:oid:2.16.840.1.113883.3.249.14.102 (CONF:CMS_53). </sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
