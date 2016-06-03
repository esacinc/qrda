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
    
    <sch:pattern id="US-Realm-Person-Name-pattern-errors">
        <sch:rule id="US-Realm-Person-Name-name-errors" context="//* [cda:name[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3']]/cda:recordTarget/cda:patientRole/cda:patient
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:guardianPerson
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:assignedAuthor/cda:assignedPerson
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:dataEnterer/cda:assignedEntity/cda:assignedPerson
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient
            or parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson]]">
            <sch:assert id="a-81-9371-error" test="(cda:given and cda:family) or (count(cda:name/*)=0 and string-length(normalize-space(string(cda:name)))!=0)">The content of name SHALL be either a conformant Patient Name (PTN.US.FIELDED), or a string (CONF:81-9371).</sch:assert>
            <sch:assert id="a-81-9372-error" test="(cda:given and cda:family) or (count(cda:name/*)=0)">The string SHALL NOT contain name parts (CONF:81-9372).</sch:assert>
         </sch:rule>
     </sch:pattern>
    
</sch:schema>