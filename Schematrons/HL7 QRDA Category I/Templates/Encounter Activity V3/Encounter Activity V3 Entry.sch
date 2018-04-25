<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Activity-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Encounter-Activity-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Activity-pattern-errors">
        <sch:rule id="Encounter-Activity-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]">
            <sch:assert id="a-1198-8710-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8710). </sch:assert>
            <sch:assert id="a-1198-8711-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8711). </sch:assert>
            <sch:assert id="a-1198-8712-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8712) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.49" (CONF:1198-26353). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32546).  </sch:assert>
            <sch:assert id="a-1198-8713-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1198-8713).  </sch:assert>
            <sch:assert id="a-1198-8714-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-8714). </sch:assert>
            <sch:assert id="a-1198-8715-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-8715).  </sch:assert>
        </sch:rule> 
        <sch:rule id="Encounter-Activity-code-originalText-reference-value-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code/cda:originalText/cda:reference">
            <sch:assert id="a-1198-15972-error" test="starts-with(@value,'#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1198-15972).  </sch:assert>
        </sch:rule>       
        <sch:rule id="Encounter-Activity-performer-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:performer">
            <sch:assert id="a-1198-8726-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-8726). </sch:assert>
         </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="Encounter-Activity-pattern-warnings">
        <sch:rule id="Encounter-Activity-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]">
            <sch:assert id="a-1198-8738-warning" test="count(cda:participant[@typeCode='LOC'][count(cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']])=1])&gt;=1">SHOULD contain zero or more [0..*] participant (CONF:1198-8738) such that it SHALL contain exactly one [1..1] @typeCode="LOC" Location (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8740).  SHALL contain exactly one [1..1] Service Delivery Location (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.32) (CONF:1198-14903).   </sch:assert>
        </sch:rule>         
        <sch:rule id="Encounter-Activity-code-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code">
            <sch:assert id="a-1198-8719-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1198-8719).  </sch:assert>
        </sch:rule>
        <sch:rule id="Encounter-Activity-code-originalText-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code/cda:originalText">
            <sch:assert id="a-1198-15970-warning" test="count(cda:reference)=1">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1198-15970). </sch:assert>
        </sch:rule>
        <sch:rule id="Encounter-Activity-code-originalText-reference-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code/cda:originalText/cda:reference">
            <sch:assert id="a-1198-15971-warning" test="@value">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1198-15971). </sch:assert>
        </sch:rule>
        <sch:rule id="Encounter-Activity-dischargeDispositionCode-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/sdtc:dischargeDispositionCode">
            <sch:assert id="a-1198-32177-warning" test="count(@code)=1">This sdtc:dischargeDispositionCode SHOULD contain exactly [1..1] @code, which SHOULD be selected from ValueSet 2.16.840.1.113883.3.88.12.80.33 NUBC UB-04 FL17-Patient Status (code system 2.16.840.1.113883.6.301.5) DYNAMIC or, if access to NUBC is unavailable, from CodeSystem 2.16.840.1.113883.12.112 HL7 Discharge Disposition (CONF:1198-32177).  </sch:assert>
            <sch:assert id="a-1198-32377-warning" test="count(@codeSystem)=1">This sdtc:dischargeDispositionCode SHOULD contain exactly [1..1] @codeSystem, which SHOULD be either CodeSystem: NUBC 2.16.840.1.113883.6.301.5 OR CodeSystem: HL7 Discharge Disposition 2.16.840.1.113883.12.112 (CONF:1198-32377). </sch:assert>
        </sch:rule>        
    </sch:pattern>
    
</sch:schema>