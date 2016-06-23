<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Drug-Vehicle-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Drug-Vehicle-pattern-errors">
        <sch:rule id="Drug-Vehicle-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]">
            <sch:assert id="a-81-7490-error" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7490). </sch:assert>
            <sch:assert id="a-81-7495-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24'])=1">SHALL contain exactly one [1..1] templateId (CONF:817495) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.24" (CONF:81-10493). </sch:assert>
            <sch:assert id="a-81-19137-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19137). </sch:assert>
            <sch:assert id="a-81-7492-error" test="count(cda:playingEntity)=1">SHALL contain exactly one [1..1] playingEntity (CONF:81-7492). </sch:assert>
        </sch:rule>       
        <sch:rule id="Drug-Vehicle-code-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]/cda:code">
            <sch:assert id="a-81-30818-error" test="@code='412307009'">This code SHALL contain exactly one [1..1] @code="412307009" Drug Vehicle (CONF:81-19138).  </sch:assert>
            <sch:assert id="a-81-26502-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:81-26502).  </sch:assert>
        </sch:rule>
        <sch:rule id="Drug-Vehicle-playingEntity-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]/cda:playingEntity">
            <sch:assert id="a-81-7493-error" test="@code">This playingEntity SHALL contain exactly one [1..1] code (CONF:81-7493). </sch:assert>
        </sch:rule>       
    </sch:pattern>
    
</sch:schema>