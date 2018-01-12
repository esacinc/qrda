<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Procedure-Activity-Act-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Procedure-Activity-Act-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Procedure-Activity-Act-pattern-errors">
        <sch:rule id="Procedure-Activity-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]">
            <sch:assert id="a-1098-8289-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8289).</sch:assert>
            <sch:assert id="a-1098-8290-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-8290).</sch:assert>
            <sch:assert id="a-1098-8291-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8291) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.12" (CONF:1098-10519). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32505).</sch:assert>
            <sch:assert id="a-1098-8292-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8292).</sch:assert>
            <sch:assert id="a-1098-8293-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-8293).</sch:assert>
            <sch:assert id="a-1098-8298-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8298).</sch:assert>
            <sch:assert id="a-1098-8299-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-8299).</sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Activity-Act-code-originalText-reference-value-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:code/cda:originalText/cda:reference[@value]">
            <sch:assert id="a-1098-19189-error" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19189).</sch:assert>
        </sch:rule>               
        <sch:rule id="Procedure-Activity-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:statusCode">
            <sch:assert id="a-1098-32364-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:1098-32364). </sch:assert>
        </sch:rule>               
        <sch:rule id="Procedure-Activity-Act-performer-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer">
            <sch:assert id="a-1098-8302-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-8302). </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
            <sch:assert id="a-1098-8303-error" test="count(cda:id)&gt;=1">This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-8303).  </sch:assert>
            <sch:assert id="a-1098-8304-error" test="count(cda:addr)&gt;=1">This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-8304).  </sch:assert>
            <sch:assert id="a-1098-8305-error" test="count(cda:telecom)&gt;=1">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-8305).  </sch:assert>
        </sch:rule>
        <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-representedOrganization-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-1098-8309-error" test="count(cda:addr)&gt;=1">The representedOrganization, if present, SHALL contain at least one [1..*] addr (CONF:1098-8309). </sch:assert>
            <sch:assert id="a-1098-8310-error" test="count(cda:telecom)&gt;=1">The representedOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:1098-8310).  </sch:assert>
        </sch:rule>       
    </sch:pattern>
    
    <sch:pattern id="Procedure-Activity-Act-pattern-warnings">
        <sch:rule id="Procedure-Activity-Act-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]">
            <sch:assert id="a-1098-8301-warning" test="count(cda:performer)&gt;=1">SHOULD contain zero or more [0..*] performer (CONF:1098-8301). </sch:assert>
            <sch:assert id="a-1098-32477-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32477).  </sch:assert>           
        </sch:rule>
        <sch:rule id="Procedure-Activity-Act-code-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:code">
            <sch:assert id="a-1098-19186-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19186).</sch:assert>
        </sch:rule>        
        <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
            <sch:assert id="a-1098-8306-warning" test="count(cda:representedOrganization)=1">This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-8306).  </sch:assert>
        </sch:rule>  
        <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-representedOrganization-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-1098-8307-warning" test="count(cda:id)&gt;=1">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-8307).</sch:assert>
        </sch:rule>          
    </sch:pattern>
    
</sch:schema>