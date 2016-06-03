<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Activity-Observation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Activity-Observation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Activity-Observation-pattern-errors">
        <sch:rule id="Procedure-Activity-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]">
            <sch:assert id="a-1098-8282-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8282).</sch:assert>
            <sch:assert id="a-1098-8237-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-8237).</sch:assert>
            <sch:assert id="a-1098-8238-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8238) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.13" (CONF:1098-10520). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32507).</sch:assert>
            <sch:assert id="a-1098-8239-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8239).</sch:assert>
            <sch:assert id="a-1098-19197-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19197).</sch:assert>
             <sch:assert id="a-1098-8245-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8245).</sch:assert>
            <sch:assert id="a-1098-16846-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1098-16846).</sch:assert>
         </sch:rule>
        <sch:rule id="Procedure-Activity-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:code/cda:originalText/cda:reference[@value]">
            <sch:assert id="a-1098-19201-error" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19201). .</sch:assert>
        </sch:rule>               
        <sch:rule id="Procedure-Activity-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:statusCode">
            <sch:assert id="a-1098-32365-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:1098-32365). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Activity-Observation-performer-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:performer">
            <sch:assert id="a-1098-8252-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-8252).  </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:performer/cda:assignedEntity">
            <sch:assert id="a-1098-8253-error" test="count(cda:id)&gt;=1">This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-8253). </sch:assert>
            <sch:assert id="a-1098-8254-error" test="count(cda:addr)&gt;=1">This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-8254).   </sch:assert>
            <sch:assert id="a-1098-8255-error" test="count(cda:telecom)&gt;=1">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-8255).   </sch:assert>
        </sch:rule>        
        <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-representedOrganization-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-1098-8259-error" test="count(cda:addr)&gt;=1">The representedOrganization, if present, SHALL contain exactly one [1..1] addr (CONF:1098-8259). </sch:assert>
            <sch:assert id="a-1098-8260-error" test="count(cda:telecom)&gt;=1">The representedOrganization, if present, SHALL contain exactly one [1..1] telecom (CONF:1098-8260). </sch:assert>
        </sch:rule>        
    </sch:pattern>
    
    <sch:pattern id="Procedure-Activity-Observation-pattern-warnings">
        <sch:rule id="Procedure-Activity-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]">
            <sch:assert id="a-1098-8246-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-8246). </sch:assert>
            <sch:assert id="a-1098-8250-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-8250). </sch:assert>
            <sch:assert id="a-1098-8251-warning" test="count(cda:performer)&gt;=1">SHOULD contain zero or more [0..*] performer (CONF:1098-8251). </sch:assert>
            <sch:assert id="a-1098-32478-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32478). </sch:assert>
        </sch:rule>       
        <sch:rule id="Procedure-Activity-Observation-code-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:code">
            <sch:assert id="a-1098-19198-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19198). </sch:assert>
        </sch:rule>   
        <sch:rule id="Procedure-Activity-Observation-code-originalText-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:code/cda:originalText">
            <sch:assert id="a-1098-19199-warning" test="count(cda:reference)=1">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1098-19199). </sch:assert>
        </sch:rule>  
        <sch:rule id="Procedure-Activity-Observation-code-originalText-reference-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:code/cda:originalText/cda:reference">
            <sch:assert id="a-1098-19200-warning" test="@value">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1098-19200). </sch:assert>
        </sch:rule>  
        <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:performer/cda:assignedEntity">
            <sch:assert id="a-1098-8256-warning" test="count(cda:representedOrganization)=1"> This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-8256). </sch:assert>
        </sch:rule>  
        <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-representedOrganization-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-1098-8257-warning" test="count(cda:id)&gt;=1">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-8257). </sch:assert>
        </sch:rule>           
    </sch:pattern>
    
</sch:schema>