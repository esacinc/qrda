<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Order-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Order-pattern-errors">
        <sch:rule id="Encounter-Order-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2016-02-01']]">
            <sch:assert id="a-2228-27534-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27534). </sch:assert>
            <sch:assert id="a-2228-11932-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11932).  </sch:assert>
            <sch:assert id="a-2228-11933-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11933) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.22" (CONF:2228-11934).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27064).   </sch:assert>
            <sch:assert id="a-2228-11936-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-11936). </sch:assert>
            <sch:assert id="a-2228-27341-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27341).  </sch:assert>
        </sch:rule>       
        <sch:rule id="Encounter-Order-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2016-02-01']]/cda:code">
            <sch:assert id="a-2228-14896-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27623). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>