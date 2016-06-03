<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Communication-From-Provider-To-Provider-V3-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Communication-From-Provider-To-Provider-V3-pattern-errors">
        <sch:rule id="Communication-From-Provider-To-Provider-V3-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]">
            <sch:assert id="a-2228-11816-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-11816). </sch:assert>
            <sch:assert id="a-2228-11817-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-11817). </sch:assert>
            <sch:assert id="a-2228-11818-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11818) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.4" (CONF:2228-11819). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27285).</sch:assert>
            <sch:assert id="a-2228-11821-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-11821).</sch:assert>
            <sch:assert id="a-2228-26950-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-26950).</sch:assert>
            <sch:assert id="a-2228-11822-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2228-11822). </sch:assert>
            <sch:assert id="a-2228-11823-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11823).</sch:assert>
            <sch:assert id="a-2228-11827-error" test="count(cda:participant[@typeCode='IRCP'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:code[@code='158965000'][@codeSystem='2.16.840.1.113883.6.96'])=1])=1])=1"> SHALL contain exactly one [1..1] participant (CONF:2228-11827) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11828) SHALL contain exactly one [1..1] participantRole (CONF:2228-11829). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12096). This participantRole SHALL contain exactly one [1..1] code (CONF:2228-11830). This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:2228-26951). This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26952).    </sch:assert> 
            <sch:assert id="a-2228-11837-error" test="count(cda:participant[@typeCode='AUT'] [count(cda:participantRole[@classCode='ASSIGNED'][count(cda:code[@code='158965000'][@codeSystem='2.16.840.1.113883.6.96'])=1])=1])=1"> SHALL contain exactly one [1..1] participant (CONF:2228-11837) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:2228-11838) SHALL contain exactly one [1..1] participantRole (CONF:2228-11839). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:2228-12097). This participantRole SHALL contain exactly one [1..1] code (CONF:2228-12103). This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:2228-26953). This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2228-26954).    </sch:assert> 
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Provider-V3-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]/cda:code">
            <sch:assert id="a-2228-27581-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27581).</sch:assert>
        </sch:rule>
        <sch:rule id="Communication-From-Provider-To-Provider-V3-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]/cda:effectiveTime">
            <sch:assert id="a-2228-27547-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-27547). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>