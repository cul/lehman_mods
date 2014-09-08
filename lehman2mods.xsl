<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:mods="http://www.loc.gov/mods/v3" exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 1, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> terry</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//doc"/>
    </xsl:template>
    <xsl:template match="doc">
        <xsl:message select="field[@name = 'document_id']"/>
        <xsl:variable name="dir" select="substring(tokenize(field[@name = 'document_id'], '_')[3], 1, 3)"/>
        <xsl:message select="$dir"/>
        <xsl:result-document encoding="utf-8" href="mods/{$dir}/{field[@name = 'document_id']}_mods.xml">
            <mods:mods xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
                <mods:identifier type="local">
                    <xsl:value-of select="field[@name = 'document_id']"/>
                </mods:identifier>
                <mods:name authority="naf">
                    <mods:namePart>
                        <xsl:text>Lehman, Herbert H. (Herbert Henry), 1878-1963</xsl:text>
                    </mods:namePart>
                    <mods:role>
                        <mods:roleTerm authority="marcrelator" type="code">
                            <xsl:text>crp</xsl:text>
                        </mods:roleTerm>
                        <mods:roleTerm type="text">
                            <xsl:text>Correspondent</xsl:text>
                        </mods:roleTerm>
                    </mods:role>
                </mods:name>
                <mods:name>
                    <mods:namePart>
                        <xsl:value-of select="child::field[@name = 'file_unittitle']"/>
                    </mods:namePart>
                    <mods:role>
                        <mods:roleTerm type="code" authority="marcorg">
                            <xsl:text>crp</xsl:text>
                        </mods:roleTerm>
                        <mods:roleTerm type="text" authority="marcorg">
                            <xsl:text>Correspondent</xsl:text>
                        </mods:roleTerm>
                    </mods:role>
                </mods:name>
                <mods:titleInfo supplied="yes">
                    <mods:title>
                        <xsl:value-of
                            select="upper-case(substring(child::field[@name = 'genreform1'], 1, 1))"/>
                        <xsl:value-of
                            select="lower-case(substring(child::field[@name = 'genreform1'], 2))"/>
                        <xsl:if test="not(field[@name = 'genreform1']/text())">Document</xsl:if>
                        <xsl:text> : </xsl:text>
                        <xsl:value-of select="field[@name = 'file_unitdate_display']"/>
                        <xsl:if test="not(field[@name = 'file_unitdate_display']/text())">n.d.</xsl:if>
                    </mods:title>
                </mods:titleInfo>
                <mods:physicalDescription>
                    <mods:extent unit="page">
                        <xsl:value-of select="field[@name = 'pages']"/>
                    </mods:extent>
                    <mods:form authority="gmgpc">
                        <xsl:text>correspondence</xsl:text>
                    </mods:form>
                    <mods:digitalOrigin>
                        <xsl:text>reformatted digital</xsl:text>
                    </mods:digitalOrigin>
                    <mods:reformattingQuality>
                        <xsl:text>preservation</xsl:text>
                    </mods:reformattingQuality>
                </mods:physicalDescription>
                <xsl:apply-templates select="field[@name = 'file_unitdate_display']" mode="dateCreated"/>
                <mods:typeOfResource>
                    <xsl:text>text</xsl:text>
                </mods:typeOfResource>
                <mods:typeOfResource>
                    <xsl:text>still image</xsl:text>
                </mods:typeOfResource>
                <xsl:apply-templates select="field[@name = 'file_unitdate']"/>
                <mods:language>
                    <mods:languageTerm authority="iso639-2b">
                        <xsl:text>eng</xsl:text>
                    </mods:languageTerm>
                </mods:language>
                <mods:subject>
                    <mods:name authority="naf">
                        <mods:namePart>
                            <xsl:text>Lehman, Herbert H. (Herbert Henry), 1878-1963</xsl:text>
                        </mods:namePart>
                    </mods:name>
                </mods:subject>
                <mods:location>
                    <mods:physicalLocation authority="marcorg"><xsl:text>NNC-RB</xsl:text></mods:physicalLocation>
                    <mods:physicalLocation>
                        <xsl:text>Rare Book &amp; Manuscript Library, Columbia University</xsl:text>
                    </mods:physicalLocation>
                    <mods:url usage="primary display" access="object in context">
                        <xsl:text>http://lehman.cul.columbia.edu/lehman/document_id=</xsl:text>
                        <xsl:value-of select="child::field[@name = 'document_id']"/>
                    </mods:url>
                    <mods:holdingSimple>
                        <mods:copyInformation>
                            <mods:shelfLocator>
                                <xsl:text>Folder </xsl:text>
                                <xsl:value-of select="child::field[@name = 'folder_num']"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="child::field[@name = 'file_unittitle']"/>
                            </mods:shelfLocator>
                        </mods:copyInformation>
                    </mods:holdingSimple>
                </mods:location>
                <mods:relatedItem type="host" displayLabel="Project">
                    <mods:titleInfo>
                        <mods:title>
                            <xsl:text>Lehman special correspondence files</xsl:text>
                        </mods:title>
                    </mods:titleInfo>
                    <mods:originInfo eventType="publication">
                        <mods:place>
                            <mods:placeTerm>
                                <xsl:text>New York, NY</xsl:text>
                            </mods:placeTerm>
                        </mods:place>
                        <mods:publisher>
                            <xsl:text>Columbia University Libraries</xsl:text>
                        </mods:publisher>
                    </mods:originInfo>
                    <mods:location>
                        <mods:url>
                            <xsl:text>http://www.columbia.edu/cgi-bin/cul/resolve?clio6606869</xsl:text>
                        </mods:url>
                    </mods:location>
                </mods:relatedItem>
                <mods:relatedItem type="host" displayLabel="Collection">
                    <mods:titleInfo>
                        <mods:title>
                            <xsl:text>Herbert H. Lehman papers</xsl:text>
                        </mods:title>
                    </mods:titleInfo>
                    <mods:part>
                        <mods:detail type="series" level="1">
                            <mods:title>
                                <xsl:text>Special Files</xsl:text>
                            </mods:title>
                        </mods:detail>
                        <mods:detail type="subseries" level="2">
                            <mods:title>
                                <xsl:text>Correspondence Files 1895-1963</xsl:text>
                            </mods:title>
                        </mods:detail>
                        <mods:detail type="folder" level="3">
                            <mods:title>
                                <xsl:value-of select="child::field[@name = 'file_unittitle']"/>
                            </mods:title>
                        </mods:detail>
                    </mods:part>
                </mods:relatedItem>
                <mods:accessCondition>
                    <xsl:text>For rights relating to this resource, visithttp://lehman.cul.columbia.edu/lehman/rights</xsl:text>
                </mods:accessCondition>
                <mods:recordInfo>
                    <mods:languageOfCataloging>
                        <mods:languageTerm type="code" authority="iso639-2b">
                            <xsl:text>eng</xsl:text>
                        </mods:languageTerm>
                    </mods:languageOfCataloging>
                    <mods:recordIdentifier>
                        <xsl:value-of select="field[@name = 'document_id']"/>
                        <xsl:text>_descMetadata</xsl:text>
                    </mods:recordIdentifier>
                    <mods:recordContentSource authority="marcorg">
                        <xsl:text>NNC</xsl:text>
                    </mods:recordContentSource>
                    <mods:recordOrigin>
                        <xsl:text>Created and edited in general conformance to MODS Guideline
                        (Version 3).</xsl:text>
                    </mods:recordOrigin>
                </mods:recordInfo>
            </mods:mods>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="field[@name = 'file_unitdate']">
        <xsl:variable name="year" select="xs:integer(substring(., 1, 4))"/>
        <xsl:message select="$year"/>
        <mods:subject authority="lcsh">
            <xsl:choose>
                <xsl:when test="$year &gt; 1932 and $year &lt; 1945">
                    <mods:topic>
                        <xsl:text>United States--Politics and government--1933-1945</xsl:text>
                    </mods:topic>
                </xsl:when>
                <xsl:when test="$year &gt; 1944 and $year &lt; 1953">
                    <mods:topic>
                        <xsl:text>United States--Politics and government--1945-1953</xsl:text>
                    </mods:topic>
                </xsl:when>
                <xsl:when test="$year &gt; 1952 and $year &lt; 1961">
                    <mods:topic>
                        <xsl:text>United States--Politics and government--1953-1961</xsl:text>
                    </mods:topic>
                </xsl:when>
                <xsl:when test="$year &gt; 1960 and $year &lt; 1964">
                    <mods:topic>
                        <xsl:text>United States--Politics and government--1961-1963</xsl:text>
                    </mods:topic>
                </xsl:when>
            </xsl:choose>
        </mods:subject>
        <xsl:if test="$year &gt; 1864 and $year &lt; 1951">
            <mods:subject authority="lcsh">
                <mods:topic>
                    <xsl:text>United States--Politics and government--1865-1950</xsl:text>
                </mods:topic>
            </mods:subject>
        </xsl:if>
    </xsl:template>
    <xsl:template match="field[@name = 'file_unitdate_display']" mode="title">
        <xsl:text> : </xsl:text>
        <xsl:value-of select="field[@name = 'file_unitdate_display']"/>
    </xsl:template>
    <xsl:template match="field[@name = 'file_unitdate_display']" mode="dateCreated">
        <mods:originInfo>
            <mods:dateCreated>
                <xsl:value-of select="."/>
            </mods:dateCreated>
            <mods:dateCreated encoding="w3cdtf" keyDate="yes">
                <xsl:value-of select="ancestor::doc/field[@name = 'file_unitdate']"/>
            </mods:dateCreated>
        </mods:originInfo>
    </xsl:template>
</xsl:stylesheet>
