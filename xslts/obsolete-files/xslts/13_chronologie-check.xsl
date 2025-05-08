<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-skip" />

<!-- funktioniert nicht -->

<xsl:template match="tei:event/@when">
    <xsl:variable name="dieses-when" select="number(replace(.,'-',''))" as="xs:double"/>
    <xsl:variable name="voriges-when" select="number(replace(parent::tei:event[1]/preceding-sibling::tei:event[1]/@when[1],'-',''))" as="xs:double?"/>
    <xsl:choose>
        <xsl:when test="($dieses-when - $voriges-when) &lt; 10">
            
            <xsl:element name="treffer">
             <xsl:value-of select="."/>
            </xsl:element>
            
            
        </xsl:when>
    </xsl:choose>
    
</xsl:template>

</xsl:stylesheet>