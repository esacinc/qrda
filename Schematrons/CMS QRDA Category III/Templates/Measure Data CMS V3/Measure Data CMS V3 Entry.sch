<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Measure_data-pattern-errors" />
        <sch:active pattern="Measure_data_CMS-pattern-errors" />
    </sch:phase>
    
    <sch:phase id="warnings">
        <sch:active pattern="Measure_data_CMS-pattern-warnings" />
    </sch:phase>

    <sch:pattern id="Measure_data-pattern-errors">
        <!-- New rule. JIRA https://tracker.esacinc.com/browse/QRDA-444 -->
        <sch:rule id="Measure_data-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-09-01']]">
            <sch:assert id="a-CMS_41-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_41) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.16" (CONF:CMS_42). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_43). </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="Measure_data_CMS-pattern-errors">
         <sch:rule id="Measure_data_CMS-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2018-05-01']]">
             <sch:assert id="a-3259-18141_C01-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'][@extension='2018-05-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:3259-18141_C01) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:3259-18146). SHALL contain exactly one [1..1] Payer Supplemental Data Element - CMS (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.18:2018-05-01) (CONF:3259-18151_C01). </sch:assert>
            <sch:assert id="a-3259-18136_C01-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'][@extension='2016-09-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:3259-18136_C01) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3259-18137). SHALL contain exactly one [1..1] Sex Supplemental Data Element (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.6:2016-09-01) (CONF:3259-18138). </sch:assert>
            <sch:assert id="a-3259-18140_C01-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'][@extension='2016-09-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:3259-18140_C01) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3259-18150). SHALL contain exactly one [1..1] Race Supplemental Data Element (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.8:2016-09-01) (CONF:3259-18150). </sch:assert>
            <sch:assert id="a-3259-18139_C01-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'][@extension='2016-09-01']])=1])&gt;=1">SHALL contain at least one [1..*] entryRelationship (CONF:3259-18139_C01) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3259-18144). SHALL contain exactly one [1..1] Ethnicity Supplemental Data Element (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.7:2016-09-01) (CONF:3259-18149). </sch:assert>
        </sch:rule>
     </sch:pattern>
    
    <sch:pattern id="Measure_data_CMS-pattern-warnings">
        <sch:rule id="Measure_data_CMS-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'][@extension='2018-05-01']]">
            <sch:assert id="a-CMS_86-warning" test="count(cda:entryRelationship[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:CMS_86) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:CMS_87). SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_88).  </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>