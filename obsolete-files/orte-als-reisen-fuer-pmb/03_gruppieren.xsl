<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever"  version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-skip"/>
   
   <xsl:template match="root">
       <xsl:element name="root" namespace="">
       <xsl:apply-templates/>
       </xsl:element>
   </xsl:template>
   
   <xsl:template match="ort">
       
           <xsl:variable name="xmlid" select="@xml:id"/>
           <xsl:for-each-group select="tag" group-starting-with="tag[not(@when = string(xs:date(preceding-sibling::tag[1]/@when) + xs:dayTimeDuration('P1D')))]">
               <xsl:element name="reise">
                   <xsl:attribute name="pmb">
                       <xsl:value-of select="$xmlid"/>
                   </xsl:attribute>
                   <xsl:for-each select="current-group()">
                       <xsl:if test="fn:position()=1">
                           <xsl:attribute name="from">
                               <xsl:value-of select="@when"/>
                           </xsl:attribute>
                       </xsl:if>
                       <xsl:if test="fn:position()=last()">
                           <xsl:attribute name="to">
                               <xsl:value-of select="@when"/>
                           </xsl:attribute>
                       </xsl:if>
                   </xsl:for-each>
               </xsl:element>
       </xsl:for-each-group>
       
   </xsl:template>
    
    
  
</xsl:stylesheet>
