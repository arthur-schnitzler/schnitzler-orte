<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

<xsl:template match="placeName[not(fn:position()=1)]|desc|location[not(@type='coords')]"/>

    <xsl:template match="listEvent">
        <xsl:element name="listEvent" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

<xsl:template match="event">
    <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:apply-templates/>
    </xsl:element>
</xsl:template>
    
    <xsl:template match="event/desc">
        <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="listPlace">
        <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

<xsl:template match="place">
    <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:apply-templates select="placeName[1]|location[@type='coords']|idno"/>
    </xsl:element>
</xsl:template>
    
    <xsl:template match="idno">
        <xsl:choose>
            <xsl:when test="@subtype='geonames'">
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
