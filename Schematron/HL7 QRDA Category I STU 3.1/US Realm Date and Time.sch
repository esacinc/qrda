<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="US-Realm-Date-and-Time-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="US-Realm-Date-and-Time-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="US-Realm-Date-and-Time-pattern-errors">
        <sch:rule id="US-Realm-Date-and-Time-effectiveTime-errors" context="cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]] 
            | cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3']]]">
            <sch:assert id="a-81-10127-e-error" test="string-length(@value)&gt;=8">SHALL be precise to the day (CONF:81-10127).</sch:assert>
        </sch:rule>
        <sch:rule id="US-Realm-Date-and-Time-errors" context="cda:time[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author]
            | cda:time[ parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator]">
            <sch:assert id="a-81-10127-t-error" test="string-length(@value)&gt;=8">SHALL be precise to the day (CONF:81-10127).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="US-Realm-Date-and-Time-pattern-warnings">
        <sch:rule id="US-Realm-Date-and-Time-effectiveTime-warnings" context="cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]]">
            <sch:assert id="a-81-10128-e-warning" test="string-length(@value)&gt;=12">SHOULD be precise to the minute (CONF:81-10128).</sch:assert>
            <sch:assert id="a-81-10130-e-warning" test="string-length(@value)&lt;10 or ( string-length(@value)&gt;=10 and (contains(@value,'+') or contains(@value,'-')))">If more precise than day, SHOULD include time-zone offset (CONF:81-10130).</sch:assert>
        </sch:rule>
        <sch:rule id="US-Realm-Date-and-Time-warnings" context="cda:time[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author]
            | cda:time[ parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator]">
            <sch:assert id="a-81-10128-t-warning" test="string-length(@value)&gt;=12">SHOULD be precise to the minute (CONF:81-10128).</sch:assert>
            <sch:assert id="a-81-10130-t-warning" test="string-length(@value)&lt;10 or ( string-length(@value)&gt;=10 and (contains(@value,'+') or contains(@value,'-')))">If more precise than day, SHOULD include time-zone offset (CONF:81-10130).</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>