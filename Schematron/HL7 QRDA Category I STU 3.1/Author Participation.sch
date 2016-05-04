<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Author-Participation-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Author-Participation-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Author-Participation-pattern-errors">
        <sch:rule id="Author-Participation-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]">
            <sch:assert id="a-1098-32017-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-32017) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.119" (CONF:1098-32018). </sch:assert>
            <sch:assert id="a-1098-31471-error" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:1098-31471). </sch:assert>
            <sch:assert id="a-1098-31472-error" test="count(cda:assignedAuthor)=1">SHOULD contain zero or one [0..1] state (ValueSet: StateValueSet urn:oid:2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:81-7293).</sch:assert>
        </sch:rule>
        <sch:rule id="Author-Participation-assignedAuthor-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]/cda:assignedAuthor">
            <sch:assert id="a-1098-31473-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:1098-31473).</sch:assert>
            
        </sch:rule>
        
    </sch:pattern>
    
    <sch:pattern id="Author-Participation-pattern-warnings">
        <sch:rule id="Author-Participation-assignedAuthor-warnings" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]/cda:assignedAuthor">
            <sch:assert id="a-1098-31671-warning" test="count(cda:code)=1">This assignedAuthor SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1098-31671). . </sch:assert>
        </sch:rule>
            
    </sch:pattern>
    
</sch:schema>