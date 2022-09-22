<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:param name="listplace"
        select="document('../../../schnitzler-entities/indices/listplace.xml')"/>
    <xsl:key name="geonames" match="tei:place" use="tei:idno[@subtype='geonames']"/>

    

    <xsl:template match="tei:geo[ancestor::tei:place/tei:idno[@type='geonames']/not(. ='')]">
        <xsl:variable name="geonames-id" select="ancestor::tei:place/tei:idno[@type='geonames']/text()" as="xs:string"/>
        <xsl:variable name="coords" select="key('geonames', $geonames-id, $listplace)//tei:location[@type='coords']/tei:geo"/>
        <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
               <xsl:choose>
                   <xsl:when test="$coords = ''">
                       <xsl:value-of select="."/>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="$coords"/>
                   </xsl:otherwise>
               </xsl:choose>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
