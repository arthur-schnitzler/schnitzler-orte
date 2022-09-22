<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="tei:event">

        <xsl:for-each select=".">
            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="when">
                    <xsl:value-of select="@when"/>
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="@cert">
                        <xsl:attribute name="cert">
                            <xsl:value-of select="@cert"/>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">

                        <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:copy-of select="tei:desc/tei:placeName[1]/text()"/>
                            </xsl:element>
                            <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:location[1]/tei:geo/text()"/>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="type">
                                    <xsl:text>geonames</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="tei:desc/tei:placeName[1]/@ref"/>
                            </xsl:element>
                            <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="type">
                                    <xsl:text>pmb</xsl:text>
                                </xsl:attribute>
                            </xsl:element>
                            <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="target"/>
                            </xsl:element>
                        </xsl:element>

                        <!-- moren than one place -->
                        <xsl:if test="tei:desc/tei:placeName[2]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[2]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[2]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[2]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[3]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[3]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[3]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[3]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[4]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[4]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[4]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[4]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[5]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[5]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[5]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[5]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[6]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[6]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[6]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[6]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[7]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[7]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[7]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[7]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[8]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[8]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[8]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[8]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[9]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[9]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[9]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[9]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[10]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[10]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[10]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[10]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[11]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[11]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[11]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[11]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[12]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[12]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[12]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[12]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[13]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[13]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[13]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[13]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="tei:desc/tei:placeName[14]">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="placeName"
                                    namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:copy-of select="tei:desc/tei:placeName[14]/text()"/>
                                </xsl:element>
                                <xsl:element name="location" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:copy-of
                                            select="tei:desc/tei:location[14]/tei:geo/text()"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>geonames</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="tei:desc/tei:placeName[14]/@ref"/>
                                </xsl:element>
                                <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="type">
                                        <xsl:text>pmb</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:element name="link" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:attribute name="target"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:if>

                    </xsl:element>
                </xsl:element>

                <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:copy-of select="tei:note[1]/text()"/>
                </xsl:element>

                <!-- more than one note -->
                <xsl:if test="tei:note[2]">
                    <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:copy-of select="tei:note[2]/text()"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="tei:note[3]">
                    <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:copy-of select="tei:note[3]/text()"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="tei:note[4]">
                    <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:copy-of select="tei:note[4]/text()"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="tei:note[5]">
                    <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:copy-of select="tei:note[5]/text()"/>
                    </xsl:element>
                </xsl:if>

            </xsl:element>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
