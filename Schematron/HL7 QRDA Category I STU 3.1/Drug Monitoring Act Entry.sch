<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Drug-Monitoring-Act-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Drug-Monitoring-Act-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Drug-Monitoring-Act-pattern-errors">
        <sch:rule id="Drug-Monitoring-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]">
            <sch:assert id="a-1098-30823" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30823). </sch:assert>
            <sch:assert id="a-1098-28656" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CONF:1098-28656). </sch:assert>
            <sch:assert id="a-1098-28657" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-28657) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.123" (CONF:1098-28658). </sch:assert>
            <sch:assert id="a-1098-31920" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1098-31920).  </sch:assert>
            <sch:assert id="a-1098-28660" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-28660). </sch:assert>
            <sch:assert id="a-1098-31921" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31921).  </sch:assert>
            <sch:assert id="a-1098-31922" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31922).   </sch:assert>     
            <sch:assert id="a-1098-28661" test="count(cda:participant[@typeCode='RESP'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:id)&gt;=1] [count(cda:playingEntity[@classCode='PSN'][count(cda:name[templateId[@root='2.16.840.1.113883.10.20.22.5.1']])=1])=1])=1])=1"> SHALL contain at least one [1..*] participant (CONF:1098-28661) such that it SHALL contain exactly one [1..1] @typeCode="RESP" (CONF:1098-28663). SHALL contain exactly one [1..1] participantRole (CONF:1098-28662). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" (CONF:1098-28664). This participantRole SHALL contain at least one [1..*] id (CONF:1098-28665). This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-28667). This playingEntity SHALL contain exactly one [1..1] @classCode="PSN" (CONF:1098-28668).  This playingEntity SHALL contain exactly one [1..1] US Realm Patient Name (PTN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1) (CONF:1098-28669). </sch:assert> 
        </sch:rule>
        
        <sch:rule id="Drug-Monitoring-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]/cda:code">
            <sch:assert id="a-1098-30818" test="@code='395170001'">This code SHALL contain exactly one [1..1] @code="395170001" medication monitoring (regime/therapy) (CONF:1098-30818). </sch:assert>
            <sch:assert id="a-1098-30819" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30819).  </sch:assert>
        </sch:rule>

        <sch:rule id="Drug-Monitoring-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]/cda:statusCode">
            <sch:assert id="a-1098-32358" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32358).  </sch:assert>
        </sch:rule>
        
      </sch:pattern>
    
    <sch:pattern id="Drug-Monitoring-Act-pattern-warnings">
    </sch:pattern>
    
</sch:schema>