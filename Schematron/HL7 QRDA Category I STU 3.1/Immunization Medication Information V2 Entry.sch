<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Immunization_medication_information-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Immunization_medication_information-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Immunization_medication_information-pattern-errors">
        <sch:rule id="Immunization_medication_information-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54']]">
            <sch:assert id="a-1098-9002" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-9002).</sch:assert>
            <sch:assert id="a-1098-9004" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-9004) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.54" (CONF:1098-10499). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32602).</sch:assert>
            <sch:assert id="a-1098-9006" test="count(cda:manufacturedMaterial)=1">SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-9006).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_medication_information-manufacturedMaterial-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54']]/cda:manufacturedMaterial">
            <sch:assert id="a-1098-9007" test="count(cda:code)=1">This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet CVX Vaccines Administered - Vaccine Set urn:oid:2.16.840.1.113762.1.4.1010.6 DYNAMIC (CONF:1098-9007).</sch:assert>
            <sch:assert id="a-1098-9014" test="count(cda:lotNumberText)=1">This manufacturedMaterial SHALL contain exactly one [1..1] lotNumberText (CONF:1098-9014).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Immunization_medication_information-pattern-warnings">
        <sch:rule id="Immunization_medication_information-warnings" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54']]">
            <sch:assert id="a-1098-9012" test="count(cda:manufacturerOrganization)=1">SHOULD contain zero or one [0..1] manufacturerOrganization (CONF:1098-9012).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>