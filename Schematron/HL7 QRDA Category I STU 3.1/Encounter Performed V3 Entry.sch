<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Encounter-Performed-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Encounter-Performed-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Encounter-Performed-pattern-errors">
        <sch:rule id="Encounter-Performed-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]">
            <sch:assert id="a-2228-27532" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-27532). </sch:assert>
            <sch:assert id="a-2228-27533" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-27533).  </sch:assert>
            <sch:assert id="a-2228-11861" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11861) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.23" (CONF:2228-11862).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-26552).   </sch:assert>
            <sch:assert id="a-2228-27624" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27624). </sch:assert>
            <sch:assert id="a-2228-11874" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2228-11874). </sch:assert>
            <sch:assert id="a-2228-11876" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2228-11876). </sch:assert>
        </sch:rule>
        
        <sch:rule id="Encounter-Performed-code-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]/cda:code">
            <sch:assert id="a-2228-27625" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27625). </sch:assert>
        </sch:rule>

        <sch:rule id="Encounter-Performed-effectiveTime-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]/cda:effectiveTime">
            <sch:assert id="a-2228-11877" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:2228-11877).  </sch:assert>
            <sch:assert id="a-2228-11878" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:2228-11878).  </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    <sch:pattern id="Encounter-Performed-pattern-warnings">
    </sch:pattern>
    
</sch:schema>