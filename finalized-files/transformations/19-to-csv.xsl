<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:csv="csv:csv"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="text" encoding="utf-8"/>
    
    <xsl:mode on-no-match="shallow-skip"/>

    <xsl:variable name="separator" select="';'"/>
    <xsl:variable name="quote" select="'&quot;'"/>
    <xsl:variable name="newline" select="'&#xA;'"/>

    <xsl:template match="tei:listEvent">

        <xsl:text>date</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>cert</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>pmb</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>akon</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note1</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note2</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note3</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note4</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note5</xsl:text>
        <xsl:value-of select="$newline"/>

        <xsl:for-each select="//tei:place">
            <!-- date -->
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="../../../@when"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- cert -->
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="../../../@cert">
                    <xsl:value-of select="../../../@cert"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- place -->
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:placeName/text()"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- geonames -->
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:idno[@type = 'geonames']"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- lat -->
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:location/tei:geo/substring-before(., ' ')"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- long -->
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:location/tei:geo/substring-after(., ' ')"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- pmb -->
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:idno[@type = 'pmb']/text()"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- akon -->
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="tei:link/@target"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- note1 -->
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="../../../tei:note[1]">
                    <xsl:copy-of select="../../../tei:note[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- note2 -->
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="../../../tei:note[2]">
                    <xsl:copy-of select="../../../tei:note[2]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- note3 -->
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="../../../tei:note[3]">
                    <xsl:copy-of select="../../../tei:note[3]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- note4 -->
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="../../../tei:note[4]">
                    <xsl:copy-of select="../../../tei:note[4]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <!-- note5 -->
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="../../../tei:note[5]">
                    <xsl:copy-of select="../../../tei:note[5]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$newline"/>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
