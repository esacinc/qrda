<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
	<sch:ns prefix="cda" uri="urn:hl7-org:v3" />
	
	<sch:phase id="errors">
		<sch:active pattern="Medication_Information_V2-pattern-errors" />
	</sch:phase>

	<sch:pattern id="Medication_Information_V2-pattern-errors">
		<sch:rule id="Medication_Information_V2-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23']]">
			<sch:assert id="a-1098-7408-error" test="@classCode='MANU'">
				SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-7408).			
			</sch:assert>
			<sch:assert id="a-1098-7409-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09']) = 1">
				SHALL contain exactly one [1..1] templateId (CONF:1098-7409) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.23" (CONF:1098-10506).
					SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32579).
			</sch:assert>
			<sch:assert id="a-1098-7411-error" test="count(cda:manufacturedMaterial) = 1">
				SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-7411).
			</sch:assert>
		</sch:rule>

		<sch:rule id="Medication_Information_V2-manufacturedMaterial-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23']]/cda:manufacturedMaterial">
			<sch:assert id="a-1098-7412-error" test="count(cda:code) = 1">
				This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Medication Clinical Drug urn:oid:2.16.840.1.113762.1.4.1010.4 DYNAMIC (CONF:1098-7412).
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>