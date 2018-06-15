<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Improvement_Activity_Section-pattern-errors" /> 
        <sch:active pattern="Improvement_Activity_Section_CMS-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Improvement_Activity_Section-pattern-errors">
         <sch:rule id="Improvement_Activity-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2017-06-01']]">
            <sch:assert id="a-3377-711342-error" test="count(cda:templateId[@root='2.16.840.1.113883.3.249.20.2.1'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3377-711342) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.20.2.1" (CONF:CMS_70). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_76). </sch:assert>
        </sch:rule>

    </sch:pattern>
    
    <sch:pattern id="Improvement_Activity_Section_CMS-pattern-errors">
        <sch:let name="intendedRecipient-IA" value="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:id/@extension" /> 
         <sch:rule id="Improvement_Activity_Section_CMS-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.3.249.20.2.1'][@extension='2018-05-01']]">
            <!-- <sch:assert id="a-3377-711342-error" test="count(cda:templateId[@root='2.16.840.1.113883.3.249.20.2.1'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3377-711342) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.20.2.1" (CONF:CMS_70). SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_76). </sch:assert> -->
            
            <sch:assert id="a-3259-21181-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2018-05-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:3259-21181) such that it SHALL contain exactly one [1..1] Improvement Activity Performed Measure Reference and Results - CMS (identifier: urn:hl7ii:2.16.840.1.113883.3.249.20.3.1:2018-05-01) (CONF:3259-21436_C01). </sch:assert>
            <sch:assert id="a-CMS_77-error" test="$intendedRecipient-IA != 'MIPS_INDIV'   or ($intendedRecipient-IA='MIPS_INDIV' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_INDIV", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_77). </sch:assert>
            <sch:assert id="a-CMS_78-error" test="$intendedRecipient-IA != 'MIPS_GROUP'   or ($intendedRecipient-IA='MIPS_GROUP' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_GROUP", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_78). </sch:assert>
            <sch:assert id="a-CMS_84-error" test="$intendedRecipient-IA != 'MIPS_VIRTUALGROUP' or ($intendedRecipient-IA='MIPS_VIRTUALGROUP' and count(cda:entry[cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]])=0)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_VIRTUALGROUP", then SHALL NOT contain [0..0] entry Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:CMS_84). </sch:assert>
        </sch:rule>
        
    </sch:pattern>
</sch:schema>