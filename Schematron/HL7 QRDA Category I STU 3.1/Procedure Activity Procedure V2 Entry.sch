<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Activity-Procedure-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Activity-Procedure-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Activity-Procedure-pattern-errors">
        <sch:rule id="Procedure-Activity-Procedure-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]">
            <sch:assert id="a-1098-7652-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7652).</sch:assert>
            <sch:assert id="a-1098-7653-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7653).</sch:assert>
            <sch:assert id="a-1098-7654-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7654) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.14" (CONF:1098-10521). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32506).</sch:assert>
            <sch:assert id="a-1098-7655-error" test="count(cda:id) &gt;=1">SHALL contain at least one [1..*] id (CONF:1098-7655).</sch:assert>
            <sch:assert id="a-1098-7656-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-7656).</sch:assert>
            <sch:assert id="a-1098-7661-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7661).</sch:assert>
         </sch:rule>
        
        <sch:rule id="Procedure-Activity-Procedure-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:code/cda:originalText/cda:reference[@value]">
            <sch:assert id="a-1098-19206-error" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19206).</sch:assert>
        </sch:rule>               
        <sch:rule id="Procedure-Activity-Procedure-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:statusCode">
            <sch:assert id="a-1098-32366-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:1098-32366). </sch:assert>
        </sch:rule>
         
        <sch:rule id="Procedure-Activity-Procedure-targetSiteCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:targetSiteCode">
            <sch:assert id="a-1098-16082-error" test="@code">The targetSiteCode, if present, SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-16082). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Activity-Procedure-performer-specimen-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:specimen">
            <sch:assert id="a-1098-7704-error" test="count(cda:specimenRole)=1">The specimen, if present, SHALL contain exactly one [1..1] specimenRole (CONF:1098-7704). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Activity-Procedure-performer-assignedEntity-representedOrganization-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-1098-7737-error" test="count(cda:telecom)=1">The representedOrganization, if present, SHALL contain exactly one [1..1] telecom (CONF:1098-7737).</sch:assert>
            <sch:assert id="a-1098-7736-error" test="count(cda:addr)=1">The representedOrganization, if present, SHALL contain exactly one [1..1] addr (CONF:1098-7736).</sch:assert>
        </sch:rule>   
        
      </sch:pattern>
    
    <sch:pattern id="Procedure-Activity-Procedure-pattern-warnings">
        <sch:rule id="Procedure-Activity-Procedure-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]">
            <sch:assert id="a-1098-7662-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7662). </sch:assert>
            <sch:assert id="a-1098-7683-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-7683). </sch:assert>
            <sch:assert id="a-1098-7718-warning" test="count(cda:performer[count(cda:assignedEntity[count(cda:id) &gt; 0][count(cda:addr) &gt; 0][count(cda:telecom) &gt; 0])=1]) &gt; 0">SHOULD contain zero or more [0..*] performer (CONF:1098-7718) such that it SHALL contain exactly one [1..1] assignedEntity (CONF:1098-7720). This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-7722). This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-7731). This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-7732).</sch:assert>
            <sch:assert id="a-1098-32479-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32479). </sch:assert>
        </sch:rule>
        
        <sch:rule id="Procedure-Activity-Procedure-code-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:code">
            <sch:assert id="a-1098-19203-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19203). </sch:assert>
        </sch:rule>  
 
        <sch:rule id="Procedure-Activity-Procedure-code-originalText-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:code/cda:originalText">
            <sch:assert id="a-1098-19204-warning" test="count(cda:reference)=1">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1098-19204). </sch:assert>
        </sch:rule>  
        <sch:rule id="Procedure-Activity-Procedure-code-originalText-reference-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:code/cda:originalText/cda:reference">
            <sch:assert id="a-1098-19205-warning" test="@value">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1098-19205).</sch:assert>
        </sch:rule>  
        <sch:rule id="Procedure-Activity-Procedure-specimen-specimenRole-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:specimen/cda:specimenRole">
            <sch:assert id="a-1098-7716-warning" test="count(cda:id)&gt;=1">This specimenRole SHOULD contain zero or more [0..*] id (CONF:1098-7716). </sch:assert>
        </sch:rule>
        
        <sch:rule id="Procedure-Activity-Procedure-performer-assignedEntity-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:performer/cda:assignedEntity">
            <sch:assert id="a-1098-7733-warning" test="count(cda:representedOrganization)=1"> This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-7733). </sch:assert>
        </sch:rule>  
        
        <sch:rule id="Procedure-Activity-Procedure-performer-assignedEntity-representedOrganization-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-1098-7734-warning" test="count(cda:id)&gt;=1">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-7734). </sch:assert>
        </sch:rule>   
        
        
    </sch:pattern>
</sch:schema>