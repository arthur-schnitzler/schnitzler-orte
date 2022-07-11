<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- XXXX auflösen, außer das Datum ist gar nicht bekannt, dann werden die Attribute verdoppelt, wodurch Fehlermeldung kommt -->
    
    <xsl:template match="tei:date/@from">
        <xsl:choose>
            <xsl:when test="contains(., 'XXXX')">
                <xsl:attribute name="from">
                    <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                    <xsl:value-of select="concat(substring-before(substring-after(../@to, '-'), '-'), '-')"/>
                    <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
                </xsl:attribute>
                <xsl:attribute name="to">
                    <xsl:value-of select="../@to"/>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:date/@to">
        <xsl:choose>
            <xsl:when test="contains(., 'XXXX')">
                <xsl:attribute name="to">
                    <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                    <xsl:value-of select="concat(substring-before(substring-after(../@from, '-'), '-'), '-')"/>
                    <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
                </xsl:attribute>
                <xsl:attribute name="from">
                    <xsl:value-of select="../@from"/>
                </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Monatskürzel auflösen -->
    
    <xsl:template match="tei:date/@when">
        <xsl:if test="contains(., 'Jan')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>01-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Feb')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>02-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Mär')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>03-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'März')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>03-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Apr')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>04-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Mai')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>05-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Jun')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>06-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Juni')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>06-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Jul')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>07-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Juli')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>07-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Aug')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>08-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Sep')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>09-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Sept')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>09-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Okt')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>10-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Nov')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>11-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Dez')">
            <xsl:attribute name="when">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>12--</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:date/@from">
        <xsl:if test="contains(., 'Jan')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>01-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Feb')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>02-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Mär')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>03-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'März')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>03-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Apr')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>04-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Mai')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>05-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Jun')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>06-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Juni')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>06-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Jul')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>07-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Juli')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>07-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Aug')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>08-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Sep')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>09-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Sept')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>09-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Okt')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>10-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Nov')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>11-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Dez')">
            <xsl:attribute name="from">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>12--</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:date/@to">
        <xsl:if test="contains(., 'Jan')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>01-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Feb')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>02-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Mär')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>03-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'März')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>03-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Apr')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>04-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Mai')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>05-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Jun')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>06-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Juni')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>06-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Jul')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>07-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Juli')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>07-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Aug')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>08-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Sep')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>09-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Sept')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>09-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Okt')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>10-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Nov')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>11-</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="contains(., 'Dez')">
            <xsl:attribute name="to">
                <xsl:value-of select="concat(substring-before(., '-'), '-')"/>
                <xsl:text>12--</xsl:text>
                <xsl:value-of select="substring-after(substring-after(., '-'), '-')"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
