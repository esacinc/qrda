<?xml version='1.0' encoding='UTF-8'?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-pattern-errors"/>
	</sch:phase>
	
	<sch:pattern id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-pattern-errors">
		<sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-errors" context='cda:observation[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.18"]]'>
			<sch:assert id="a-2226-21155-error" test='@classCode="OBS"'> 
				SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-21155).
			</sch:assert>
			<sch:assert id="a-2226-21156-error" test='@moodCode="EVN"'> 
				SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-21156).			
			</sch:assert>
			<sch:assert id="a-2233-711270-error" test='count(cda:templateId[@root="2.16.840.1.113883.10.20.27.3.18"][@extension="2016-03-01"]) = 1'> 
				SHALL contain exactly one [1..1] templateId (CONF:2233-711270) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.18" (CONF:2233-711271).
					SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711299).
			</sch:assert>
			<sch:assert id="a-2226-18238-error" test='count(cda:templateId[@root="2.16.840.1.113883.10.20.27.3.9"][@extension="2016-02-01"]) = 1'> 
				SHALL contain exactly one [1..1] templateId (CONF:2226-18237) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:2226-18238).
					Note: Payer Supplemental Data Element templateId (QRDA III)
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21157).
			</sch:assert>
			<sch:assert id="a-2233-12564-error" test='count(cda:id) &gt; 0'> 
				SHALL contain at least one [1..*] id (CONF:2233-12564).
			</sch:assert>
			<sch:assert id="a-2226-21158-error" test='count(cda:code) = 1'> 
				SHALL contain exactly one [1..1] code (CONF:2226-21158).
			</sch:assert>
			<sch:assert id="a-2226-18106-error" test='count(cda:statusCode) = 1'> 
				SHALL contain exactly one [1..1] statusCode (CONF:2226-18106).
			</sch:assert>
			<sch:assert id="a-2233-711196-error" test='count(cda:value[@xsi:type="CD"]) = 1'> 
				SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2233-711196).
			</sch:assert>
			<sch:assert id="a-2226-18108-error" test='count(cda:entryRelationship[@typeCode="SUBJ"][@inversionInd="true"][cda:observation[cda:templateId[@root="2.16.840.1.113883.10.20.27.3.24"]]]) = 1'> 
				SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18108) such that it
					SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18109).
					SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18110).
					SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.24) (CONF:2233-711199).
			</sch:assert>
		</sch:rule>

		<sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-code-errors" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.18"]]/cda:code'>
			<sch:assert id="a-2226-21159-error" test='@code="48768-6"'> 
				This code SHALL contain exactly one [1..1] @code="48768-6" Payment source  (CONF:2226-21159).
			</sch:assert>
			<sch:assert id="a-2226-21165-error" test='@codeSystem="2.16.840.1.113883.6.1"'> 
				This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21165).
			</sch:assert>
		</sch:rule>
		
		<sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-statusCode-errors" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.18"]]/cda:statusCode'>
			<sch:assert id="a-2226-18107-error" test='@code="completed"'> 
				This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18107).
			</sch:assert>
		</sch:rule>

		<sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-value-errors" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.18"]]/cda:value'>
			<sch:assert id="a-2233-711230-error" test='count(cda:translation)=1'> 
				This value SHALL contain exactly one [1..1] translation (CONF:2233-711230).
			</sch:assert>
		</sch:rule>

		<sch:rule id="QRDA_Category_III_Payer_Supplemental_Data_Element_CMS_EP_V2-translation-errors" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.18"]]/cda:value/cda:translation'>
			<sch:assert id="a-2226-19548-error" test='@code and @nullFlavor="OTH"'> 
				This translation SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet CMS Payer Groupings urn:oid:2.16.840.1.113883.3.249.14.102 (CONF:2233-711231).
				This value SHALL contain exactly one [1..1] @nullFlavor="OTH" (CONF:2233-711229).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
