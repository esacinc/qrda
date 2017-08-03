<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Immunization_order-pattern-errors" />
    </sch:phase>
    
     
    <sch:pattern id="Immunization_order-pattern-errors">
        <sch:rule id="Immunization_order-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]">
            <sch:assert id="a-3343-28645-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28645).</sch:assert>
            <sch:assert id="a-3343-28644-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28644).</sch:assert>
            <sch:assert id="a-3343-28627-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28627) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.143" (CONF:3343-28634). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28923).</sch:assert>
            <sch:assert id="a-3343-28924-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28924). </sch:assert>
            <sch:assert id="a-3343-28646-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-28646).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_order-effectiveTime-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]/cda:effectiveTime">
            <sch:assert id="a-3343-28925-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28925).</sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_order-author-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]/cda:author">
            <sch:assert id="a-3343-29029-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29029). </sch:assert>
            <sch:assert id="a-3343-29028-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29028). </sch:assert>
        </sch:rule>
        <sch:rule id="Immunization_order-author-assignedAuthor-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
            <sch:assert id="a-3343-29030-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29030).  </sch:assert>
        </sch:rule>
    </sch:pattern>
    
 </sch:schema>