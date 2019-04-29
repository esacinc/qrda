<?xml version="1.0" encoding="UTF-8"?>

<!-- JIRA https://tracker.esacinc.com/browse/QRDA-444 -->

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="Reporting-Parameters-Act-template-pattern-errors" />
        <sch:active pattern="Reporting-Parameters-Act-CMS-pattern-errors" />
    </sch:phase>

    <sch:pattern id="Reporting-Parameters-Act-template-pattern-errors">
        <sch:rule id="Reporting-Parameters-Act-template-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
            <sch:assert id="a-CMS_0044-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8.1'][@extension='2016-03-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_0044) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8.1" (CONF:CMS_0045) SHALL contain exactly one [1..1] @extension="2016-03-01" (CONF:CMS_0046) </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="Reporting-Parameters-Act-CMS-pattern-errors">
        <!-- Empty rule removed 04-29-2019 -->
        <!--
         <sch:rule id="Reporting-Parameters-Act-CMS-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8.1'][@extension='2016-03-01']]">
         </sch:rule>
        -->
        <sch:rule id="Reporting-Parameters-Act-CMS-effectiveTime-low-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8.1'][@extension='2016-03-01']]/cda:effectiveTime/cda:low">
            <sch:assert id="a-CMS_0048-error" test="@value">This low SHALL contain exactly one [1..1] @value (CONF:CMS_0048).</sch:assert>
            <sch:assert id="a-CMS_0027-error" test="string-length(@value)&gt;=8">SHALL be precise to day (CONF:CMS_0027).</sch:assert>
        </sch:rule>
        <sch:rule id="Reporting-Parameters-Act-CMS-effectiveTime-high-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8.1'][@extension='2016-03-01']]/cda:effectiveTime/cda:high">
            <sch:assert id="a-CMS_0050-error" test="@value">This high SHALL contain exactly one [1..1] @value (CONF:CMS_0050).</sch:assert>
            <sch:assert id="a-CMS_0028-error" test="string-length(@value)&gt;=8">SHALL be precise to day (CONF:CMS_0028).</sch:assert>
        </sch:rule>
     </sch:pattern>
</sch:schema>