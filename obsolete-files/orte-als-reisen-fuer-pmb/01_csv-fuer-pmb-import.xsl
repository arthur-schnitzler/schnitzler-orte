<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-skip"/>
   
   <xsl:template match="tei:TEI">
       <xsl:element name="root">
           <xsl:apply-templates select="descendant::tei:event"/>
       </xsl:element>
   </xsl:template>
   <xsl:template match="tei:event">
       <xsl:variable name="when" select="@when"/>
       <xsl:for-each select="descendant::tei:place">
           <xsl:element name="tag" namespace="">
               <xsl:attribute name="when">
                   <xsl:value-of select="$when"/>
               </xsl:attribute>
               <xsl:variable name="pmb-string" as="xs:string" select="(replace(substring-after(tei:idno[@type='pmb'][1], 'https://pmb.acdh.oeaw.ac.at/entity/'), '/', ''))"/>
               <xsl:attribute name="pmb-place">
                   <xsl:value-of select="$pmb-string"/>
               </xsl:attribute>
           </xsl:element>
       </xsl:for-each>
   </xsl:template>
   
</xsl:stylesheet>
