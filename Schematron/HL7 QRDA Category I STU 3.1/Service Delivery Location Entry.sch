<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Service-Delivery-Location-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Service-Delivery-Location-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Service-Delivery-Location-pattern-errors">
        <sch:rule id="Service-Delivery-Location-errors" context="cda:participationRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
            <sch:assert id="a-81-28426-error" test="@classCode='SDLOC'">SHALL contain exactly one [1..1] @classCode="SDLOC" (CodeSystem: RoleCode urn:oid:2.16.840.1.113883.5.111 STATIC) (CONF:7758).  </sch:assert>
            <sch:assert id="a-81-10524-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32'])=1">SHALL contain exactly one [1..1] templateId (CONF:7635) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.32" (CONF:10524). </sch:assert>
            <sch:assert id="a-81-16850-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet HealthcareServiceLocation urn:oid:2.16.840.1.113883.1.11.20275 STATIC (CONF:16850).</sch:assert>
         </sch:rule>
        <sch:rule id="Service-Delivery-Location-playingEntity-errors" context="cda:participationRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]/cda:playingEntity">
            <sch:assert id="a-81-7763-error" test="@classCode='PLC'">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:7763). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Service-Delivery-Location-pattern-warnings">
        <sch:rule id="Service-Delivery-Location-warnings" context="cda:participationRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
            <sch:assert id="a-81-7760-warning" test="count(cda:addr)&gt;=1">SHOULD contain zero or more [0..*] addr (CONF:7760).</sch:assert>
            <sch:assert id="a-81-7761-warning" test="count(cda:telecom)=1">SHOULD contain zero or more [0..*] telecom (CONF:7761). </sch:assert>
        </sch:rule>       
    </sch:pattern>
    
</sch:schema>