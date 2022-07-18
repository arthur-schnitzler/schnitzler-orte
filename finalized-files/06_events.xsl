<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- Dieses XSLT angewandt auf desc mit date, placeName und note wie bspw.
    <desc><date from="1879-08-30"
               /><placeName ref="dflfdgk">Vienna</placeName><placeName>Frankfurt</placeName><note>Zug</note>
            <date from="1879-09-01" to="1879-09-01"/><placeName>Frankfurt</placeName>
            <placeName>Coblenz</placeName><placeName>Ems</placeName>
            <date from="1879-09-02" to="1879-09-03"/><placeName>Ems</placeName>
            <date from="1879-09-04" to="1879-09-04"/><placeName>Bonn</placeName>
            <placeName>Cologne</placeName></desc>
            
            macht daraus:
            
         <event from="1879-08-30" to="1879-08-30">
            <placeName ref="dflfdgk">Vienna</placeName>
            <note>Zug</note>
         </event>
         <event from="1879-08-30" to="1879-08-30">
            <placeName>Frankfurt</placeName>
            <note>Zug</note>
         </event>
         <event from="1879-09-01" to="1879-09-01">
            <placeName>Frankfurt</placeName>
         </event>
         <event from="1879-09-01" to="1879-09-01">
            <placeName>Coblenz</placeName>
         </event>
         <event from="1879-09-01" to="1879-09-01">
            <placeName>Ems</placeName>
         </event>
         <event from="1879-09-02" to="1879-09-03">
            <placeName>Ems</placeName>
         </event>
         <event from="1879-09-04" to="1879-09-04">
            <placeName>Bonn</placeName>
         </event>
         <event from="1879-09-04" to="1879-09-04">
            <placeName>Cologne</placeName>
         </event>
    
    -->
    
    
    <xsl:template match="//tei:desc">
        <xsl:for-each-group select="*" group-starting-with="tei:date">
            <xsl:variable name="from">
                <xsl:choose>
                    <xsl:when test="@from">
                        <xsl:value-of select="@from"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="to">
                <xsl:choose>
                    <xsl:when test="@to">
                        <xsl:value-of select="@to"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@from"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:for-each select="current-group()[name()='placeName']">
               <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                   <xsl:attribute name="from">
                       <xsl:value-of select="$from"/>
                   </xsl:attribute>
                   <xsl:attribute name="to">
                       <xsl:value-of select="$to"/>
                   </xsl:attribute>
                   <xsl:if test="">
                       <!-- certainty attribute -->
                   </xsl:if>
                   <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                   <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                           <xsl:attribute name="ref"/>
                           <xsl:value-of select="."/>
                   </xsl:element>
                   <xsl:for-each select="current-group()[name()='note']">
                           <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
                               <xsl:value-of select="."/>
                           </xsl:element>
                   </xsl:for-each>
                   </xsl:element>
               </xsl:element> 
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>
