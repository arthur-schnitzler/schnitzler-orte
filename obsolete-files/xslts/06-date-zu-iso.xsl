<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:date-artefact">
        <xsl:variable name="jahr" select="parent::*/@year"/>
        <!-- Option 1: ein- oder zweistellig mit Monatskürzel, z. B. 2. Aug. -->
        <xsl:analyze-string select="."
            regex="(\d{{1,2}})(\.)(\s{{0,1}})([J,F,M,A,S,O,N,D]{{1}}[a-z]{{2}})(\.)">
            <xsl:matching-substring>
                <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="when">
                        <xsl:value-of select="$jahr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="regex-group(4)"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <!-- Option 2: Ziffern mit Punkte, z. B. 2. 8. -->
                <xsl:analyze-string select="." regex="(\d{{1,2}})(\.)(\s{{0,1}})(\d{{1,2}})(\.)">
                    <xsl:matching-substring>
                        <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="when">
                                <xsl:value-of select="$jahr"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="foo:nullerHinzu(regex-group(4))"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring>
                        <!-- Option 3: Ziffern mit Slashes, z. B. 2./8. -->
                        <xsl:analyze-string select="."
                            regex="(\d{{1,2}})(\.)(\s{{0,1}})(/)(\s{{0,1}})(\d{{1,2}})(\.)">
                            <xsl:matching-substring>
                                <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="$jahr"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="foo:nullerHinzu(regex-group(6))"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:matching-substring>
                            <xsl:non-matching-substring> </xsl:non-matching-substring>
                        </xsl:analyze-string>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
        <!-- Option 4: from und to-dates -->
        <xsl:choose>
            <xsl:when test="./tei:date[1]/@from">
                <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="from">
                        <xsl:value-of select="./tei:date[1]/@from"/>
                    </xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:value-of
                            select="./tei:date[1][@from]/following-sibling::tei:date[1]/@to"/>
                    </xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <!-- Option 5: day mit from to -->
    <xsl:template match="tei:day[@type = 'from']">
        <xsl:variable name="jahr" select="parent::*/@year"/>
        <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="from">
                <xsl:value-of select="$jahr"/>
                <xsl:text>-</xsl:text>
                <xsl:text>XXXX</xsl:text>
                <xsl:text>-</xsl:text>
                <xsl:value-of select="foo:punktAmEndeWeg(foo:nullerHinzu(.))"/>
            </xsl:attribute>
            
            <xsl:attribute name="to">
                <xsl:choose>
                    <xsl:when
                        test="following-sibling::tei:day-month[1][@type = 'to']">
                        <xsl:value-of select="$jahr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:choose>
                            <xsl:when test="contains(., './')">
                                <xsl:value-of
                                    select="foo:punktAmEndeWeg(foo:nullerHinzu(following-sibling::tei:day-month[1][@type = 'to']/substring-after(text(), './')))"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                    select="foo:punktAmEndeWeg(foo:nullerHinzu(following-sibling::tei:day-month[1][@type = 'to']/substring-after(text(), '.')))"
                                />
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of
                            select="foo:punktAmEndeWeg(foo:nullerHinzu(following-sibling::tei:day-month[1][@type = 'to']/substring-before(text(), '.')))"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- day to -->
                        <xsl:value-of select="$jahr"/>
                        <xsl:text>-</xsl:text>
                        <xsl:text>XXXX</xsl:text>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of
                            select="foo:punktAmEndeWeg(foo:nullerHinzu(following-sibling::tei:day[1][@type = 'to']/text()))"
                        />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:day[@type = 'to']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:day-month[@type = 'to']">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:function name="foo:nullerHinzu">
        <xsl:param name="zahl" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="string-length($zahl) = 1">
                <xsl:value-of select="concat('0', $zahl)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$zahl"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="foo:punktAmEndeWeg">
        <xsl:param name="string" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="ends-with($string, '.')">
                <xsl:variable name="string-laenge" select="string-length($string) - 1"/>
                <xsl:value-of select="substring($string, 1, $string-laenge)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template match="tei:placeName[fn:normalize-space(.)='' and not(child::*)]"/>

</xsl:stylesheet>
