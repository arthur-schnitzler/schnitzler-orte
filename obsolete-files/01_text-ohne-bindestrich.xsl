<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="//tei:lb">
        <xsl:choose>
            <xsl:when test="ends-with(preceding-sibling::text()[1], '-')"/>
            <xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//tei:pb">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="//tei:seite">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>