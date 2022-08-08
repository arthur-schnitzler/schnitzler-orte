<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:date/@when">
        <xsl:attribute name="when">
            <!-- year -->
            <xsl:choose>
                <xsl:when test="string-length(substring-before(., '-'[1])) != 4">
                    <xsl:text>ERROR</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(substring-before(., '-'[1]), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- month -->
            <xsl:choose>
                <xsl:when test="string-length(substring-before(substring-after(., '-'), '-')) = 1">
                    <xsl:value-of
                        select="concat('0', substring-before(substring-after(., '-'), '-'), '-')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of
                        select="concat(substring-before(substring-after(., '-'), '-'), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- day -->
            <xsl:choose>
                <xsl:when test="string-length(substring-after(substring-after(., '-'), '-')) = 1">
                    <xsl:value-of
                        select="concat('0', substring-after(substring-after(., '-'), '-'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:attribute>
    </xsl:template>

    <xsl:template match="tei:date/@from">
        <xsl:attribute name="from">
            <!-- year -->
            <xsl:choose>
                <xsl:when test="string-length(substring-before(., '-'[1])) != 4">
                    <xsl:text>ERROR</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(substring-before(., '-'[1]), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- month -->
            <xsl:choose>
                <xsl:when test="string-length(substring-before(substring-after(., '-'), '-')) = 1">
                    <xsl:value-of
                        select="concat('0', substring-before(substring-after(., '-'), '-'), '-')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of
                        select="concat(substring-before(substring-after(., '-'), '-'), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- day -->
            <xsl:choose>
                <xsl:when test="string-length(substring-after(substring-after(., '-'), '-')) = 1">
                    <xsl:value-of
                        select="concat('0', substring-after(substring-after(., '-'), '-'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="tei:date/@to">
        <xsl:attribute name="to">
            <!-- year -->
            <xsl:choose>
                <xsl:when test="string-length(substring-before(., '-'[1])) != 4">
                    <xsl:text>ERROR</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(substring-before(., '-'[1]), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- month -->
            <xsl:choose>
                <xsl:when test="string-length(substring-before(substring-after(., '-'), '-')) = 1">
                    <xsl:value-of
                        select="concat('0', substring-before(substring-after(., '-'), '-'), '-')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of
                        select="concat(substring-before(substring-after(., '-'), '-'), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- day -->
            <xsl:choose>
                <xsl:when test="string-length(substring-after(substring-after(., '-'), '-')) = 1">
                    <xsl:value-of
                        select="concat('0', substring-after(substring-after(., '-'), '-'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>
