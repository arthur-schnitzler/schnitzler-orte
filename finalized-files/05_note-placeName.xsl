<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    
    <xsl:template match="//tei:desc/text()">
    <!-- Dinge in runder Klammer als note -->
        <xsl:analyze-string select="." regex="\(.+\)">
            <xsl:matching-substring>
                <xsl:element name="note"
                    namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:value-of
                        select="normalize-space(substring-before(substring-after(., '('), ')'))"/>
                </xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:for-each select="tokenize(., ',')">
                    
                    <!-- mit Beistrich getrennte placeNames trennen -->
                    <xsl:choose>
                        <xsl:when test="normalize-space(.) = ''"/>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="normalize-space(.)='' or normalize-space(.)='.' or normalize-space(.)=':' "/>
                                <xsl:when test="contains(., '-')">
                                    
                                    <!-- mit Bindestrich getrennte placeNames trennen -->
                                    <xsl:for-each select="tokenize(., '-')">
                                        <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:value-of
                                                select="foo:punktAmEndeWeg(normalize-space(.))"/>
                                        </xsl:element>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:value-of
                                            select="foo:punktAmEndeWeg(normalize-space(.))"/>
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <!-- verwendete Funktionen -->
    <xsl:function name="foo:punktAmEndeWeg">
        <xsl:param name="ortstring" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="ends-with($ortstring, '.')">
                <xsl:variable name="string-laenge" select="string-length($ortstring) - 1"/>
                <xsl:value-of select="substring($ortstring, 1, $string-laenge)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ortstring"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>