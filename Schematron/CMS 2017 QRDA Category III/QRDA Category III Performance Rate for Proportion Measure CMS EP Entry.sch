<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
 	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-pattern-errors">
		<sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]">
			<sch:assert id="a-1109-711255-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25']) = 1"> 
				SHALL contain exactly one [1..1] templateId (CONF:1109-711255) such that it
					SHALL contain exactly one [1..1] @root='2.16.840.1.113883.10.20.27.3.25" (CONF:1109-711256).
			</sch:assert>
			<sch:assert id="a-1109-18399-error" test="count(cda:value[@xsi:type='REAL']) = 1"> 
				SHALL contain exactly one [1..1] value with @xsi:type='REAL" (CONF:1109-18399).
			</sch:assert>
			<sch:assert id="a-1109-711203-error" test="count(cda:reference) = 1"> 
				SHALL contain exactly one [1..1] reference (CONF:1109-711203).
			</sch:assert>
		</sch:rule>

		<sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-value-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:value">
			<sch:assert id="a-1109-711294-error" test="@value &gt;= 0 or @value &lt;= 1"> 
				The value, if present, SHALL be greater than or equal to 0 and less than or equal to 1 (CONF:1109-711294).
			</sch:assert>
			<sch:assert id="a-1109-711295-error" test="string-length(substring-after(@value,'.')) &lt;= 6"> 
				The value, if present, SHALL contain no more than 6 digits to the right of the decimal (CONF:1109-711295).
			</sch:assert>
		</sch:rule>

		<sch:rule id="QRDA_Category_III_Performance_Rate_for_Proportion_Measure_CMS_EP-reference-errors" context="cda:observation[cda:templateId[@root = '2.16.840.1.113883.10.20.27.3.25']]/cda:reference">
			<sch:assert id="a-1109-19652-error" test="@typeCode='REFR'"> 
				This reference SHALL contain exactly one [1..1] @typeCode='REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1109-19652).
			</sch:assert>
			<sch:assert id="a-1109-19653-error" test="count(cda:externalObservation)=1"> 
				This reference SHALL contain exactly one [1..1] externalObservation (CONF:1109-19653).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
