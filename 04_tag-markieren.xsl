<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="tei:desc/text()">
        <xsl:variable name="jahr" select="parent::*/@year"/>
        <xsl:analyze-string select="."
            regex="([0-9]{{1,2}})(\.\s{{0,1}})([0-9]{{1,2}})(\.\s{{0,1}}\-\s{{0,1}})([0-9]{{1,2}})(\.\s{{0,1}})([0-9]{{1,2}})\.">
            <!-- Erster Fall: Datum von bis mit Bindestrich, beide zweistellig, bspw. 6.5.-8.6.
      -->
            <xsl:matching-substring>
                <xsl:element name="date-artefact" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="date">
                        <xsl:attribute name="from">
                            <xsl:value-of select="$jahr"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="date">
                        <xsl:attribute name="to">
                            <xsl:value-of select="$jahr"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(7))"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(5))"/>
                        </xsl:attribute>
                    </xsl:element>


                </xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:analyze-string select="." regex="[0-9]{{1,2}}\. ?[0-1]{{0,1}}[1-9]{{0,1}}\.">
                    <xsl:matching-substring>
                        <xsl:element name="date-artefact" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring>
                        <xsl:analyze-string select="."
                            regex="[0-9]{{1,2}}\. ?[J,F,M,A,S,O,N,D]{{1}}[a-z]{{2}}\.">
                            <xsl:matching-substring>
                                <xsl:element name="date-artefact"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="."/>
                                </xsl:element>
                            </xsl:matching-substring>
                            <xsl:non-matching-substring>
                                <xsl:analyze-string select="." regex="\d{{1,2}}\.\s{{0,1}}[u]\.">
                                    <xsl:matching-substring>
                                        <xsl:element name="day"
                                            namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:attribute name="type">
                                                <xsl:text>from</xsl:text>
                                            </xsl:attribute>
                                            <xsl:value-of select="substring-before(., 'u.')"/>
                                        </xsl:element>
                                        <xsl:element name="day-month"
                                            namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:attribute name="type">
                                                <xsl:text>to</xsl:text>
                                            </xsl:attribute>
                                            <xsl:value-of select="substring-after(., 'u.')"/>
                                        </xsl:element>
                                    </xsl:matching-substring>
                                    <xsl:non-matching-substring>
                                        <xsl:analyze-string select="."
                                            regex="\d{{1,2}}\./\d{{1,2}}\.">
                                            <xsl:matching-substring>
                                                <xsl:element name="date-artefact"
                                                  namespace="http://www.tei-c.org/ns/1.0">
                                                  <xsl:value-of select="."/>
                                                </xsl:element>
                                            </xsl:matching-substring>
                                            <xsl:non-matching-substring>
                                                <xsl:analyze-string select="."
                                                  regex="\d{{1,2}}\.\-\d{{1,2}}\.">
                                                  <xsl:matching-substring>
                                                  <xsl:element name="day"
                                                  namespace="http://www.tei-c.org/ns/1.0">
                                                  <xsl:attribute name="type">
                                                  <xsl:text>from</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="normalize-space(substring-before(., '.'))"
                                                  />
                                                  </xsl:element>
                                                  <xsl:element name="day"
                                                  namespace="http://www.tei-c.org/ns/1.0">
                                                  <xsl:attribute name="type">
                                                  <xsl:text>to</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:value-of
                                                  select="normalize-space(substring-after(., '-'))"
                                                  />
                                                  </xsl:element>
                                                  </xsl:matching-substring>
                                                  <xsl:non-matching-substring>
                                                  <xsl:for-each select="tokenize(., ',')">
                                                  <xsl:choose>
                                                  <xsl:when test="normalize-space(.) = ''"/>
                                                  <xsl:otherwise>
                                                  <xsl:element name="placeName">
                                                  <xsl:value-of
                                                  select="foo:punktAmEndeWeg(normalize-space(.))"/>
                                                  </xsl:element>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:for-each>
                                                  </xsl:non-matching-substring>
                                                </xsl:analyze-string>
                                            </xsl:non-matching-substring>
                                        </xsl:analyze-string>
                                    </xsl:non-matching-substring>
                                </xsl:analyze-string>
                            </xsl:non-matching-substring>
                        </xsl:analyze-string>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
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
</xsl:stylesheet>
