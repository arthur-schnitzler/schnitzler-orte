<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
<xsl:output method="xml"/>
<xsl:mode on-no-match="shallow-copy"/>
    
    
    <!-- as the geo-element was not correct in regards to the TEI guidelines this
    transformation changes:
     <geo lat="46.45347" long="16.99104"/>
     to
     <geo>46.45347 16.99104</geo>
    -->
    
<xsl:template match="//tei:geo">
    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:value-of select="@lat"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@long"/>
    </xsl:element>
</xsl:template>
</xsl:stylesheet>