<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:div/text()">
        <xsl:choose>
            <xsl:when test="fn:string-length(preceding-sibling::tei:year[1]) &gt; 1">
                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="year">
                        <xsl:value-of select="preceding-sibling::tei:year[1]"/>
                    </xsl:attribute>
                    <xsl:if test="preceding-sibling::tei:year[1]/@cert">
                        <xsl:attribute name="cert">
                            <xsl:text>low</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:year"/>



</xsl:stylesheet>
