<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Admission_Source-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Admission_Source-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Admission_Source-pattern-errors">
        <sch:rule id="Admission_Source-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-29094-error" test="@classCode='SDLOC'">SHALL contain exactly one [1..1] @classCode="SDLOC" (CodeSystem: HL7RoleCode urn:oid:2.16.840.1.113883.5.111 STATIC) (CONF:3343-29094).</sch:assert>
            <sch:assert id="a-3343-29091-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-29091) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.151" (CONF:3343-29093). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29100).</sch:assert>
            <sch:assert id="a-3343-29099-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-29099).</sch:assert>
        </sch:rule>
        <sch:rule id="Admission_Source-playingEntity-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01']]/cda:playingEntity">
            <sch:assert id="a-3343-29097-error" test="@classCode='PLC'">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:3343-29097).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="Admission_Source-pattern-warnings">
        <sch:rule id="Admission_Source-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-29095-warning" test="count(cda:addr) &gt; 0">SHOULD contain zero or more [0..*] addr (CONF:3343-29095).</sch:assert>
            <sch:assert id="a-3343-29096-warning" test="count(cda:telecom) &gt; 0">SHOULD contain zero or more [0..*] telecom (CONF:3343-29096).</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>