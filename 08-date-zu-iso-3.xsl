<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- XXXX auflösen, außer das Datum ist gar nicht bekannt, dann werden die Attribute verdoppelt, wodurch Fehlermeldung kommt -->
    
    
    <xsl:template match="tei:date/@from[contains(.,'XXXX')]">
        <xsl:variable name="monat-to" as="xs:string">
            <xsl:choose>
                <xsl:when test="parent::tei:date/@to">
                    <xsl:value-of select="tokenize(parent::tei:date/@to,'-')[2]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="parent::tei:date/following-sibling::*[1][name()='date']/tokenize(@*[1],'-')[2]"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="from">
        <xsl:choose>
            <xsl:when test="contains(., 'XXXX')">
                <xsl:attribute name="from">
                    <xsl:value-of select="concat(tokenize(., '-')[1], '-')"/>
                    <xsl:value-of select="concat($monat-to, '-')"/>
                    <xsl:value-of select="tokenize(., '-')[3]"/>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@to[contains(.,'XXXX')]">
        <xsl:variable name="monat-to" as="xs:string">
               <xsl:value-of select="parent::tei:date/following-sibling::*[1][name()='date']/tokenize(@*[1],'-')[2]"/>
        </xsl:variable>
        <xsl:attribute name="to">
            <xsl:choose>
                <xsl:when test="contains(., 'XXXX')">
                    <xsl:attribute name="to">
                        <xsl:value-of select="concat(tokenize(., '-')[1], '-')"/>
                        <xsl:value-of select="concat($monat-to, '-')"/>
                        <xsl:value-of select="tokenize(., '-')[3]"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

    <!-- Monatskürzel auflösen -->
    
    <xsl:template match="tei:date/@when[contains(.,'Jan')]|tei:date/@from[contains(.,'Jan')]|tei:date/@to[contains(.,'Jan')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>01-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Feb')]|tei:date/@from[contains(.,'Feb')]|tei:date/@to[contains(.,'Feb')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>02-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Mär')]|tei:date/@from[contains(.,'Mär')]|tei:date/@to[contains(.,'Mär')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>03-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Apr')]|tei:date/@from[contains(.,'Apr')]|tei:date/@to[contains(.,'Apr')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>04-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
       
    <xsl:template match="tei:date/@when[contains(.,'Mai')]|tei:date/@from[contains(.,'Mai')]|tei:date/@to[contains(.,'Mai')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>05-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Jun')]|tei:date/@from[contains(.,'Jun')]|tei:date/@to[contains(.,'Jun')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>06-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Jul')]|tei:date/@from[contains(.,'Jul')]|tei:date/@to[contains(.,'Jul')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>07-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Aug')]|tei:date/@from[contains(.,'Aug')]|tei:date/@to[contains(.,'Aug')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>08-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Sept')]|tei:date/@from[contains(.,'Sept')]|tei:date/@to[contains(.,'Sept')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>09-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Okt')]|tei:date/@from[contains(.,'Okt')]|tei:date/@to[contains(.,'Okt')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>10-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    
    <xsl:template match="tei:date/@when[contains(.,'Nov')]|tei:date/@from[contains(.,'Nov')]|tei:date/@to[contains(.,'Nov')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>11-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Dec')]|tei:date/@from[contains(.,'Dec')]|tei:date/@to[contains(.,'Dec')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>12-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="tei:date/@when[contains(.,'Dez')]|tei:date/@from[contains(.,'Dez')]|tei:date/@to[contains(.,'Dez')]">
        <xsl:variable name="whenfromto" select="./name()"/>
        <xsl:attribute name="{$whenfromto}">
            <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
            <xsl:text>12-</xsl:text>
            <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
        </xsl:attribute>
    </xsl:template>
        
</xsl:stylesheet>
