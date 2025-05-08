<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy" />
    
    
    <xsl:template match="text()">
        
            
        <xsl:analyze-string select="." regex="[1]{{1}}[8-9]{{1}}[0-9]{{2}}\?">
                <xsl:matching-substring>
                    <xsl:element name="year" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="cert">
                            <xsl:text>low</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="substring-before(., '?')"/>
                    </xsl:element>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:analyze-string select="." regex="[1]{{1}}[8-9]{{1}}[0-9]{{2}}">
                        <xsl:matching-substring>
                            <xsl:element name="year" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                                <xsl:value-of select="."/>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
  </xsl:template>
    
    
</xsl:stylesheet>
    