<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template
        match="tei:new-entries/tei:place/tei:placeName[not(fn:position() = 1)] | tei:new-entries//tei:place/tei:desc | tei:new-entries//tei:place/tei:location[not(@type = 'coords')]"/>
    <xsl:template match="tei:new-entries">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:new-entries/tei:place">
        <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates
                select="tei:placeName[1] | tei:location[@type = 'coords'] | tei:idno"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:new-entries/tei:place/tei:idno">
        <xsl:choose>
            <xsl:when test="contains(., 'geonames')">
                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="type">
                        <xsl:text>geonames</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="starts-with(., 'https://pmb.acdh.')">
                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="type">
                        <xsl:text>pmb</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
