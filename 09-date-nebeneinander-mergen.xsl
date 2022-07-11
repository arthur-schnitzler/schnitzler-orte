<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
<!-- Wenn zwei datumsangaben aufeinander folgen, ist das eine zeitspanne -->    
    
    <xsl:template match="tei:date[following-sibling::*[1][name()='date']]">
        <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="from">
                <xsl:value-of select="@*[1]"/>
            </xsl:attribute>
            <xsl:attribute name="to">
                <xsl:value-of select="following-sibling::*[1][name()='date']/@*[1]"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:date[preceding-sibling::*[1][name()='date']]"/>
        
</xsl:stylesheet>
