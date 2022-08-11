<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:listEvent">
        <xsl:element name="listEvent" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:for-each-group select="tei:event" group-by="@when">
                <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="when">
                        <xsl:value-of select="current-grouping-key()"/>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@cert">
                            <xsl:attribute name="cert">
                                <xsl:value-of select="@cert"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:copy-of select="current-group()/node()"/>
                </xsl:element>
            </xsl:for-each-group>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
