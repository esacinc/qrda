<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!--

THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL LANTANA CONSULTING GROUP LLC, OR ANY OF THEIR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
Schematron generated from Trifolia on 2/9/2016

2/10/2016
Edited the context for rules that included the test for extension in the rules and the extension
in the context. Removed the extension from the context

Manually added a section of rules that were missing from the generated schematron
a-2226-18301, a-2226-18302, a-2226-18303, a-2226-18305, a-2226-18381, a-2226-18308, a-2226-18309, a-2226-21167

-->
<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:phase id="errors">
    <sch:active pattern="p-DOCUMENT-TEMPLATE" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-errors" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-warnings" />
    <sch:active pattern="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-warnings" />
  </sch:phase>
  <sch:pattern id="p-DOCUMENT-TEMPLATE">
    <sch:rule id="r-errors-DOC-abstract" abstract="true">
      <sch:assert id="a-IG-2226-DOC" test="cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1' and @extension = '2016-02-01']">The document must contain at least 1 of the document level templates for this schematron to be applicable.</sch:assert>
    </sch:rule>
    <sch:rule id="r-errors-DOC" context="cda:ClinicalDocument">
      <sch:extends rule="r-errors-DOC-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract" abstract="true">
      <sch:assert id="a-23-3269" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:23-3269).</sch:assert>
      <sch:assert id="a-23-3270" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:23-3270).</sch:assert>
      <sch:assert id="a-23-3272" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:23-3272).</sch:assert>
      <sch:assert id="a-23-3273" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:23-3273).</sch:assert>
      <sch:assert id="a-23-3274" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:23-3274).</sch:assert>
      <sch:assert id="a-23-3275" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:23-3275).</sch:assert>
      <sch:assert id="a-23-18098-c" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:23-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:23-18099).</sch:assert>
      <sch:assert id="a-23-26549" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:23-26549).</sch:assert>
      <sch:assert id="a-23-26550" test="cda:code[@code='252116004']">This code SHALL contain exactly one [1..1] @code="252116004" Observation Parameters (CONF:23-26550).</sch:assert>
      <sch:assert id="a-23-26551" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:23-26551).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" abstract="true">
      <sch:assert id="a-23-3277" test="count(cda:entry[count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:23-3277) such that it SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:23-17496).</sch:assert>
      <sch:assert id="a-23-4142" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='reporting parameters'])=1">SHALL contain exactly one [1..1] title="Reporting Parameters" (CONF:23-4142).</sch:assert>
      <sch:assert id="a-23-4143" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:23-4143).</sch:assert>
      <sch:assert id="a-23-14611-c" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:23-14611) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.1" (CONF:23-14612).</sch:assert>
      <sch:assert id="a-23-18191-c" test="count(cda:code[@code='55187-9'][@codeSystem='2.16.840.1.113883.6.1'])">SHALL contain exactly one [1..1] code (CONF:23-18191).</sch:assert>
      <sch:assert id="a-23-19229" test="cda:code[@code='55187-9']">This code SHALL contain exactly one [1..1] @code="55187-9" Reporting Parameters (CONF:23-19229).</sch:assert>
      <sch:assert id="a-23-26552" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:23-26552).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-3277-branch-3277-errors-abstract" abstract="true">
      <sch:assert id="a-23-3278-branch-3277" test="@typeCode='DRIV'">SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:23-3278).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-3277-branch-3277-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]/cda:entry[cda:act]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-3277-branch-3277-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" abstract="true">
      <sch:assert id="a-67-12798" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-12798).</sch:assert>
      <sch:assert id="a-67-12799" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:67-12799).</sch:assert>
      <sch:assert id="a-67-12800" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:67-12800).</sch:assert>
      <sch:assert id="a-67-12801" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:67-12802).</sch:assert>
      <sch:assert id="a-67-13003" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-13003).</sch:assert>
      <sch:assert id="a-67-19230" test="cda:code[@code='55186-1']">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CONF:67-19230).</sch:assert>
      <sch:assert id="a-67-27012" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27012).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" abstract="true">
      <sch:assert id="a-67-12979" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12979).</sch:assert>
      <sch:assert id="a-67-12980" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12980).</sch:assert>
      <sch:assert id="a-67-12981" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12981).</sch:assert>
      <sch:assert id="a-67-12982" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:67-12982) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12983). SHALL contain exactly one [1..1] externalDocument (CONF:67-12984).</sch:assert>
      <sch:assert id="a-67-26992" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-26992).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" />
      <sch:assert id="a-67-19532" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-19532) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:67-19533).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract" abstract="true">
      <sch:assert id="a-67-12985-branch-12982" test="cda:externalDocument[count(cda:id[@root]) &gt; 0]">This externalDocument SHALL contain at least one [1..*] id (CONF:67-12985) such that it SHALL contain exactly one [1..1] @root (CONF:67-12986).</sch:assert>
      <sch:assert id="a-67-12998-branch-12982-c" test="not(testable)">This text is the title of the eMeasure (CONF:67-12998).</sch:assert>
      <sch:assert id="a-67-19534-branch-12982" test="cda:externalDocument[@classCode='DOC']">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-19534).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors-abstract" abstract="true">
      <sch:assert id="a-67-27008-branch-12985-c" test="not(testable)">This ID references an ID of the Quality Measure (CONF:67-27008).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument][cda:id[@root]]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors-abstract" abstract="true">
      <sch:assert id="a-77-17563" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17563).</sch:assert>
      <sch:assert id="a-77-17564" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17564).</sch:assert>
      <sch:assert id="a-77-17565" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-17565) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.3" (CONF:77-18095).</sch:assert>
      <sch:assert id="a-77-17566" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17566).</sch:assert>
      <sch:assert id="a-77-17567" test="count(cda:value[@xsi:type='INT'])=1">SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-17567).</sch:assert>
      <sch:assert id="a-77-17568" test="cda:value[@xsi:type='INT'][@value]">This value SHALL contain exactly one [1..1] @value (CONF:77-17568).</sch:assert>
      <sch:assert id="a-77-18393" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18393).</sch:assert>
      <sch:assert id="a-77-18394" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value[@xsi:type='INT'])=1]">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-18394).</sch:assert>
      <sch:assert id="a-77-19508" test="cda:code[@code='MSRAGG']">This code SHALL contain exactly one [1..1] @code="MSRAGG" rate aggregation (CONF:77-19508).</sch:assert>
      <sch:assert id="a-77-19509" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode (CONF:77-19509).</sch:assert>
      <sch:assert id="a-77-19510" test="cda:methodCode[@code='COUNT']">This methodCode SHALL contain exactly one [1..1] @code="COUNT" Count (CONF:77-19510).</sch:assert>
      <sch:assert id="a-77-21160" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21160).</sch:assert>
      <sch:assert id="a-77-21161" test="cda:methodCode[@codeSystem='2.16.840.1.113883.5.84']">This methodCode SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.84" (CodeSystem: ObservationMethod urn:oid:2.16.840.1.113883.5.84) (CONF:77-21161).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors-abstract" abstract="true">
      <sch:assert id="a-77-17569" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17569).</sch:assert>
      <sch:assert id="a-77-17570" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17570).</sch:assert>
      <sch:assert id="a-77-17571" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17571).</sch:assert>
      <sch:assert id="a-77-17572" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:77-17572).</sch:assert>
      <sch:assert id="a-77-18096" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18096) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.2" (CONF:77-18097).</sch:assert>
      <sch:assert id="a-77-18242" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode, which SHALL be selected from ValueSet ObservationMethodAggregate urn:oid:2.16.840.1.113883.1.11.20450 DYNAMIC (CONF:77-18242).</sch:assert>
      <sch:assert id="a-77-18243" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18243).</sch:assert>
      <sch:assert id="a-77-18244" test="cda:reference[count(cda:externalObservation)=1]">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18244).</sch:assert>
      <sch:assert id="a-77-18245" test="cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18245).</sch:assert>
      <sch:assert id="a-77-18390" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18390).</sch:assert>
      <sch:assert id="a-77-18391" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value)=1]">This observationRange SHALL contain exactly one [1..1] value (CONF:77-18391).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors-abstract" abstract="true">
      <sch:assert id="a-77-17575" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17575).</sch:assert>
      <sch:assert id="a-77-17576" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17576).</sch:assert>
      <sch:assert id="a-77-17577" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17577).</sch:assert>
      <sch:assert id="a-77-17578" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:77-17578).</sch:assert>
      <sch:assert id="a-77-17579" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-17579).</sch:assert>
      <sch:assert id="a-77-17581" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:77-17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-17583). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-17584).</sch:assert>
      <sch:assert id="a-77-18093" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18093) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.4" (CONF:77-18094).</sch:assert>
      <sch:assert id="a-77-18201" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18201).</sch:assert>
      <sch:assert id="a-77-18204" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18204).</sch:assert>
      <sch:assert id="a-77-18205" test="cda:reference[@typeCode='REFR']">This reference SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18205).</sch:assert>
      <sch:assert id="a-77-18206" test="cda:reference[count(cda:externalObservation)=1]">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18206).</sch:assert>
      <sch:assert id="a-77-18207" test="cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18207).</sch:assert>
      <sch:assert id="a-77-18259-c" test="not(testable)">If this Reporting Stratum references an eMeasure, and the value of externalObservation/id equals the reference stratification id defined in the eMeasure, then this value SHALL be the same as the contents of the observation/code element in the eMeasure that is defined along with the observation/id element (CONF:77-18259).</sch:assert>
      <sch:assert id="a-77-21169" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21169).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors-abstract" abstract="true">
      <sch:assert id="a-77-18100" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18100).</sch:assert>
      <sch:assert id="a-77-18101" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18101).</sch:assert>
      <sch:assert id="a-77-18102" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18102) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18103). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18104). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18105).</sch:assert>
      <sch:assert id="a-77-18209" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18209).</sch:assert>
      <sch:assert id="a-77-18210" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18210).</sch:assert>
      <sch:assert id="a-77-18211" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18211) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.10" (CONF:77-18212).</sch:assert>
      <sch:assert id="a-77-18213" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18213).</sch:assert>
      <sch:assert id="a-77-18214" test="cda:code[@code='184102003']">This code SHALL contain exactly one [1..1] @code="184102003" Patient postal code (CONF:77-18214).</sch:assert>
      <sch:assert id="a-77-18215" test="count(cda:value[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] value with @xsi:type="ST" (CONF:77-18215).</sch:assert>
      <sch:assert id="a-77-21166" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21166).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors-abstract" abstract="true">
      <sch:assert id="a-77-18112" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18112).</sch:assert>
      <sch:assert id="a-77-18113" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18113).</sch:assert>
      <sch:assert id="a-77-18114" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18116). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18117).</sch:assert>
      <sch:assert id="a-77-18223" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18223).</sch:assert>
      <sch:assert id="a-77-18224" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18224).</sch:assert>
      <sch:assert id="a-77-18225" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:77-18226).</sch:assert>
      <sch:assert id="a-77-18227" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18227).</sch:assert>
      <sch:assert id="a-77-18228" test="cda:code[@code='103579009']">This code SHALL contain exactly one [1..1] @code="103579009" Race (CONF:77-18228).</sch:assert>
      <sch:assert id="a-77-18229" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Race urn:oid:2.16.840.1.114222.4.11.836 DYNAMIC (CONF:77-18229).</sch:assert>
      <sch:assert id="a-77-21167" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21167).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors-abstract" abstract="true">
      <sch:assert id="a-77-18118" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18118).</sch:assert>
      <sch:assert id="a-77-18119" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18119).</sch:assert>
      <sch:assert id="a-77-18120" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18120) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18121). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18122). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18123).</sch:assert>
      <sch:assert id="a-77-18216" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18216).</sch:assert>
      <sch:assert id="a-77-18217" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18217).</sch:assert>
      <sch:assert id="a-77-18220" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18220).</sch:assert>
      <sch:assert id="a-77-18221" test="cda:code[@code='364699009']">This code SHALL contain exactly one [1..1] @code="364699009" Ethnic Group (CONF:77-18221).</sch:assert>
      <sch:assert id="a-77-18222" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:77-18222).</sch:assert>
      <sch:assert id="a-77-21164" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors-abstract" />
      <sch:assert id="a-77-18218" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18218) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.7" (CONF:77-18219).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors-abstract" abstract="true">
      <sch:assert id="a-77-18312" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18312).</sch:assert>
      <sch:assert id="a-77-18314" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:77-18314).</sch:assert>
      <sch:assert id="a-77-18369" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.11" (CONF:77-18370).</sch:assert>
      <sch:assert id="a-77-21154" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-21154).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" />
      <sch:assert id="a-77-18323" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.2" (CONF:77-18324).</sch:assert>
      <sch:assert id="a-77-18325" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:77-18325) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18427). SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:77-18428).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors-abstract" abstract="true">
      <sch:assert id="a-77-18395" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18395).</sch:assert>
      <sch:assert id="a-77-18396" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18396).</sch:assert>
      <sch:assert id="a-77-18397" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18397).</sch:assert>
      <sch:assert id="a-77-18398" test="cda:code[@code='72510-1']">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:77-18398).</sch:assert>
      <sch:assert id="a-77-18399" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18399).</sch:assert>
      <sch:assert id="a-77-18401" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18401).</sch:assert>
      <sch:assert id="a-77-18402" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value[@xsi:type='REAL'])=1]">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18402).</sch:assert>
      <sch:assert id="a-77-18421" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18421).</sch:assert>
      <sch:assert id="a-77-18422" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18422).</sch:assert>
      <sch:assert id="a-77-19649" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:77-19650).</sch:assert>
      <sch:assert id="a-77-19652" test="not(cda:reference) or cda:reference[@typeCode='REFR']">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:77-19652).</sch:assert>
      <sch:assert id="a-77-19653" test="not(cda:reference) or cda:reference[count(cda:externalObservation)=1]">The reference, if present, SHALL contain exactly one [1..1] externalObservation (CONF:77-19653).</sch:assert>
      <sch:assert id="a-77-19654" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[@classCode]">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:77-19654).</sch:assert>
      <sch:assert id="a-77-19655-c" test="not(tested)">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-19655).</sch:assert>
      <sch:assert id="a-77-19656" test="not(cda:reference/cda:externalObservation/cda:id) or cda:reference/cda:externalObservation/cda:id[@root]">This id SHALL contain exactly one [1..1] @root (CONF:77-19656).</sch:assert>
      <sch:assert id="a-77-19657" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[count(cda:code)=1]">This externalObservation SHALL contain exactly one [1..1] code (CONF:77-19657).</sch:assert>
      <sch:assert id="a-77-19658" test="not(cda:reference/cda:externalObservation/cda:code) or cda:reference/cda:externalObservation/cda:code[@code='NUMER']">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:77-19658).</sch:assert>
      <sch:assert id="a-77-21165" test="not(cda:reference/cda:externalObservation/cda:code) or cda:reference/cda:externalObservation/cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21165).</sch:assert>
      <sch:assert id="a-77-21170" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21170).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors-abstract" abstract="true">
      <sch:assert id="a-77-18411" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18411).</sch:assert>
      <sch:assert id="a-77-18412" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18412).</sch:assert>
      <sch:assert id="a-77-18413" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18413).</sch:assert>
      <sch:assert id="a-77-18414" test="cda:code[@code='72509-3']">This code SHALL contain exactly one [1..1] @code="72509-3" Reporting Rate (CONF:77-18414).</sch:assert>
      <sch:assert id="a-77-18415" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18415).</sch:assert>
      <sch:assert id="a-77-18417" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18417).</sch:assert>
      <sch:assert id="a-77-18418" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value[@xsi:type='REAL'])=1]">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18418).</sch:assert>
      <sch:assert id="a-77-18419" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18419).</sch:assert>
      <sch:assert id="a-77-18420" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18420).</sch:assert>
      <sch:assert id="a-77-21157" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-21157) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.15" (CONF:77-21158).</sch:assert>
      <sch:assert id="a-77-21168" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21168).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2226-18108" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18108) such that it SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-18111). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18109). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18110).</sch:assert>
      <sch:assert id="a-2226-18106" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-18106).</sch:assert>
      <sch:assert id="a-2226-18237" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-18237) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:2226-18238). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21157).</sch:assert>
      <sch:assert id="a-2226-18107" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18107).</sch:assert>
      <sch:assert id="a-2226-18250" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:2226-18250).</sch:assert>
      <sch:assert id="a-2226-21155" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-21155).</sch:assert>
      <sch:assert id="a-2226-21156" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-21156).</sch:assert>
      <sch:assert id="a-2226-21158" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-21158).</sch:assert>
      <sch:assert id="a-2226-21159" test="cda:code[@code='48768-6']">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source  (CONF:2226-21159).</sch:assert>
      <sch:assert id="a-2226-21165" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21165).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2226-18126" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18126) such that it SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-18129). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18127). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18128).</sch:assert>
      <sch:assert id="a-2226-18124" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-18124).</sch:assert>
      <sch:assert id="a-2226-18232" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-18232) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.6" (CONF:2226-18233). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21160).</sch:assert>
      <sch:assert id="a-2226-18234" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-18234).</sch:assert>
      <sch:assert id="a-2226-18125" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18125).</sch:assert>
      <sch:assert id="a-2226-18230" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-18230).</sch:assert>
      <sch:assert id="a-2226-18231" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-18231).</sch:assert>
      <sch:assert id="a-2226-18235" test="cda:code[@code='184100006']">This code SHALL contain exactly one [1..1] @code="184100006" Patient sex (CONF:2226-18235).</sch:assert>
      <sch:assert id="a-2226-18236" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet ONC Administrative Sex urn:oid:2.16.840.1.113762.1.4.1 DYNAMIC (CONF:2226-18236).</sch:assert>
      <sch:assert id="a-2226-21163" test="cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:2226-21163).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2226-17619" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-17619) such that it SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-17620). SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:2226-17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-17911).</sch:assert>
      <sch:assert id="a-2226-17617" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-17617).</sch:assert>
      <sch:assert id="a-2226-17912" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:2226-17913). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21161).</sch:assert>
      <sch:assert id="a-2226-18199" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18199).</sch:assert>
      <sch:assert id="a-2226-18239" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2226-18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2226-18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:2226-18241).</sch:assert>
      <sch:assert id="a-2226-17615" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17615).</sch:assert>
      <sch:assert id="a-2226-17616" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17616).</sch:assert>
      <sch:assert id="a-2226-18198" test="cda:code[@code='ASSERTION']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2226-18198).</sch:assert>
      <sch:assert id="a-2226-17618" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2226-17618).</sch:assert>
      <sch:assert id="a-2226-19555" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19555).</sch:assert>
      <sch:assert id="a-2226-21162" test="cda:value[@xsi:type='CD'][@code]">This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet PopulationInclusionObservationType urn:oid:2.16.840.1.113883.1.11.20476 DYNAMIC (CONF:2226-21162).</sch:assert>
      <sch:assert id="a-2226-21164" test="cda:code[@codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2226-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-errors-abstract" abstract="true">
      <sch:assert id="a-2226-17208" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:2226-17209). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21168).</sch:assert>
      <sch:assert id="a-2226-17210" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-17210).</sch:assert>
      <sch:assert id="a-2226-17212" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:2226-17212).</sch:assert>
      <sch:assert id="a-2226-17232" test="cda:recordTarget[count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1]">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:2226-17232) such that it SHALL contain exactly one [1..1] id (CONF:2226-17233). This id SHALL contain exactly one [1..1] @nullFlavor="NA" (CONF:2226-17234).</sch:assert>
      <sch:assert id="a-2226-17213" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:2226-17213).</sch:assert>
      <sch:assert id="a-2226-17214" test="cda:custodian[count(cda:assignedCustodian)=1]">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:2226-17214).</sch:assert>
      <sch:assert id="a-2226-17215" test="cda:custodian/cda:assignedCustodian[count(cda:representedCustodianOrganization)=1]">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:2226-17215).</sch:assert>
      <sch:assert id="a-2226-17217" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:2226-17217).</sch:assert>
      <sch:assert id="a-2226-17235" test="cda:component[count(cda:structuredBody)=1]">This component SHALL contain exactly one [1..1] structuredBody (CONF:2226-17235).</sch:assert>
      <sch:assert id="a-2226-17281" test="cda:component/cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:2226-17281) such that it SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.27.2.2) (CONF:2226-17282).</sch:assert>
      <sch:assert id="a-2226-17283" test="cda:component/cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1' and @extension = '2016-02-01']])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:2226-17283) such that it SHALL contain exactly one [1..1] QRDA Category III Measure Section (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.2.1:2016-02-01) (CONF:2226-17301).</sch:assert>
      <sch:assert id="a-2226-17225" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:2226-17225).</sch:assert>
      <sch:assert id="a-2226-18168" test="cda:legalAuthenticator[count(cda:signatureCode)=1]">This legalAuthenticator SHALL contain exactly one [1..1] signatureCode (CONF:2226-18168).</sch:assert>
      <sch:assert id="a-2226-19670" test="cda:legalAuthenticator[count(cda:assignedEntity)=1]">This legalAuthenticator SHALL contain exactly one [1..1] assignedEntity (CONF:2226-19670).</sch:assert>
      <sch:assert id="a-2226-17226" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:2226-17226).</sch:assert>
      <sch:assert id="a-2226-17236" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2226-17236).</sch:assert>
      <sch:assert id="a-2226-17237" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2226-17237).</sch:assert>
      <sch:assert id="a-2226-17239" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:2226-17239).</sch:assert>
      <sch:assert id="a-2226-18156-c" test="count(cda:author[count(cda:assignedAuthor[count(cda:representedOrganization[count(cda:name) &gt; 0])=1])=1][count(cda:time)=1]) = count(cda:author)">SHALL contain at least one [1..*] author (CONF:2226-18156) such that it SHALL contain exactly one [1..1] assignedAuthor (CONF:2226-18157). This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:2226-18163). This representedOrganization SHALL contain at least one [1..*] name (CONF:2226-18265). SHALL contain exactly one [1..1] time (CONF:2226-18158).</sch:assert>
      <sch:assert id="a-2226-18301" test="not(cda:participant) or cda:participant[@typeCode='DEV']">SHALL contain exactly one [1..1] @typeCode="DEV" device (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2226-18301)</sch:assert>
      <sch:assert id="a-2226-18302" test="not(cda:participant) or cda:participant[count(cda:associatedEntity)=1]">SHALL contain exactly one [1..1] associatedEntity (CONF:2226-18302)</sch:assert>
      <sch:assert id="a-2226-18303" test="not(cda:participant/cda:associatedEntity) or cda:participant/cda:associatedEntity[@classCode='RGPR']">This associatedEntity SHALL contain exactly one [1..1] @classCode="RGPR" regulated product (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-18303)</sch:assert>
      <sch:assert id="a-2226-20954" test="not(cda:participant/cda:associatedEntity) or cda:participant/cda:associatedEntity[count(cda:id)>0]">This associatedEntity SHALL contain at least one [1..*] id (CONF:2226-20954)</sch:assert>
      <sch:assert id="a-2226-18305" test="not(cda:participant/cda:associatedEntity/cda:id) or cda:participant/cda:associatedEntity/cda:id[@root='2.16.840.1.113883.3.2074.1']">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.2074.1" Office of the National Coordinator Certification Number (CONF:2226-18305)</sch:assert>
      <sch:assert id="a-2226-18381" test="not(cda:participant/cda:associatedEntity/cda:id) or cda:participant/cda:associatedEntity/cda:id[@root='2.16.840.1.113883.3.249.21']">SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.21" CMS Certified EHR Security Code Identifier (CONF:2226-18381)</sch:assert>
      <sch:assert id="a-2226-18308" test="not(cda:participant/cda:associatedEntity) or cda:participant/cda:associatedEntity[count(cda:code)=1]">This associatedEntity SHALL contain exactly one [1..1] code (CONF:2226-18308)</sch:assert>
      <sch:assert id="a-2226-18309" test="not(cda:participant/cda:associatedEntity/cda:code) or cda:participant/cda:associatedEntity/cda:code[@code='129465004']">This code SHALL contain exactly one [1..1] @code="129465004" medical record, device (CONF:2226-18309)</sch:assert>
      <sch:assert id="a-2226-21167" test="not(cda:participant/cda:associatedEntity/cda:code) or cda:participant/cda:associatedEntity/cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2226-21167)</sch:assert>
      <sch:assert id="a-2226-18171" test="not(cda:documentationOf) or cda:documentationOf[count(cda:serviceEvent)=1]">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:2226-18171).</sch:assert>
      <sch:assert id="a-2226-18173" test="not(cda:documentationOf/cda:serviceEvent) or cda:documentationOf/cda:serviceEvent[count(cda:performer) &gt; 0]">This serviceEvent SHALL contain at least one [1..*] performer (CONF:2226-18173).</sch:assert>
      <sch:assert id="a-2226-18176" test="not(cda:documentationOf/cda:serviceEvent/cda:performer) or cda:documentationOf/cda:serviceEvent/cda:performer[count(cda:assignedEntity)=1]">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:2226-18176).</sch:assert>
      <sch:assert id="a-2226-18177" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:id)=1]">This assignedEntity SHALL contain exactly one [1..1] id (CONF:2226-18177) such that it</sch:assert>
      <sch:assert id="a-2226-18180" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:representedOrganization)=1]">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:2226-18180).</sch:assert>
      <sch:assert id="a-2226-18186" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:2226-18186).</sch:assert>
      <sch:assert id="a-2226-18360" test="not(cda:authorization) or cda:authorization[count(cda:consent)=1]">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:2226-18360).</sch:assert>
      <sch:assert id="a-2226-18363" test="not(cda:authorization/cda:consent) or cda:authorization/cda:consent[count(cda:code)=1]">This consent SHALL contain exactly one [1..1] code (CONF:2226-18363).</sch:assert>
      <sch:assert id="a-2226-18364" test="not(cda:authorization/cda:consent) or cda:authorization/cda:consent[count(cda:statusCode)=1]">This consent SHALL contain exactly one [1..1] statusCode (CONF:2226-18364).</sch:assert>
      <sch:assert id="a-2226-19549" test="cda:code[@code='55184-6']">This code SHALL contain exactly one [1..1] @code="55184-6" Quality Reporting Document Architecture Calculated Summary Report (CONF:2226-19549).</sch:assert>
      <sch:assert id="a-2226-21166" test="cda:code[@codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21166).</sch:assert>
      <sch:assert id="a-2226-17211" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:2226-17211).</sch:assert>
      <sch:assert id="a-2226-18165" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:id) &gt; 0]">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:2226-18165).</sch:assert>
      <sch:assert id="a-2226-18167" test="cda:legalAuthenticator[count(cda:time)=1]">This legalAuthenticator SHALL contain exactly one [1..1] time (CONF:2226-18167).</sch:assert>
      <sch:assert id="a-2226-18169" test="cda:legalAuthenticator/cda:signatureCode[@code='S']">This signatureCode SHALL contain exactly one [1..1] @code="S" (CONF:2226-18169).</sch:assert>
      <sch:assert id="a-2226-19672" test="not(cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization) or cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization[count(cda:id) &gt; 0]">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:2226-19672).</sch:assert>
      <sch:assert id="a-2226-17227" test="cda:realmCode[@code='US']">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:2226-17227).</sch:assert>
      <sch:assert id="a-2226-18189-c" test="cda:effectiveTime[string-length(@value)&gt;=8]">The content SHALL be a conformant US Realm Date and Time (DTM.US.FIELDED) (2.16.840.1.113883.10.20.22.5.4) (CONF:2226-18189).</sch:assert>
      <sch:assert id="a-2226-17238" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC (CONF:2226-17238).</sch:assert>
      <sch:assert id="a-2226-19669" test="cda:languageCode[@code]">This languageCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:2226-19669).</sch:assert>
      <sch:assert id="a-2226-19667-c" test="cda:author/cda:assignedAuthor[count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1]">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:2226-19667).</sch:assert>
      <sch:assert id="a-2226-18172" test="not(cda:documentationOf/cda:serviceEvent) or cda:documentationOf/cda:serviceEvent[@classCode='PCPR']">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-18172).</sch:assert>
      <sch:assert id="a-2226-18174" test="not(cda:documentationOf/cda:serviceEvent/cda:performer) or cda:documentationOf/cda:serviceEvent/cda:performer[@typeCode='PRF']">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2226-18174).</sch:assert>
      <sch:assert id="a-2226-19474" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:id) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] id (CONF:2226-19474).</sch:assert>
      <sch:assert id="a-2226-18187" test="cda:typeId[@root='2.16.840.1.113883.1.3']">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:2226-18187).</sch:assert>
      <sch:assert id="a-2226-18188" test="cda:typeId[@extension='POCD_HD000040']">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:2226-18188).</sch:assert>
      <sch:assert id="a-2226-18361" test="not(cda:authorization/cda:consent) or cda:authorization/cda:consent[count(cda:id)=1]">This consent SHALL contain exactly one [1..1] id (CONF:2226-18361).</sch:assert>
      <sch:assert id="a-2226-19550" test="not(cda:authorization/cda:consent/cda:code) or cda:authorization/cda:consent/cda:code[@code='425691002']">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CONF:2226-19550).</sch:assert>
      <sch:assert id="a-2226-19551" test="not(cda:authorization/cda:consent/cda:statusCode) or cda:authorization/cda:consent/cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19551).</sch:assert>
      <sch:assert id="a-2226-21172" test="not(cda:authorization/cda:consent/cda:code) or cda:authorization/cda:consent/cda:code[@codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2226-21172).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" />
      <sch:assert id="a-2226-17906" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1' and @extension = '2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:2226-17906) such that it SHALL contain exactly one [1..1] Measure Reference and Results (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.1:2016-02-01) (CONF:2226-17907).</sch:assert>
      <sch:assert id="a-2226-17284" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:2226-17285). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21171).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-errors">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" />
      <sch:assert id="a-2226-17889" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-17889).</sch:assert>
      <sch:assert id="a-2226-17890" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2226-17890) such that it SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17892). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2226-19548). SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:2226-17891).</sch:assert>
      <sch:assert id="a-2226-17908" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:2226-17909). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21170).</sch:assert>
      <sch:assert id="a-2226-18354-c" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation">SHALL contain exactly one [1..1] externalObservation (CONF:2226-18354). This externalObservation SHALL contain at least one [1..*] id (CONF:2226-18355). This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19554). This externalObservation SHALL contain exactly one [1..1] text (CONF:2226-18358).</sch:assert>
      <sch:assert id="a-2226-18355-c" test="count(cda:reference/cda:externalObservation) = count(cda:reference/cda:externalObservation[cda:id])">This externalObservation SHALL contain at least one [1..*] id (CONF:2226-18355).</sch:assert>
      <sch:assert id="a-2226-18357-c" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1']]">This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19554).</sch:assert>
      <sch:assert id="a-2226-18358-c" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[count(cda:text)=1]">This externalObservation SHALL contain exactly one [1..1] text (CONF:2226-18358).</sch:assert>
      <sch:assert id="a-2226-18425" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5' and @extension = '2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:2226-18425) such that it SHALL contain exactly one [1..1] Measure Data (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.5:2016-02-01) (CONF:2226-18426).</sch:assert>
      <sch:assert id="a-2226-17887" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17887).</sch:assert>
      <sch:assert id="a-2226-17888" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17888).</sch:assert>
      <sch:assert id="a-2226-19552" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19552).</sch:assert>
      <sch:assert id="a-2226-18356-c" test="not(testable)">This id SHALL equal the id of the corresponding measure set definition within the eMeasure (CONF:2226-18356).</sch:assert>
      <sch:assert id="a-2226-19554-c" test="not(tested)">This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19554).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-17890-branch-17890-errors-abstract" abstract="true">
      <sch:assert id="a-2226-18192-branch-17890" test="cda:externalDocument[count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1]">This externalDocument SHALL contain exactly one [1..1] id (CONF:2226-18192) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:2226-18193). SHALL contain exactly one [1..1] @extension (CONF:2226-21169).</sch:assert>
      <sch:assert id="a-2226-19553-branch-17890" test="not(cda:externalDocument/cda:code) or cda:externalDocument/cda:code[@code='57024-2' and @codeSystem='2.16.840.1.113883.6.1']">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19553).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-17890-branch-17890-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference[cda:externalDocument[@classCode='DOC']][@typeCode='REFR']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-17890-branch-17890-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract" abstract="true">
      <sch:assert id="a-67-12997-branch-12982" test="cda:externalDocument[count(cda:text)=1]">This externalDocument SHOULD contain zero or one [0..1] text (CONF:67-12997).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings-abstract" abstract="true">
      <sch:assert id="a-77-17580" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:77-17580).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert id="a-2226-18250-v" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:2226-18250).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.9-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.6-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert id="a-2226-17618-v" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2226-17618).</sch:assert>
      <sch:assert id="a-2226-21162-v" test="cda:value[@xsi:type='CD'][@code]">This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet PopulationInclusionObservationType urn:oid:2.16.840.1.113883.1.11.20476 DYNAMIC (CONF:2226-21162).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-18239-branch-18239-warnings-abstract" abstract="true">
      <sch:assert id="a-2226-18258-branch-18239-c" test="not(testable)">If this reference is to an eMeasure, this id SHALL equal the id defined in the corresponding eMeasure population criteria section (CONF:2226-18258).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-18239-branch-18239-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:reference[cda:externalObservation[cda:id]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.5-2016-02-01-18239-branch-18239-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-warnings-abstract" abstract="true">
      <sch:assert id="a-2226-18166" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:name)=1]">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:2226-18166).</sch:assert>
      <sch:assert id="a-2226-19673" test="not(cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization) or cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization[count(cda:name)=1]">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:2226-19673).</sch:assert>
      <sch:assert id="a-2226-19659" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:name) &gt; 0]">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:2226-19659).</sch:assert>
      <sch:assert id="a-2226-18260" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:2226-18260).</sch:assert>
      <sch:assert id="a-2226-17238-v" test="count(cda:confidentialityCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value])=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC (CONF:2226-17238).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.1.1-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.2.1-2016-02-01-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-warnings">
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" />
      <sch:assert id="a-2226-18353-c" test="not(cda:reference[cda:externalObservation[cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1']]]) or (count(cda:reference[cda:externalObservation[cda:id][cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1']][cda:text]])=1)">SHOULD contain exactly one [1..1] reference (CONF:2226-18353) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2226-18354). This externalObservation SHALL contain at least one [1..*] id (CONF:2226-18355). This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19554). This externalObservation SHALL contain exactly one [1..1] text (CONF:2226-18358).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-17890-branch-17890-warnings-abstract" abstract="true">
      <sch:assert id="a-2226-17896-branch-17890" test="cda:externalDocument[count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @nullFlavor])=1]">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-17896).</sch:assert>
      <sch:assert id="a-2226-17897-branch-17890" test="cda:externalDocument[count(cda:text)=1]">This externalDocument SHOULD contain zero or one [0..1] text (CONF:2226-17897).</sch:assert>
      <sch:assert id="a-2226-17900-branch-17890-c" test="not(testable)">If this reference is to an eMeasure, this setId SHALL equal the QualityMeasureDocument/setId which is the eMeasure version neutral id (CONF:2226-17900).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-17890-branch-17890-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference[cda:externalDocument[@classCode='DOC']][@typeCode='REFR']">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-17890-branch-17890-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-18353-branch-18353-warnings-abstract" abstract="true">
      <sch:assert id="a-2226-18359-branch-18353-c" test="not(testable)">This text SHOULD be the title of the corresponding measure set (CONF:2226-18359).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-18353-branch-18353-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference[cda:externalObservation[cda:id][cda:code[@code='55185-3']][cda:text]]">
      <sch:extends rule="r-urn-hl7ii-2.16.840.1.113883.10.20.27.3.1-2016-02-01-18353-branch-18353-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
</sch:schema>