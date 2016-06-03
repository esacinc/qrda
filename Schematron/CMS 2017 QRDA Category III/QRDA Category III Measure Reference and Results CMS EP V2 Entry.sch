<?xml version='1.0' encoding='UTF-8'?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-errors"/>
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-warnings"/>
	</sch:phase>
	
	<sch:pattern id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-errors">
		<sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-errors" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.17"]]'>
			<sch:assert id="a-2226-17887-error" test='@classCode="CLUSTER"'> 
				SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17887).			
			</sch:assert>
			<sch:assert id="a-2226-17888-error" test='@moodCode="EVN"'> 
				SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17888).			
			</sch:assert>
			<sch:assert id="a-2233-711268-error" test='count(cda:templateId[@root="2.16.840.1.113883.10.20.27.3.17"][@extension="2016-03-01"]) = 1'> 
				SHALL contain exactly one [1..1] templateId (CONF:2233-711268) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.17" (CONF:2233-711269).
					SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:2233-711297).
			</sch:assert>
			<sch:assert id="a-67-19532-error" test='count(cda:templateId[@root="2.16.840.1.113883.10.20.24.3.98"]) = 1'> 
				SHALL contain exactly one [1..1] templateId (CONF:67-19532) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:67-19533).
					Note: Measure Reference templateId (QRDA III)
			</sch:assert>
			<sch:assert id="a-2226-17908-error" test='count(cda:templateId[@root="2.16.840.1.113883.10.20.27.3.1"][@extension="2016-02-01"]) = 1'> 
				SHALL contain exactly one [1..1] templateId (CONF:2226-17908) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:2226-17909).
					Note: Measure Reference and Results templateId (QRDA III)
					SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21170).
			</sch:assert>
			<sch:assert id="a-2226-1788-error" test='count(cda:statusCode) = 1'> 
				SHALL contain exactly one [1..1] statusCode (CONF:2226-17889).
			</sch:assert>
			<sch:assert id="a-2226-17890-error" test='count(cda:reference[@typeCode="REFR"][count(cda:externalDocument)=1]) = 1'> 
				SHALL contain exactly one [1..1] reference (CONF:2226-17890) such that it
					SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:2226-17891).
					SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17892).
			</sch:assert>
			<sch:assert id="a-2233-18425-error" test='count(cda:component[count(cda:observation[cda:templateId[@root="2.16.840.1.113883.10.20.27.3.16"][@extension="2016-03-01"]])=1]) &gt; 0'> 
				SHALL contain at least one [1..*] component (CONF:2233-18425) such that it
					SHALL contain exactly one [1..1] Measure Data (CMS EP) (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.16:2016-03-01) (CONF:2233-711296).
			</sch:assert>
		</sch:rule>

		<sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-statusCode-errors" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.17"]]/cda:statusCode'>
			<sch:assert id="a-2226-19552-error" test='@code="completed"'> 
				This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19552).
			</sch:assert>
		</sch:rule>

		<sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-externalDocument-errors" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.17"]]/cda:reference/cda:externalDocument'>
			<sch:assert id="a-2226-19548-error" test='@classCode="DOC" and count(cda:id[@root="2.16.840.1.113883.4.738"][@extension]) =1'> 
				This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2226-19548).
				This externalDocument SHALL contain exactly one [1..1] id (CONF:2226-18192) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:2226-18193).
					Note: This OID indicates that the @extension contains the version specific identifier for the eMeasure
					SHALL contain exactly one [1..1] @extension (CONF:2233-711289).
					Note: This @extension SHALL equal the version specific identifier for eMeasure (i.e. QualityMeasureDocument/id)
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	
	<sch:pattern id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-pattern-warnings">
		<sch:rule id="QRDA_Category_III_Measure_Reference_and_Results_CMS_EP_V2-warnings" context='cda:organizer[cda:templateId[@root = "2.16.840.1.113883.10.20.27.3.17"]]/cda:reference/cda:externalDocument'>
			<sch:assert id="a-2226-17896-warning" test='count(cda:code[@code="57024-2"])=1'> 
				This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-17896).
					The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19553).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>
