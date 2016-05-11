<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Product-Instance-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Product-Instance-pattern-warnings" />
    </sch:phase>
    
    <sch:pattern id="Product-Instance-pattern-errors">
        <sch:rule id="Product-Instance-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]">
            <sch:assert id="a-81-7900-error" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7900).</sch:assert>
            <sch:assert id="a-81-7901-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37'])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7901) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.37" (CONF:81-10522). </sch:assert>
            <sch:assert id="a-81-7902-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-7902).</sch:assert>
            <sch:assert id="a-81-7903-error" test="count(cda:playingDevice)=1">SHALL contain exactly one [1..1] playingDevice (CONF:81-7903).</sch:assert>
            <sch:assert id="a-81-7905-error" test="count(cda:scopingEntity)=1">SHALL contain exactly one [1..1] scopingEntity (CONF:81-7905).</sch:assert>
       </sch:rule>
        <sch:rule id="Product-Instance-scopingEntity-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]/cda:scopingEntity">
            <sch:assert id="a-81-7908-error" test="count(cda:id)&gt;=1">This scopingEntity SHALL contain at least one [1..*] id (CONF:81-7908).   </sch:assert>
        </sch:rule>
        
     </sch:pattern>
    
    <sch:pattern id="Product-Instance-pattern-warnings">
         <sch:rule id="Product-Instance-playindDevice-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]/cda:playingDevice">
             <sch:assert id="a-81-16837-warning" test="count(cda:code)=1">This playingDevice SHOULD contain zero or one [0..1] code (CONF:81-16837).  </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
</sch:schema>