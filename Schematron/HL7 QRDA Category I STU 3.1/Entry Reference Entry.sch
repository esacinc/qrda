<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Entry-Reference-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Entry-Reference-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Entry-Reference-pattern-errors">
        <sch:rule id="Entry-Reference-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122']]">
            <sch:assert id="a-1098-31485" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31485). </sch:assert>
            <sch:assert id="a-1098-31486" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31486 </sch:assert>
            <sch:assert id="a-1098-31487" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-31487) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.122" (CONF:1098-31488). </sch:assert>
            <sch:assert id="a-1098-31489" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1098-31489).  </sch:assert>
            <sch:assert id="a-1098-31490" test="count(cda:code) =1">SHALL contain exactly one [1..1] code (CONF:1098-31490). </sch:assert>
            <sch:assert id="a-1098-31498" test="count(cda:statusCode) =1">SHALL contain exactly one [1..1] code (CONF:1098-31498). </sch:assert>
         </sch:rule>
        
        <sch:rule id="Entry-Reference-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122']]/cda:code">
            <sch:assert id="a-1098-31491" test="@nullFlavor='NP'">This code SHALL contain exactly one [1..1] @nullFlavor="NP" Not Present (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1098-31491).  </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    <sch:pattern id="Entry-Reference-pattern-warnings">
    </sch:pattern>
    
</sch:schema>