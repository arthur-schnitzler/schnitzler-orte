<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:foo="whatever"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="3.0">
    <xsl:mode on-no-match="shallow-skip"/>
    <xsl:output encoding="UTF-8" indent="no" method="text"/>
    <xsl:template match="tei:profileDesc">
        <xsl:text>Date,Sender Surname,Sender First Name,Sender GND ID,Receiver Surname,Receiver First Name,Receiver GND ID,Sender City,Sender GeoNames ID,Receiver City,Receiver GeoNames ID
</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:correspDesc">
        <xsl:variable name="current" select="current()" as="node()"/>
        <xsl:for-each select="tei:correspAction[1]/tei:persName">
            <xsl:variable name="sender-pos" select="position()"/>
            <xsl:for-each select="$current/tei:correspAction[last()]/tei:persName">
                <xsl:variable name="empfaenger-pos" select="position()"/>
                <xsl:value-of select="foo:alle($sender-pos, $empfaenger-pos, $current)"/>
                <xsl:text>
</xsl:text>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:function name="foo:alle">
        <xsl:param name="zaehler-sen" as="xs:integer"/>
        <xsl:param name="zaehler-emp" as="xs:integer"/>
        <xsl:param name="nodes" as="node()"/>
        <xsl:apply-templates select="$nodes/tei:correspAction[1]/tei:date"/> <xsl:text>,</xsl:text>
        <xsl:apply-templates select="$nodes/tei:correspAction[1]/tei:persName[$zaehler-sen]"/> <xsl:text>,</xsl:text>
        <xsl:apply-templates select="$nodes/tei:correspAction[last()]/tei:persName[$zaehler-emp]"/> <xsl:text>,</xsl:text>
        <xsl:choose>
            <xsl:when test="$nodes/tei:correspAction[1]/tei:placeName">
                <xsl:apply-templates select="$nodes/tei:correspAction[1]/tei:placeName"/><xsl:text>,</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>,,</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$nodes/tei:correspAction[last()]/tei:placeName">
                <xsl:apply-templates select="$nodes/tei:correspAction[last()]/tei:placeName"/><xsl:text>,</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>,</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template match="tei:correspAction[1]/tei:date">
        <xsl:choose>
            <xsl:when test="@when">
                <xsl:value-of select="@when"/>
            </xsl:when>
            <xsl:when test="@notBefore">
                <xsl:value-of select="@notBefore"/>
            </xsl:when>
            <xsl:when test="@notAfter">
                <xsl:value-of select="@notAfter"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:correspAction/tei:persName">
        <xsl:variable name="ref">
            <xsl:choose>
                <xsl:when test="not(@ref)">
                    <xsl:value-of select="position()"/>
                </xsl:when>
                <xsl:when test="contains(@ref, 'https://d-nb.info/gnd/') and ends-with(@ref, '/')">
                    <xsl:value-of select="substring-before(substring-after(@ref, 'https://d-nb.info/gnd/'), '/')"/>
                </xsl:when>
                <xsl:when test="contains(@ref, 'https://d-nb.info/gnd/')">
                    <xsl:value-of select="(substring-after(@ref, 'https://d-nb.info/gnd/'))"/>
                </xsl:when>
                <xsl:when test="ends-with(@ref, '/')">
                    <xsl:value-of select="substring-before(@ref, '/')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="normalize-space(.)"/><xsl:text>,</xsl:text><xsl:value-of select="$ref"/>
    </xsl:template>
    
    <xsl:template match="tei:correspAction/tei:placeName">
        <xsl:variable name="ref">
            <xsl:choose>
                <xsl:when test="starts-with(@ref, 'https://www.geonames.org/') and ends-with(@ref, '/')">
                    <xsl:value-of select="substring-before(substring-after(@ref, 'https://www.geonames.org/'), '/')"/>
                </xsl:when>
                <xsl:when test="starts-with(@ref, 'https://www.geonames.org/')">
                    <xsl:value-of select="(substring-after(@ref, 'https://www.geonames.org/'))"/>
                </xsl:when>
                <xsl:when test="ends-with(@ref, '/')">
                    <xsl:value-of select="substring-before(@ref, '/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>ERROR1</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="normalize-space(.)"/><xsl:text>,</xsl:text><xsl:value-of select="$ref"/>
    </xsl:template>
    
        
        
</xsl:stylesheet>
