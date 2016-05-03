<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="US-Realm-Person-Name-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="US-Realm-Person-Name-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="US-Realm-Person-Name-pattern-errors">
        <sch:rule id="US-Realm-Person-Name-errors" context="cda:name[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.1.1']]">
            <sch:assert id="a-81-9368" test="count(cda:name)=1">SHALL contain exactly one [1..1] name (CONF:81-9368).</sch:assert>
         </sch:rule>
        
        <sch:rule id="US-Realm-Person-Name-name-errors" context="cda:name[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.1.1']]/cda:name">
            <sch:assert id="a-81-9371" test="(cda:given and cda:family) or (count(cda:name/*)=0 and string-length(normalize-space(string(cda:name)))!=0)">The content of name SHALL be either a conformant Patient Name (PTN.US.FIELDED), or a string (CONF:81-9371).</sch:assert>
            <sch:assert id="a-81-9372" test="(cda:given and cda:family) or (count(cda:name/*)=0)">The string SHALL NOT contain name parts (CONF:81-9372).</sch:assert>
         </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="US-Realm-Person-Name-pattern-warnings">
    </sch:pattern>
    
</sch:schema>