<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:param name="pmb-listplace"
        select="document('../../dates-hilfsmittel/listplace-tagesgenau.xml')"/>
    <xsl:variable name="pmb-events" select="$pmb-listplace//*:event"/>

    <xsl:template match="tei:listEvent">
        <xsl:copy-of select="tei:event"/>
        <xsl:for-each select="$pmb-events">
            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="when">
                    <xsl:value-of select="@when"/>
                </xsl:attribute>
                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0"/>
                        </xsl:element>
                        <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0"/>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">
                            <xsl:text>geonames</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">
                            <xsl:text>pmb</xsl:text>
                        </xsl:attribute>
                        <xsl:copy-of
                            select="concat('https://pmb.acdh.oeaw.ac.at/apis/entities/entity/place/', *:idno, '/detail')"
                        />
                    </xsl:element>
                    <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="target"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
