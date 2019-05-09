<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
 
    <!--     
        New template  for STU 5.1 - https://tracker.esacinc.com/browse/QRDA-460
        05-09-2019: Changes due to http://www.hl7.org/dstucomments/showdetail_comment.cfm?commentid=1788
                                   http://www.hl7.org/dstucomments/showdetail_comment.cfm?commentid=1783
                                   http://www.hl7.org/dstucomments/showdetail_comment.cfm?commentid=1781
    -->
    
    <sch:phase id="errors">
        <sch:active pattern="Communication_Performed-pattern-errors" />
    </sch:phase>
    
    <sch:pattern id="Communication_Performed-pattern-errors">
        <sch:rule id="Communication_Performed-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.156'][@extension='2018-10-01']]">
            <sch:assert id="a-4388-29160-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4388-29160).</sch:assert>
            <sch:assert id="a-4388-29161-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4388-29161). </sch:assert>
            <sch:assert id="a-4388-29143-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.156'][@extension='2018-10-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:4388-29143) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.156" (CONF:4388-29151) SHALL contain exactly one [1..1] @extension="2018-10-01" (CONF:4388-29152). </sch:assert>
            <sch:assert id="a-4388-29162-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:4388-29162).</sch:assert>
            <!-- Removed a-4388-29159 as it was changed from SHALL to MAY in the IG.  http://www.hl7.org/dstucomments/showdetail_comment.cfm?commentid=1788 -->
            <!-- <sch:assert id="a-4388-29159-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:4388-29159).  </sch:assert> -->
            <sch:assert id="a-4388-29163-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem HL7ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:4388-29163). </sch:assert>
            <sch:assert id="a-4388-29149-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:4388-29149).</sch:assert>
            <!-- Added a-4388-29168 as it was changed from 'MAY' to 'SHALL' in the IG. http://www.hl7.org/dstucomments/showdetail_comment.cfm?commentid=1788 -->
            <!-- Changed typeCode test from RSON to PCRN in  a-4388-29175 per  http://www.hl7.org/dstucomments/showdetail_comment.cfm?commentid=1781 -->
            <sch:assert id="a-4388-29168-error" test="count(cda:entryRelationship[@typeCode='PCRN'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']])=1]) = 1">SHALL contain exactly one [1..1] entryRelationship (CONF:4388-29168) such that it SHALL contain exactly one [1..1] @typeCode="PCRN" Has precondition (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4388-29175)  SHALL contain exactly one [1..1] Reason (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.88:2017-08-01) (CONF:4388-29169). </sch:assert>
        </sch:rule>

        <sch:rule id="Communication_Performed-effectivTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.156'][@extension='2018-10-01']]/cda:effectiveTime">
            <sch:assert id="a-4388-29170-error" test="count(cda:low)=1">The effectiveTime, if present, SHALL contain exactly one [1..1] low (CONF:4388-29170).</sch:assert>
         </sch:rule>	
        
        <sch:rule id="Communication_Performed-participant-IRCP-participantRole-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.156'][@extension='2018-10-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole">
            <sch:assert id="a-4388-29146-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:4388-29146).  </sch:assert>
        </sch:rule>	

        <!-- Remove 4388-29153 and 4388-29154 as directed in http://www.hl7.org/dstucomments/showdetail_comment.cfm?commentid=1783 -->
        <!--
        <sch:rule id="Communication_Performed-participant-IRCP-participantRole-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.156'][@extension='2018-10-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole/cda:code">
            <sch:assert id="a-4388-29153-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:4388-29153). </sch:assert>
            <sch:assert id="a-4388-29154-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:4388-29154). </sch:assert>
        </sch:rule>	
        -->
        
        <sch:rule id="Communication_Performed-participant-AUT-participantRole-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.156'][@extension='2018-10-01']]/cda:participant[@typeCode='AUT']/cda:participantRole">
            <sch:assert id="a-4388-29172-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:4388-29172).  </sch:assert>
        </sch:rule>	
        
        <sch:rule id="Communication_Performed-participant-VIA-participantRole-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.156'][@extension='2018-10-01']]/cda:participant[@typeCode='VIA']/cda:participantRole">
            <sch:assert id="a-4388-29174-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:4388-29174).  </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>