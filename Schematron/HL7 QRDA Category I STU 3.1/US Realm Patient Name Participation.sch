<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="US-Realm-Patient-Name-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="US-Realm-Patient-Name-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="US-Realm-Patient-Name-pattern-errors">
        <sch:rule id="US-Realm-Patient-Name-errors" context="cda:name[cda:templateId[@root='2.16.840.1.113883.10.20.22.5.1']]">
            <sch:assert id="a-81-7159-error" test="count(cda:family[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] family (CONF:81-7159).</sch:assert>
            <sch:assert id="a-81-7157-error" test="count(cda:given[@xsi:type='ST']) &gt;=1">SHALL contain at least one [1..*] given (CONF:81-7157).</sch:assert>
         </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="US-Realm-Patient-Name-pattern-warnings">
    </sch:pattern>
    
</sch:schema>