<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei" version="3.0">
    <!-- Dieses XSLT wird auf schnitzler_places.xml angewandt. Es kopiert nur die obersten 
    Ebenen aus wienerschnitzler-complete-nested.xml -->
    <!-- Identitätstransformation -->
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output indent="true"/>
    <xsl:param name="nestedListEvent"
        select="document('https://raw.githubusercontent.com/wiener-moderne-verein/wienerschnitzler-data/refs/heads/main/data/editions/xml/wienerschnitzler_complete_nested.xml')/tei:TEI[1]/tei:text[1]/tei:body[1]/tei:div[1]/tei:listEvent"/>
    <xsl:param name="listplace"
        select="document('https://raw.githubusercontent.com/wiener-moderne-verein/wienerschnitzler-data/refs/heads/main/data/indices/listplace.xml')/tei:TEI[1]/tei:text[1]/tei:body[1]/tei:listPlace[1]"/>
    <xsl:key name="placeLookup" match="tei:place" use="@xml:id"/>
    <xsl:template match="tei:TEI">
        <xsl:element name="TEI" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:copy-of select="@* | tei:teiHeader"/>
            <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="head" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:text>Aufenthaltsorte</xsl:text>
                        </xsl:element>
                        <xsl:element name="listEvent" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:for-each select="$nestedListEvent//*:event">
                                <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="@*"/>
                                    <xsl:element name="listPlace"
                                        namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:for-each
                                            select="child::tei:listPlace[1]/tei:place/@corresp">
                                            <xsl:variable name="current-pmbnr" select="replace(replace(., 'pmb', ''), '#', '')"/>
                                            <xsl:element name="place"
                                                namespace="http://www.tei-c.org/ns/1.0">
                                                <xsl:attribute name="ref">
                                                  <xsl:value-of select="concat('#', .)"/>
                                                </xsl:attribute>
                                                <xsl:copy-of
                                                  select="key('placeLookup', replace(., '#', ''), $listplace)/tei:placeName[1]"/>
                                                <xsl:copy-of
                                                    select="key('placeLookup', replace(., '#', ''), $listplace)/tei:location[@type='coords'][1]"/>
                                                <xsl:copy-of
                                                    select="key('placeLookup', replace(., '#', ''), $listplace)/tei:location[@type='located_in_place'][1]"/>
                                                <xsl:copy-of
                                                  select="key('placeLookup', replace(., '#', ''), $listplace)/tei:idno[contains(@subtype, 'schnitzler')]"
                                                />
                                                <xsl:copy-of
                                                    select="key('placeLookup', replace(., '#', ''), $listplace)/tei:idno[contains(@subtype, 'pmb') and contains(., $current-pmbnr)]"
                                                />
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
