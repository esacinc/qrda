<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Device-Recommended-V3-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Device-Recommended-V3-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Device-Recommended-V3-pattern-errors">
        <sch:rule id="Device-Recommended-V3-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10']]">
            <sch:assert id="a-2228-27722" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27722). </sch:assert>
            <sch:assert id="a-2228-12368" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-12368). </sch:assert>
            <sch:assert id="a-2228-12369" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-12369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.10" (CONF:2228-12370). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27094). </sch:assert>
            <sch:assert id="a-2228-27719" test="count(cda:templateId [@root='2.16.840.1.113883.10.20.22.4.119'])=1">SHALL contain exactly one [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:2228-27719).  </sch:assert>
            <sch:assert id="a-2228-12374" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole[@classCode='MANU'][count(cda:playingDevice[@classCode='DEV'][count(cda:code[@sdtc:valueSet])=1])=1])=1])=1">SHALL contain exactly one [1..1] participant (CONF:2228-12374) such that it SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12375).SHALL contain exactly one [1..1] participantRole (CONF:2228-12376).This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12377).This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:2228-12378).This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:2228-12379). This playingDevice SHALL contain exactly one [1..1] code (CONF:2228-12380). This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27587).      </sch:assert> 
        </sch:rule>
        
        
    </sch:pattern>
    
    <sch:pattern id="Device-Recommended-V3-pattern-warnings">
    </sch:pattern>
    
</sch:schema>