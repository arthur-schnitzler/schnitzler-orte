<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
<xsl:template name="events">
    <xsl:param name="beginn" as="xs:date"/>
    <xsl:param name="end" as="xs:date"/>
    <xsl:param name="geoname"/>
    <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:attribute name="when">
            <xsl:value-of select="$beginn"/>
        </xsl:attribute>
        <xsl:attribute name="ref">
            <xsl:value-of select="$geoname"/>
        </xsl:attribute>
    </xsl:element>
    <xsl:if test="not($beginn = $end)">
        <xsl:call-template name="events">
            <xsl:with-param name="beginn" select="$beginn + xs:dayTimeDuration('P1D')"/>
            <xsl:with-param name="end" select="$end"/>
            <xsl:with-param name="geoname" select="$geoname"/>
        </xsl:call-template>
    </xsl:if>
</xsl:template>    
    
<xsl:template match="tei:event">
    <xsl:call-template name="events">
        <xsl:with-param name="beginn" select="@from"/>
        <xsl:with-param name="end" select="@to"/>
        <xsl:with-param name="geoname" select="descendant::tei:placeName[1]/@ref"/>
    </xsl:call-template>
</xsl:template> 
 
</xsl:stylesheet>