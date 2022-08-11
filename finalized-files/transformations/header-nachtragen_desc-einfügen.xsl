<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:param name="events" select="document('../transformed-xml/16-tage-zusammengefasst.xml')"/>

    <xsl:template match="*:dates">
        <xsl:element name="TEI" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:copy-of select="$events//tei:teiHeader"/>
            <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="head" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:text>Reisen</xsl:text>
                        </xsl:element>
                        <xsl:element name="listEvent" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:for-each select="*:event">
                                <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="@when"/>
                                    <xsl:copy-of select="@cert"/>
                                    <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of select="*:placeName"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
