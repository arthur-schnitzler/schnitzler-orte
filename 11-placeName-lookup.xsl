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
        <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="idno">
                <xsl:copy-of select="key('place-lookup', $ortsname, $place)/tei:idno[@type='geonames'][1]"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        
        </xsl:element>
    </xsl:template>
    
    
    
</xsl:stylesheet>
    