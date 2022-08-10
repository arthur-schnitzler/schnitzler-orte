<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

<xsl:function name="foo:loop-string">
    <!-- Diese Funktion gibt eine sequence aus, mit der Anzahl notwendigen
    Iterationen als x, die in Folge tokenisiert wird-->
    <xsl:param name="current-number"/>
    <xsl:param name="duration"/>
    <xsl:text>x,</xsl:text>
    <xsl:if test="$current-number &lt; $duration">
        <xsl:value-of select="foo:loop-string($current-number+1, $duration)"/>
    </xsl:if>
</xsl:function>
    

<xsl:template match="tei:event">
    <xsl:variable name="from" select="xs:date(@from)"/>
    <xsl:variable name="to" select="xs:date(@to)"/>
    <xsl:variable name="duration" select="fn:days-from-duration($to - $from)"/>
    <xsl:variable name="placeName" select="descendant::tei:placeName[1]" as="node()"/>
    <xsl:variable name="loopstring">
      <xsl:sequence select="foo:loop-string(1, $duration)"/>
    </xsl:variable>
    <xsl:for-each select="tokenize($loopstring,',')">
        <xsl:variable name="i" select="position() -1" />
        <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="when">
                <xsl:value-of select="$from + xs:dayTimeDuration(concat('P',$i,'D'))"/>
            </xsl:attribute>
            <xsl:copy-of select="$placeName"/>
        </xsl:element>
    </xsl:for-each>
</xsl:template> 
 
</xsl:stylesheet>