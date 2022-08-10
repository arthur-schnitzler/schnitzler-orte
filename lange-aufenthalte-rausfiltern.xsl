<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="tei:event">
        <xsl:variable name="from" select="xs:date(@from)"/>
        <xsl:variable name="to" select="xs:date(@to)"/>
        <xsl:variable name="duration" select="fn:days-from-duration($to - $from)"/>
        <xsl:choose>
            <xsl:when test="$duration > 30">
                <xsl:element name="duration">
                    <xsl:text>SO LONG MARY-ANN</xsl:text>
                </xsl:element>
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>