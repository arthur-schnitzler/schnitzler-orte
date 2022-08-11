<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:param name="events" select="document('../transformed-xml/16-tage-zusammengefasst.xml')"/>
    <xsl:key name="date-lookup" match="tei:event" use="@when"/>

    <xsl:template match="*:date">
        <xsl:variable name="date" select="@when"/>
        <xsl:for-each select=".">
            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:choose>
                    <xsl:when test="key('date-lookup', $date, $events)/@when">
                        <xsl:attribute name="when">
                            <xsl:copy-of select="key('date-lookup', $date, $events)/@when"/>
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="key('date-lookup', $date, $events)/@cert">
                                <xsl:attribute name="cert">
                                    <xsl:value-of select="key('date-lookup', $date, $events)/@cert"/>
                                </xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:copy-of select="key('date-lookup', $date, $events)/tei:placeName"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="when">
                            <xsl:value-of select="@when"/>
                        </xsl:attribute>
                        <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="ref">
                                <xsl:text>https://www.geonames.org/2761369/</xsl:text>
                            </xsl:attribute>
                            <xsl:text>Wien</xsl:text>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
