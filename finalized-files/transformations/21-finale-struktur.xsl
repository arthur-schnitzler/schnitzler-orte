<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:listEvent">
        
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each-group select="tei:event" group-by="@when">
                    <xsl:sort select="fn:current-grouping-key()" data-type="text" order="ascending"/>
                <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="when">
                        <xsl:value-of select="current-grouping-key()"/>
                    </xsl:attribute>
                    <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:copy-of select="fn:current-group()[1]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[2]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[3]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[4]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[5]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[6]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[7]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[8]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[9]//tei:listPlace/*"/>
                        <xsl:copy-of select="fn:current-group()[10]//tei:listPlace/*"/>
                    </xsl:element>
                    </xsl:element>
                    <xsl:if test="tei:note[1]">
                        <xsl:copy-of select="fn:current-group()[1]//tei:note[1]"/>
                    </xsl:if>
                    <xsl:if test="tei:note[2]">
                        <xsl:copy-of select="fn:current-group()[1]//tei:note[2]"/>
                    </xsl:if>
                    <xsl:if test="tei:note[3]">
                        <xsl:copy-of select="fn:current-group()[1]//tei:note[3]"/>
                    </xsl:if>
                    <xsl:if test="tei:note[4]">
                        <xsl:copy-of select="fn:current-group()[1]//tei:note[4]"/>
                    </xsl:if>
                    <xsl:if test="tei:note[5]">
                        <xsl:copy-of select="fn:current-group()[1]//tei:note[5]"/>
                    </xsl:if>
                    
                </xsl:element>
            </xsl:for-each-group>
        </xsl:copy>
        
    </xsl:template>

</xsl:stylesheet>
