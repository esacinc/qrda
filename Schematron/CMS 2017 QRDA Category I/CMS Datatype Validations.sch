<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
    <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
    <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
    <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
    <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
    
    <sch:phase id="errors">
        <sch:active pattern="p-validate_CD_CE-errors" />
        <sch:active pattern="p-validate_BL-errors" />
        <sch:active pattern="p-validate_CS-errors" />
        <sch:active pattern="p-validate_II-errors" />
        <sch:active pattern="p-validate_PQ-errors" />
        <sch:active pattern="p-validate_ST-errors" />
        <sch:active pattern="p-validate_REAL-errors" />
        <sch:active pattern="p-validate_INT-errors" />
        <sch:active pattern="p-validate_NPI_format-errors" />
        <sch:active pattern="p-validate_TIN_format-errors" />
        <sch:active pattern="p-validate_TS-errors" />
    </sch:phase>
     
    <sch:pattern id="p-validate_CD_CE-errors" >
        <sch:rule id="r-validate_CD_CE-errors" context="//cda:code|cda:value[@xsi:type='CD']|cda:value[@xsi:type='CE']|cda:administrationUnitCode|cda:administrativeGenderCode|cda:awarenessCode|cda:confidentialityCode|cda:dischargeDispositionCode|cda:ethnicGroupCode|cda:functionCode|cda:interpretationCode|cda:maritalStatusCode|cda:methodCode|cda:modeCode|cda:priorityCode|cda:proficiencyLevelCode|cda:RaceCode|cda:religiousAffiliationCode|cda:routeCode|cda:standardIndustryClassCode">
            <sch:assert id="a-validate_CD_CE-c-error" test="(parent::cda:regionOfInterest) or ((@code or @nullFlavor or (@codeSystem and @nullFlavor='OTH')) and not(@code and @nullFlavor) and not(@codeSystem and @nullFlavor!='OTH'))">
                Data types of CD or CE SHALL have either @code or @nullFlavor or both (@codeSystem and @nullFlavor="OTH") but SHALL NOT have both @code and @nullFlavor and SHALL NOT have @codeSystem and @nullFlavor not equal to "OTH" (Rule: validate_CD_CE)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_BL-errors">
        <sch:rule id="r-validate_BL-errors" context="//cda:value[@xsi:type='BL']|cda:contextConductionInd|inversionInd|negationInd|independentInd|seperatableInd|preferenceInd">
            <sch:assert id="a-validate_BL-c-error" test="(@value or @nullFlavor) and not(@value and @nullFlavor)">
                Data types of BL SHALL have either @value or @nullFlavor but SHALL NOT have both @value and @nullFlavor (Rule: validate_BL)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_CS-errors">
        <sch:rule id="r-validate_CS-errors" context="//cda:value[@xsi:type='CS']|cda:regionOfInterest/cda:code|cda:languageCode|cda:realmCode">
            <sch:assert id="a-validate_CS-c-error" test="(@code or @nullFlavor) and not (@code and @nullFlavor)">
                Data types of CS SHALL have either @code or @nullFlavor but SHALL NOT have both @code and @nullFlavor (Rule: validate_CS)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_II-errors">
        <sch:rule id="r-validate_II-errors" context="//cda:value[@xsi:type='II']|cda:id|cda:setId|cda:templateId">
            <sch:assert id="a-validate_II-c-error" test="(@root or @nullFlavor or (@root and @nullFlavor) or (@root and @extension)) and not (@root and @extension and @nullFlavor)">
                Data types of II SHALL have either @root or @nullFlavor or (@root and @nullFlavor) or (@root and @extension) but SHALL NOT have all three of (@root and @extension and @nullFlavor) (Rule: validate_II)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_PQ-errors">
        <sch:rule id="r-validate_PQ-errors" context="//cda:value[@xsi:type='PQ']|cda:quantity">
            <sch:assert id="a-validate_PQ-c-error" test="((@value and @unit) or @nullFlavor) and not (@value and @nullFlavor) and not(@unit and @nullFlavor) and not(not(@value) and @unit)">
                Data types of PQ SHALL have either @value or @nullFlavor but SHALL NOT have both @value and @nullFlavor. If @value is present then @unit SHALL be present but @unit SHALL NOT be present if @value is not present. (Rule: validate_PQ)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_ST-errors">
        <sch:rule id="r-validate_ST-errors" context="//cda:value[@xsi:type='ST']|cda:title|cda:lotNumberText|cda:derivationExpr">
            <sch:assert id="a-validate_ST-c-error" test="string-length()&gt;=1 or @nullFlavor">
                Data types of ST SHALL either not be empty or have @nullFlavor. (Rule: validate_ST)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_REAL-errors">
        <sch:rule id="r-validate_REAL-errors" context="//cda:value[@xsi:type='REAL']">
            <sch:assert id="a-validate_REAL-c-error" test="(@value or @nullFlavor) and not (@value and @nullFlavor)">
                Data types of REAL SHALL NOT have both @value and @nullFlavor. (Rule: validate_REAL)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_INT-errors">
        <sch:rule id="r-validate_INT-errors" context="//cda:value[@xsi:type='INT']|cda:sequenceNumber|cda:versionNumber">
            <sch:assert id="a-validate_INT-c-error" test="(@value or @nullFlavor) and not (@value and @nullFlavor)">
                Data types of INT SHALL NOT have both @value and @nullFlavor. (Rule: validate_INT)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_NPI_format-errors">
        <sch:rule id="r-validate_NPI_format-errors" context="//cda:id[@root='2.16.840.1.113883.4.6']">
            <sch:let name="s" value="normalize-space(@extension)" />
            <sch:let name="n" value="string-length($s)" />
            <sch:let name="sum" value="24 + (number(substring($s, $n - 1, 1))*2) mod 10 + floor(number(substring($s, $n - 1,1))*2 div 10) + number(substring($s, $n - 2, 1)) +(number(substring($s, $n - 3, 1))*2) mod 10 + floor(number(substring($s, $n - 3,1))*2 div 10) + number(substring($s, $n - 4, 1)) + (number(substring($s, $n - 5, 1))*2) mod 10 + floor(number(substring($s, $n - 5,1))*2 div 10) + number(substring($s, $n - 6, 1)) + (number(substring($s, $n - 7, 1))*2) mod 10 + floor(number(substring($s, $n - 7,1))*2 div 10) + number(substring($s, $n - 8, 1)) + (number(substring($s, $n - 9, 1))*2) mod 10 + floor(number(substring($s, $n - 9,1))*2 div 10)" />
            <sch:assert id="a-CMS_0110-error" test="not(@extension) or $n = 10">The NPI should have 10 digits. (CONF: CMS_0110)</sch:assert>
            <sch:assert id="a-CMS_0111-error" test="not(@extension) or number($s)=$s">The NPI should be composed of all digits. (CONF: CMS_0111)</sch:assert>
            <sch:assert id="a-CMS_0112-error" test="not(@extension) or number(substring($s, $n, 1)) = (10 - ($sum mod 10)) mod 10">
                The NPI should have a correct checksum, using the Luhn algorithm. (CONF: CMS_0112)
            </sch:assert>
            <sch:assert id="a-CMS_0113-error" test="count(@extension|@nullFlavor)=1">The NPI should have @extension or @nullFlavor, but not both. (CONF: CMS_0113)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_TIN_format-errors">
        <sch:rule id="r-validate_TIN_format-errors-abstract" context="//cda:id[@root='2.16.840.1.113883.4.2']">
            <sch:assert id="a-CMS_0114-error" test="not(@extension) or ((number(@extension)=@extension) and string-length(@extension)=9)">
                When a Tax Identification Number is used, the provided TIN must be in valid format (9 decimal digits).  (CONF: CMS_0114)</sch:assert>
            <sch:assert id="a-CMS_0115-error" test="count(@extension|@nullFlavor)=1">The TIN SHALL have either @extension or @nullFlavor, but not both. (CONF: CMS_0115)</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern id="p-validate_TS-errors">
        <sch:rule id="r-validate_TS-errors-abstract" context="//cda:birthTime | //cda:time | //cda:effectiveTime | //cda:time/cda:low | //cda:time/cda:high | //cda:effectiveTime/cda:low | //cda:effectiveTime/cda:high">
            <sch:assert id="a-validate_TS-c-error" test="count(@value | @nullFlavor)&lt;2">
                Data types of TS SHALL have either @value or @nullFlavor but SHALL NOT have @value and @nullFlavor. (Rule: validate_TS)</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>