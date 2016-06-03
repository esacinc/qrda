<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Result-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Result-pattern-errors">
        <sch:rule id="Result-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]">
            <sch:assert id="a-2228-7323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-11672) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.87" (CONF:2228-11673). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27035). </sch:assert>
            <sch:assert id="a-2228-27658-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-27658). </sch:assert>
            <sch:assert id="a-2228-16701-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:2228-16701).  </sch:assert>
            <sch:assert id="a-2228-16702-error" test="count(cda:value[@xsi:type='PQ'])=0 or count(cda:value[@xsi:type='PQ'][@unit])=1">If xsi:type=PQ, then @units shall be drawn from Unified Code for Units of Measure (UCUM) 2.16.840.1.113883.6.8 code system. Additional constraint is dependent on criteria in the corresponding eMeasure (CONF:2228-16702).</sch:assert>
        </sch:rule>
        <sch:rule id="Result-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]/cda:code">
            <sch:assert id="a-2228-27659-error" test="@sdtc:valueSet">This code SHALL contain exactly one [1..1] @sdtc:valueSet (CONF:2228-27659).  </sch:assert>
         </sch:rule>               
      </sch:pattern>
    

</sch:schema>