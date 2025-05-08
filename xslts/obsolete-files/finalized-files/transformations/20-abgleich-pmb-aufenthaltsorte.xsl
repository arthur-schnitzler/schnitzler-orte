<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:param name="listplace"
        select="document('../../../schnitzler-entities/indices/listplace.xml')"/>
    <xsl:key name="place" match="*:place" use="@xml:id"/>

    <xsl:variable name="pmb-events" select="*:placeName[not(text())]/ancestor::tei:event"/>

    <xsl:template match="*:event[descendant::*:placeName[.='']]">
        <xsl:variable name="place-id"
            select="concat('place__', *:desc/*:idno[@type = 'pmb']/substring-after(substring-before(text(), '/detail'), 'place/'))"/>
        <xsl:for-each select=".">
            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="when">
                    <xsl:value-of select="@when"/>
                </xsl:attribute>
                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:value-of
                                    select="key('place', $place-id, $listplace)/descendant::*:placeName[not(@type)][1]/text()"
                                />
                              </xsl:element>
                            <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of
                                        select="key('place', $place-id, $listplace)/descendant::*:location[@type = 'coords'][1]/*:geo/text()"
                                    />
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="type">
                                    <xsl:text>geonames</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of
                                    select="key('place', $place-id, $listplace)/descendant::*:idno[@type='URL' and @subtype = 'geonames'][1]/text()"
                                />
                            </xsl:element>
                            <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="type">
                                    <xsl:text>pmb</xsl:text>
                                </xsl:attribute>
                                <xsl:copy-of select="*:desc/*:idno[@type = 'pmb']/text()"/>
                            </xsl:element>
                            <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="target"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
