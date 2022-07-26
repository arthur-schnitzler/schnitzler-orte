<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy" />
    
    <xsl:param name="place"
        select="document('listplace.xml')"/>
    <xsl:key name="place-lookup" match="tei:place" use="tei:placeName"/>
    
    <xsl:template match="tei:placeName">
        <xsl:variable name="ortsname" select="."/>
        <xsl:variable name="geo" select="tei:geo"/>
        <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="ref">
                <xsl:copy-of select="key('place-lookup', $ortsname, $place)/tei:idno[@type='geonames'][1]"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
        <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="lat">
                    <xsl:copy-of select="key('place-lookup', $ortsname, $place)//tei:geo/substring-before(., ' ')"/>
                </xsl:attribute>
                <xsl:attribute name="long">
                    <xsl:copy-of select="key('place-lookup', $ortsname, $place)//tei:geo/substring-after(., ' ')"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>