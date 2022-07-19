<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
<xsl:output method="xml"/>
<xsl:mode on-no-match="shallow-copy"/>
    
    
<xsl:template match="//tei:desc/text()">
    <xsl:variable name="jahr" select="parent::*/@year"/>   
    
    <!-- "u." zwischen Datumsintervall, z.B. 16. u. 17.8. -->
    <xsl:analyze-string select="." regex="([0-9]{{1,2}})\s*\.\s*[u]{{1}}\s*\.\s*([0-9]{{1,2}})\s*\.\s*([0-9]{{1,2}})\s*\.">
        <xsl:matching-substring>
            <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="from">
                    <xsl:value-of select="$jahr"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                </xsl:attribute>
                <xsl:attribute name="to">
                    <xsl:value-of select="$jahr"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="foo:nullerHinzu(regex-group(2))"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:matching-substring>
        
      <xsl:non-matching-substring>
          <!-- "und" zwischen Tagen - zweistellig, z.B. 18.8. und 19.8. -->
          <xsl:analyze-string select="." regex="([0-9]{{1,2}})\s*\.\s*([0-9]{{1,2}})\s*\.\s*[und]{{3}}\s*([0-9]{{1,2}})\s*\.\s*([0-9]{{1,2}})\s*\.">
              <xsl:matching-substring>
                  <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                      <xsl:attribute name="from">
                          <xsl:value-of select="$jahr"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(2))"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                      </xsl:attribute>
                      <xsl:attribute name="to">
                          <xsl:value-of select="$jahr"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(4))"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                      </xsl:attribute>
                  </xsl:element>
              </xsl:matching-substring>
              
         <xsl:non-matching-substring>
             <!-- "und" zwischen den Tagen - einstellig, z.B. 18. und 19.8. -->
          <xsl:analyze-string select="." regex="([0-9]{{1,2}})\s*\.\s*[und]{{3}}\s*([0-9]{{1,2}})\s*\.\s*([0-9]{{1,2}})\s*\.">
              <xsl:matching-substring>
                  <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                      <xsl:attribute name="from">
                          <xsl:value-of select="$jahr"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                      </xsl:attribute>
                      <xsl:attribute name="to">
                          <xsl:value-of select="$jahr"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="foo:nullerHinzu(regex-group(2))"/>
                      </xsl:attribute>
                  </xsl:element>
              </xsl:matching-substring>
              
              <xsl:non-matching-substring>  
                  <!-- Datumsintervall, beide zweistellig, bspw. 6.5.-8.6. -->
                  <xsl:analyze-string select="."
                      regex="([0-9]{{1,2}})(\s*\.{{0,1}}\s*)([0-9]{{1,2}})(\s*\.{{0,1}}\s*\-\s*)([0-9]{{1,2}})(\s*\.\s*)([0-9]{{1,2}})\s*\.">
                      <xsl:matching-substring>
                          <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                              <xsl:attribute name="from">
                                  <xsl:value-of select="$jahr"/>
                                  <xsl:text>-</xsl:text>
                                  <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                                  <xsl:text>-</xsl:text>
                                  <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                              </xsl:attribute>
                              <xsl:attribute name="to">
                                  <xsl:value-of select="$jahr"/>
                                  <xsl:text>-</xsl:text>
                                  <xsl:value-of select="foo:nullerHinzu(regex-group(7))"/>
                                  <xsl:text>-</xsl:text>
                                  <xsl:value-of select="foo:nullerHinzu(regex-group(5))"/>
                              </xsl:attribute>
                          </xsl:element>
                      </xsl:matching-substring>
                      
                      <xsl:non-matching-substring>
                  <!-- Intervall ohne Monatsangabe, z.B. 5.-12.8.  -->
                <xsl:analyze-string select="." regex="([0-9]{{1,2}}?)(\s*?\.{{0,1}}\s*?[-]{{1}}\s*?)([0-9]{{1,2}}?)(\s*?\.{{1}}\s*?)([0-9]{{1,2}}?)(\s*?\.{{1}})">
                <xsl:matching-substring>
                    <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="from">
                            <xsl:value-of select="$jahr"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(5))"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                        </xsl:attribute>
                        <xsl:attribute name="to">
                            <xsl:value-of select="$jahr"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(5))"/>
                            <xsl:text>-</xsl:text>
                            <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:matching-substring>
                    
                <xsl:non-matching-substring> 
                    <!-- "," zwischen den Tagen, z.B.: 12.,13.5. -->
                    <xsl:analyze-string select="." regex="([0-9]{{1,2}})\s*\.\s*[,]\s*([0-9]{{1,2}})\s*\.\s*([0-9]{{1,2}})\s*\.">       
                    <xsl:matching-substring>
                        <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="from">
                                <xsl:value-of select="$jahr"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                            </xsl:attribute>
                            <xsl:attribute name="to">
                                <xsl:value-of select="$jahr"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="foo:nullerHinzu(regex-group(3))"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="foo:nullerHinzu(regex-group(2))"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring>
                        <!-- Single Date, z.B. 12.3. -->
                    <xsl:analyze-string select="." regex="([0-9]{{1,2}})\s*\.\s*([0-1]{{0,1}}[1-9]{{0,1}})\s*\.">
                        <xsl:matching-substring>
                            <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="from">
                                    <xsl:value-of select="$jahr"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="foo:nullerHinzu(regex-group(2))"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                                </xsl:attribute>
                                <xsl:attribute name="to">
                                    <xsl:value-of select="$jahr"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="foo:nullerHinzu(regex-group(2))"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="foo:nullerHinzu(regex-group(1))"/>
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:value-of select="."/>
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