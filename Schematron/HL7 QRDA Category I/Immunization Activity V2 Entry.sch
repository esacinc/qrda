<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Immunization_activity-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Immunization_activity-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Immunization_activity-pattern-errors">
        <sch:rule id="Immunization_activity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]">
            <sch:assert id="a-1098-8826-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8826).</sch:assert>
            <sch:assert id="a-1098-8827-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2014-09-01 (CONF:1098-8827).</sch:assert>
            <sch:assert id="a-1098-8828-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8828) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.52" (CONF:1098-10498). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32528).</sch:assert>
            <sch:assert id="a-1098-8829-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8829).</sch:assert>
            <sch:assert id="a-1098-8833-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8833).</sch:assert>
            <sch:assert id="a-1098-8834-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-8834).</sch:assert>
            <sch:assert id="a-1098-8847-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-8847).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_activity-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]/cda:statusCode">
            <sch:assert id="a-1098-32359-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32359).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_activity-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]/cda:consumable">
            <sch:assert id="a-1098-15546-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']])=1">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:1098-15546).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Immunization_activity-pattern-warnings">
        <sch:rule id="Immunization_activity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]">
            <sch:assert id="a-1098-8841-warning" test="count(cda:doseQuantity)=1">SHOULD contain zero or one [0..1] doseQuantity (CONF:1098-8841).</sch:assert>
            <sch:assert id="a-1098-8849-warning" test="count(cda:performer)=1">SHOULD contain zero or one [0..1] performer (CONF:1098-8849).</sch:assert>
            <sch:assert id="a-1098-31151-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31151).</sch:assert>
            <sch:assert id="a-1098-31510-warning" test="count(cda:entryRelationship[@typeCode='COMP'][@inversionInd='true'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']])=1]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:1098-31510) such that it SHALL contain exactly one [1..1] @typeCode="COMP" Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31511). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:1098-31512). SHALL contain exactly one [1..1] Substance Administered Act (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.118) (CONF:1098-31514).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_activity-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]/cda:doseQuantity">
            <sch:assert id="a-1098-8842-warning" test="@unit">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-8842).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>