<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="*:row">
        <xsl:for-each select=".">
            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="from">
                    <xsl:value-of select="*:start_date"/>
                </xsl:attribute>
                <xsl:attribute name="to">
                    <xsl:value-of select="*:end_date"/>
                </xsl:attribute>
                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="type">
                        <xsl:text>pmb</xsl:text>
                    </xsl:attribute>
                    <xsl:copy-of select="*:related_place_id/text()"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>