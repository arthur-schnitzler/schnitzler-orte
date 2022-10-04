<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:listPlace/tei:placeName">
        <xsl:element name="new-entries" namespace="http://www.tei-c.org/ns/1.0">
                               <xsl:variable name="nummer" select="substring-after(@ref, 'pmb')"/>
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
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
