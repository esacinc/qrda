<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Planned-Medication-Activity-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Planned-Medication-Activity-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Planned-Medication-Activity-pattern-errors">
		<sch:rule id="Planned-Medication-Activity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]">
			 <sch:assert id="a-1098-8572-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8572).</sch:assert>
			 <sch:assert id="a-1098-8573-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8573).</sch:assert>
			 <sch:assert id="a-1098-30465-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30465) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.42" (CONF:1098-30466). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32557).</sch:assert>
			 <sch:assert id="a-1098-8575-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8575).</sch:assert>
			 <sch:assert id="a-1098-32087-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32087).</sch:assert>
			 <sch:assert id="a-1098-30468-error" test="count(cda:effectiveTime)&gt;=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-30468).</sch:assert>
			 <sch:assert id="a-1098-32082-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-32082).</sch:assert>

		</sch:rule>
        
        <sch:rule id="Planned-Medication-Activity-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]/cda:statusCode">
			 <sch:assert id="a-1098-32088-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32088).</sch:assert>
        </sch:rule>               
        <sch:rule id="Planned-Medication-Activity-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]/cda:consumable">
			 <sch:assert id="a-1098-32083-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'] [@extension = '2014-06-09']])=1">This consumable SHALL contain exactly one [1..1] Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-32083).</sch:assert>
        </sch:rule>               
        <sch:rule id="Planned-Medication-Activity-precondition-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]/cda:precondition">
			 <sch:assert id="a-1098-32085-error" test="@typeCode='PRCN'">The precondition, if present, SHALL contain exactly one [1..1] @typeCode="PRCN" Precondition (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32085).</sch:assert>
			 <sch:assert id="a-1098-32086-error" test="count(cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25' and @extension = '2014-06-09']])=1">The precondition, if present, SHALL contain exactly one [1..1] Precondition for Substance Administration (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1098-32086).</sch:assert>
        </sch:rule>               
       
    </sch:pattern>
    
    <sch:pattern id="Planned-Medication-Activity-pattern-warnings">
		<sch:rule id="Planned-Medication-Activity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]">
			<sch:assert id="a-1098-32046-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt;= 1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32046). </sch:assert>
		</sch:rule>
		<sch:rule id="Planned-Medication-Activity-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]/cda:doseQuantity">
			 <sch:assert id="a-1098-32133-warning" test="@unit">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32133).</sch:assert>
        </sch:rule>               
		<sch:rule id="Planned-Medication-Activity-rateQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]/cda:rateQuantity">
			 <sch:assert id="a-1098-32133-warning" test="@unit">The rateQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32134). </sch:assert>
        </sch:rule>               

     </sch:pattern>
</sch:schema>