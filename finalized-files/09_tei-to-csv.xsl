<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:csv="csv:csv" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    
        <xsl:mode on-no-match="shallow-skip"/>
        <xsl:output encoding="UTF-8" indent="no" method="text"/>
       
        <xsl:template match="/">
            <xsl:for-each select="tei:event">
   
                    <xsl:variable name="lat">
                    <xsl:choose>
                        <xsl:when test="//tei:geo[@lat]">
                            <xsl:value-of select="@lat"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>ERROR1</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:variable name="long">
                    <xsl:choose>
                        <xsl:when test="//tei:geo[@long]">
                            <xsl:value-of select="@long"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>ERROR1</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
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
                    </xsl:choose>
                </xsl:variable>

                    <xsl:value-of select="$from"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="$to"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="$lat"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="$long"/>
                    <xsl:text>;</xsl:text>
                 
            </xsl:for-each>
        </xsl:template> 
    </xsl:stylesheet>
    
     
