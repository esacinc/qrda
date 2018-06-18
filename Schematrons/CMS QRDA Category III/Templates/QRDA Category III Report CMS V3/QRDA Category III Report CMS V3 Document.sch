<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-432 -->
<!-- JIRA https://tracker.esacinc.com/browse/QRDA-444 -->

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="QRDA_Category_III-template-pattern-errors" />
        <sch:active pattern="QRDA_Category_III_CMS-pattern-errors" />
    </sch:phase>
    
    <!-- Warnings (SHOULD) changed to (MAY) in IG, so no longer needed.  https://tracker.esacinc.com/browse/QRDA-443 -->
    <!--  
    <sch:phase id="warnings">
        <sch:active pattern="QRDA_Category_III_CMS-pattern-warnings" />
    </sch:phase>
    -->
    <sch:pattern id="QRDA_Category_III-template-pattern-errors">
        <sch:rule id="QRDA_Category_III_Report-template-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01']]">
            <sch:assert id="a-CMS_1-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_1) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.2" (CONF:CMS_2).SHALL contain exactly one [1..1] @extension="2018-05-01" (CONF:CMS_3). </sch:assert>
        </sch:rule>   
    </sch:pattern>   
    
    <sch:pattern id="QRDA_Category_III_CMS-pattern-errors">
        <sch:let name="intendedRecipient-Doc" value="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:id/@extension" />
        <sch:rule id="QRDA_Category_III_CMS-errors" context="cda:ClinicalDocument">
           <!-- Implied QRDA Cat III Report V4 -->
            <sch:assert id="a-2233-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2017-06-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2233-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:2233-17209). SHALL contain exactly one [1..1] @extension="2017-06-01" (CONF:2226-21168).</sch:assert> 
            <sch:assert id="a-3338-17238_C01-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode (CONF:3338-17238_C01).</sch:assert>
            <!-- Following already exists in base HL7 IG -->
            <!--      <sch:assert id="a-3338-17239-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:3338-17239).</sch:assert>-->
            <sch:assert id="a-CMS_7-error" test="count(cda:informationRecipient)=1">SHALL contain exactly one [1..1] informationRecipient (CONF:CMS_7).</sch:assert>
            <sch:assert id="a-338-18170_C01-error" test="count(cda:documentationOf)=1">SHALL contain exactly one [1..1] documentationOf (CONF:3338-18170_C01). </sch:assert>
            <!-- Following already exists in base HL7 IG -->
            <!--      <sch:assert id="a-3338-17217-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:3338-17217).</sch:assert>-->
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-confidentialityCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:confidentialityCode">
            <sch:assert id="a-CMS_4-error" test="@code='N'">This confidentialityCode SHALL contain exactly one [1..1] @code="N" Normal (CodeSystem: HL7Confidentiality urn:oid:2.16.840.1.113883.5.25) (CONF:CMS_4). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:languageCode">
            <sch:assert id="a-3338-19669_C01-error" test="@code='en'">This languageCode SHALL contain exactly one [1..1] @code="en" English (CodeSystem: Language urn:oid:2.16.840.1.113883.6.121) (CONF:3338-19669_C01).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:informationRecipient">
            <sch:assert id="a-CMS_8-error" test="count(cda:intendedRecipient)=1">This informationRecipient SHALL contain exactly one [1..1] intendedRecipient (CONF:CMS_8). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-informationRecipient-intendedRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:informationRecipient/cda:intendedRecipient">
            <sch:assert id="a-CMS_9-error" test="count(cda:id)=1">This intendedRecipient SHALL contain exactly one [1..1] id (CONF:CMS_9). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-informationRecipient-intendedRecipient-id-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:informationRecipient/cda:intendedRecipient/cda:id">
            <sch:assert id="a-CMS_10-error" test="@root='2.16.840.1.113883.3.249.7'">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.7" CMS Program (CONF:CMS_10). </sch:assert>
            <sch:assert id="a-CMS_11-error" test="@extension=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.249.14.101']/voc:code/@value">This id SHALL contain exactly one [1..1] @extension, which SHALL be selected from ValueSet QRDA III CMS Program Name urn:oid:2.16.840.1.113883.3.249.14.101 STATIC 2018-05-01 (CONF:CMS_11). </sch:assert>
            <sch:assert id="a-CMS_12-error" test="(@extension='CPCPLUS' and ../../../cda:participant[@typeCode='LOC']) or @extension!='CPCPLUS'">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPCPLUS", then ClinicalDocument/participant/@typeCode="LOC" SHALL be present (CONF:CMS_12).</sch:assert>
            <sch:assert id="a-CMS_13-error" test="(@extension='CPCPLUS' and count(../../../cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-05-01']])=1) or @extension!='CPCPLUS'">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPCPLUS", then QRDA Category III Measure Section – CMS (V3) SHALL be present (CONF:CMS_13).</sch:assert>
            <sch:assert id="a-CMS_14-error" test="(@extension='CPCPLUS' and count(../../../cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:organizer/cda:component/cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25'][@extension='2018-05-01']])=1) or @extension!='CPCPLUS'">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPCPLUS", then Performance Rate for Proportion Measure – CMS (V3) SHALL be present (CONF:CMS_14).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-participant-associatedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:participant/cda:associatedEntity">
            <sch:assert id="a-CMS_18-error" test="@classCode='SDLOC'">This associatedEntity SHALL contain exactly one [1..1] @classCode="SDLOC" Service Delivery Location (CONF:CMS_18).</sch:assert>
            <sch:assert id="a-CMS_19-error" test="count(cda:id)=1">This associatedEntity SHALL contain exactly one [1..1] id (CONF:CMS_19).</sch:assert>
            <sch:assert id="a-CMS_22-error" test="count(cda:code)=1">This associatedEntity SHALL contain exactly one [1..1] code (CONF:CMS_22). </sch:assert>
            <sch:assert id="a-CMS_25-error" test="count(cda:addr)=1">This associatedEntity SHALL contain exactly one [1..1] addr (CONF:CMS_25).  </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-participant-associatedEntity-id-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:participant/cda:associatedEntity/cda:id">
            <sch:assert id="a-CMS_20-error" test="@root='2.16.840.1.113883.3.249.5.1'">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.5.1" CPC Practice Site (CONF:CMS_20). </sch:assert>
            <sch:assert id="a-CMS_21-error" test="count(@extension)=1">This id SHALL contain exactly one [1..1] @extension (CONF:CMS_21). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-participant-associatedEntity-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:participant/cda:associatedEntity/cda:code">
            <sch:assert id="a-CMS_23-error" test="@code='394730007'">his code SHALL contain exactly one [1..1] @code="394730007" Healthcare Related Organization (CONF:CMS_23).  </sch:assert>
            <sch:assert id="a-CMS_24-error" test="count(@codeSystem)=1">This code SHALL contain exactly one [1..1] @codeSystem (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:CMS_24).  </sch:assert>
        </sch:rule>
        
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:documentationOf">
            <sch:assert id="a-3338-18171_C01-error" test="count(cda:serviceEvent)=1">his documentationOf SHALL contain exactly one [1..1] serviceEvent (CONF:3338-18171_C01). </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:documentationOf/cda:serviceEvent">
            <!-- Following already exists in base HL7 IG -->
            <!--            <sch:assert id="a-3338-18173-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:3338-18173).</sch:assert>-->
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
            <!-- Following already exists in base HL7 IG -->
            <!--            <sch:assert id="a-3338-18176-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:3338-18176).</sch:assert>-->
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
            <sch:assert id="a-3338-18177_C01-error" test="count(cda:id[@root='2.16.840.1.113883.4.6'])=1">This assignedEntity SHALL contain exactly one [1..1] id (CONF:3338-18177_C01) such that it  MAY contain zero or one [0..1] @nullFlavor (CONF:CMS_29). SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:3338-18178_C01).  MAY contain zero or one [0..1] @extension (CONF:3338-18247). </sch:assert>
            <sch:assert id="a-3338-18180_C01-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:3338-18180_C01).</sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <!-- <sch:report id="recipient-value" test="1 = 1">The Recipient is <sch:value-of select="$intendedRecipient-Doc"/></sch:report> -->
            <sch:assert id="a-CMS_82-error" test="$intendedRecipient-Doc != 'MIPS_GROUP' or ($intendedRecipient-Doc='MIPS_GROUP' and count(cda:id[@root='2.16.840.1.113883.4.2'][@extension])=1)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_GROUP", then this representedOrganization SHALL contain exactly one 1..1] id such that it, SHALL be the group's TIN (CONF:CMS_82).  </sch:assert>
            <sch:assert id="a-CMS_83-error" test="$intendedRecipient-Doc != 'MIPS_VIRTUALGROUP' or ($intendedRecipient-Doc='MIPS_VIRTUALGROUP' and count(cda:id['2.16.840.1.113883.3.249.5.2'][@extension])=1)">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="MIPS_VIRTUALGROUP", then this representedOrganization SHALL contain exactly one 1..1] idSHALL be the virtual group's Virtual Group Identifier (CONF:CMS_83).  </sch:assert>
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:component">
            <!-- Following already exists in base HL7 IG -->
            <!--            <sch:assert id="a-3338-17235-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:3338-17235).</sch:assert>-->
        </sch:rule>
        <sch:rule id="QRDA_Category_III_CMS-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:component/cda:structuredBody">
            <sch:assert id="a-3338-17281_C01-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']])=1])=0">This structuredBody SHALL NOT contain [0..0] component (CONF:3338-17281_C01) such that it  SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.27.2.2) (CONF:3338-17282). </sch:assert>
            <sch:assert id="a-3338-21394_C01-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'][@extension='2018-05-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.4'][@extension='2017-06-01']])=1])=1 or count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.5'][@extension='2017-06-01']])=1])=1">This structuredBody SHALL contain at least a QRDA Category III Measure Section - CMS (V3), or an Improvement Activity Section - CMS, or a Promoting Interoperability Section (V2) (CONF:3338-21394_C01). </sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <!-- Warnings (SHOULD) changed to (MAY) in IG, so no longer needed.  https://tracker.esacinc.com/browse/QRDA-443 -->
    <!--
    <sch:pattern id="QRDA_Category_III_CMS-pattern-warnings">
        <sch:rule id="QRDA_Category_III_CMS-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'][@extension='2018-05-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
            <sch:assert id="a-3338-18181_C01-warning" test="count(cda:id[@root='2.16.840.1.113883.4.2'][@extension]) &gt; 0">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:3338-18181_C01) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:3338-18182).  SHALL contain exactly one [1..1] @extension (CONF:3338-18190).  </sch:assert>
            <sch:assert id="a-CMS_79-warning" test="count(cda:id[@root='2.16.840.1.113883.3.249.5.2'][@extension]) &gt; 0">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:CMS_79) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.5.2" MIPS Virtual Group (CONF:CMS_80).  SHALL contain exactly one [1..1] @extension (CONF:CMS_81). </sch:assert>
        </sch:rule>
    </sch:pattern>
   -->
</sch:schema>