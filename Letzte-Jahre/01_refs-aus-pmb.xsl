<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="item[not(starts-with(@target, '1930'))]"/>
    <xsl:template match="item[starts-with(@target, '1930')]">
       <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
           <xsl:attribute name="when">
               <xsl:value-of select="@target"/>
           </xsl:attribute>
           <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
               <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">
                   <xsl:choose>
                       <xsl:when test="not(child::*)">
                           <!-- Datum vorhanden, aber kein placeName heißt Wien -->
                           <xsl:copy-of select="document('https://pmb.acdh.oeaw.ac.at/apis/entities/tei/place/50')"/>
                       </xsl:when>
                       <xsl:otherwise>
                           <xsl:for-each select="distinct-values(placeName/@ref)">
                           
                               <xsl:variable name="nummer" select="substring-after(., 'pmb')"/>
                               <xsl:variable name="eintrag"
                                   select="fn:escape-html-uri(concat('https://pmb.acdh.oeaw.ac.at/apis/entities/tei/place/', $nummer))"
                                   as="xs:string"/>
                               <xsl:choose>
                                   <xsl:when test="doc-available($eintrag)">
                                       <xsl:copy-of select="document($eintrag)"/>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:element name="error">
                                           <xsl:attribute name="type">
                                               <xsl:text>place</xsl:text>
                                           </xsl:attribute>
                                           <xsl:value-of select="$nummer"/>
                                       </xsl:element>
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:for-each>
                           
                       </xsl:otherwise>
                   </xsl:choose>
                   
                   
               </xsl:element>
               
               
           </xsl:element>
           
       </xsl:element>
        
    </xsl:template>

<xsl:template match="list">
    <xsl:element name="listEvent" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:apply-templates/>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>
