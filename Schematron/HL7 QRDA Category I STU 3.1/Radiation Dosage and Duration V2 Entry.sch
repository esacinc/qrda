<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Radiation-Dosage-And-Duration-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Radiation-Dosage-And-Duration-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Radiation-Dosage-And-Duration-pattern-errors">
        <sch:rule id="Radiation-Dosage-And-Duration-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]">
            <sch:assert id="a-1140-13276-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-13276).</sch:assert>
            <sch:assert id="a-1140-13277-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-13277).</sch:assert>
            <sch:assert id="a-1140-13278-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91'][@extension='2014-12-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1140-13278) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.91" (CONF:1140-13279). SHALL contain exactly one [1..1] @extension="2014-12-01" (CONF:1140-27335). </sch:assert>
            <sch:assert id="a-1140-13281-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1140-13281).</sch:assert>
            <sch:assert id="a-1140-13282-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1140-13282).</sch:assert>
            <sch:assert id="a-1140-13284-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1140-13284).</sch:assert>
        </sch:rule>
        <sch:rule id="Radiation-Dosage-And-Duration-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]/cda:code">
            <sch:assert id="a-1140-27568-error" test="@code='77304-4'">This code SHALL contain exactly one [1..1] @code="77304-4" Radiation dose (CONF:1140-27568).</sch:assert>
            <sch:assert id="a-1140-27569-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1140-27569).</sch:assert>
        </sch:rule>
        <sch:rule id="Radiation-Dosage-And-Duration-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]/cda:statusCode">
            <sch:assert id="a-1140-13285-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1140-13285).</sch:assert>
        </sch:rule>
        <sch:rule id="Radiation-Dosage-And-Duration-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]/cda:effectiveTime">
            <sch:assert id="a-1140-27319-error" test="cda:width or (cda:low and cda:high) or (cda:low and cda:width)or (cda:width and cda:high)">One of the following combinations SHALL be present: @width, @low and @high, @low and @width or @width and @high. @width by itself shall only be used when no start or end time is known. For example, when one knows that the duration of radiation needs to be 30 minutes, but one may not yet know when the start time will be eg. in a Procedure Order (CONF:1140-27319).</sch:assert>
        </sch:rule>               
            
    </sch:pattern>
    
    <sch:pattern id="Radiation-Dosage-And-Duration-pattern-warnings">
        <sch:rule id="Radiation-Dosage-And-Duration-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]">
            <sch:assert id="a-1140-13286-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1140-13286).  </sch:assert>
            <sch:assert id="a-1140-13287-warning" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:1140-13287). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
</sch:schema>