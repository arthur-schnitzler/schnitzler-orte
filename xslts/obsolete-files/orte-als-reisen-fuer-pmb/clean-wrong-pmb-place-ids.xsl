<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>
   
    <xsl:key name="item-lookup" match="item" use="."/>
    <xsl:param name="items"
        as="node()" select="document('fehlerhafte-pmb-uris.xml')"/>
    
    <xsl:template match="tei:idno[@type='pmb']">
        <xsl:choose>
        <xsl:when test="key('item-lookup', ., $items)"/>
                   <xsl:otherwise>
                       <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                           <xsl:attribute name="type">
                               <xsl:text>pmb</xsl:text>
                           </xsl:attribute>
                           <xsl:choose>
                               <xsl:when test="ends-with(.,'/')">
                                   <xsl:value-of select="."/>
                               </xsl:when>
                               <xsl:otherwise>
                                   <xsl:value-of select="concat(.,'/')"/>
                               </xsl:otherwise>
                           </xsl:choose>
                       </xsl:element>
                   </xsl:otherwise>
               </xsl:choose>
   </xsl:template>
   
  
    
  
  
    
    
  
</xsl:stylesheet>
