<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <!-- Identity template to copy all nodes and attributes unchanged -->
    <xsl:mode on-no-match="shallow-skip"/>
    <xsl:output indent="true" ></xsl:output>
    <!-- Main template to match the row element -->
    
    <!-- Das hier hat als Input relations.csv -> gSheet -> download
    as excel -> import in Oxygen -->
    
    <xsl:template match="*:root|*:Items">
        <xsl:element name="TEI" namespace="http://www.tei-c.org/ns/1.0">
            <tei:teiHeader>
                <tei:fileDesc>
                    <tei:titleStmt>
                        <tei:title>Arthur Schnitzlers Aufenthaltsorte</tei:title>
                        <tei:respStmt>
                            <tei:resp>providing the content</tei:resp>
                            <tei:name>Arthur Schnitzler</tei:name>
                            <tei:name>Martin Anton Müller</tei:name>
                            <tei:name>Laura Puntigam</tei:name>
                            <tei:name>Laura Untner</tei:name>
                        </tei:respStmt>
                    </tei:titleStmt>
                    <tei:publicationStmt>
                        <tei:publisher>
                            <tei:orgName>Austrian Centre for Digital Humanities, Austrian Academy of Sciences </tei:orgName>
                            <tei:address>
                                <tei:addrLine>Bäckerstraße 13</tei:addrLine>
                                <tei:addrLine>1010 Vienna</tei:addrLine>
                            </tei:address>
                        </tei:publisher>
                        <tei:pubPlace ref="http://d-nb.info/gnd/4066009-6">Vienna</tei:pubPlace>
                        <tei:date when="2024">2024</tei:date>
                        <tei:availability>
                            <tei:licence target="https://creativecommons.org/licenses/by/4.0/">
                                <tei:p>The Creative Commons Attribution 4.0 International (CC BY 4.0) License applies
                                    to this text.</tei:p>
                                <tei:p>The CC BY 4.0 License also applies to this TEI XML file.</tei:p>
                            </tei:licence>
                        </tei:availability>
                    </tei:publicationStmt>
                    <tei:sourceDesc>
                        <tei:p>The idea was to digitize the list of travels by Arthur Schnitzler that survives in
                            his papers stored in the Cambridge University Library, folder A 175. The goal was not
                            an edition of that list but to extract the information from the list and connect the
                            timespans with geonames-IDs and locations. Therefore errors and mistakes of the list
                            were changed without keeping track of the deleted information. Sometimes the diary
                            was used to correct entries.</tei:p>
                    </tei:sourceDesc>
                </tei:fileDesc>
            </tei:teiHeader>
            <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="head" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:text>Aufenthaltsorte</xsl:text>
                        </xsl:element>
                        <xsl:element name="listEvent" namespace="http://www.tei-c.org/ns/1.0">
            
            <xsl:apply-templates/>
                        </xsl:element></xsl:element></xsl:element></xsl:element>
        </xsl:element>
     </xsl:template>
    
    <xsl:template match="row[relation_type='gelebt in' and not(relation_start_date = 'nodate' )]|item[relation_type='gelebt in' and not(relation_start_date = 'nodate' )]">
        <xsl:variable name="from" select="xs:date(substring(relation_start_date, 1, 10))" as="xs:date"/>
        <xsl:variable name="to" as="xs:date">
            <xsl:choose>
                <xsl:when test=" relation_end_date = 'nodate'">
                    <xsl:value-of select="$from"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="xs:date(substring(relation_end_date, 1, 10))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="duration" select="fn:days-from-duration($to - $from)"/>
        <xsl:variable name="loopstring">
            <xsl:sequence select="foo:loop-string(1, $duration)"/>
        </xsl:variable>
        <xsl:variable name="ort" select="target"/>
        <xsl:variable name="place-id" select="target_id"/>
        <xsl:variable name="eventName" select="relation_name"/>
        <xsl:choose>
            <xsl:when test="$duration=0">
                <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="when">
                        <xsl:value-of select="$from"/>
                    </xsl:attribute>
                    <xsl:element name="eventName" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:value-of select="$eventName"/>
                    </xsl:element>
                    <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="corresp">
                                <xsl:value-of select="concat('#pmb', $place-id)"/>
                            </xsl:attribute>
                            <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:value-of select="$ort"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="tokenize($loopstring, 'x')">
                    <xsl:variable name="i" select="position() - 1"/>
                    <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="when">
                            <xsl:value-of select="$from + xs:dayTimeDuration(concat('P', $i, 'D'))"/>
                        </xsl:attribute>
                        <xsl:element name="eventName" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:value-of select="$eventName"/>
                        </xsl:element>
                        <xsl:element name="listPlace" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="corresp">
                                    <xsl:value-of select="concat('#pmb', $place-id)"/>
                                </xsl:attribute>
                                <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="$ort"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        
        
        
        
        
    </xsl:template>
    
    <xsl:function name="foo:loop-string">
        <!-- Diese Funktion gibt eine sequence aus, mit der Anzahl notwendigen
    Iterationen als x, die in Folge tokenisiert wird-->
        <xsl:param name="current-number"/>
        <xsl:param name="duration"/>
        <xsl:text>x</xsl:text>
        <xsl:if test="$current-number &lt; $duration">
            <xsl:value-of select="foo:loop-string($current-number + 1, $duration)"/>
        </xsl:if>
    </xsl:function>
    
</xsl:stylesheet>