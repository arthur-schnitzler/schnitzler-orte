<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="https://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:param name="placeName" select="document('../../schnitzler-entities/indices/listplace.xml')/tei:TEI/tei:text[1]/tei:body[1]/tei:listPlace[1]"/>
    <xsl:key name="placeName-lookup" match="tei:place" use="tei:idno[@subtype='pmb']"/>
    
    <!-- diese datei angewandt auf schnitzler-places und mit einer
    aktuellen fassung von listplace aus der pmb, bei der die pmb-idnos
    so aussehen:
    
    <idno type="URL" subtype="pmb">118580</idno>
    
    erlaubt, den standardwert der pmb-nummer zu setzen, wenn sich
    etwas geändert haben sollte, etwa durch merge
    
    aber heute HAT ES NICHT FUNKTIONIERT! OH WELL!
    -->
    
    
    <xsl:template match="tei:listPlace/tei:place">
        <xsl:element name="place" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:variable name="nummer" select="replace(substring-after(tei:idno[@type='pmb'], 'entity/'), '/', '')"/>
            <xsl:variable name="nummer-lookup" select="key('placeName-lookup', $nummer, $placeName)/@xml:id"/>
            <xsl:copy-of select="$placeName/tei:place[@xml:id=$nummer-lookup]/tei:placeName[1]|$placeName/tei:place[@xml:id=$nummer-lookup]/tei:location[1]"></xsl:copy-of>
                <xsl:copy-of select="tei:link"/>
            <xsl:copy-of select="tei:idno[not(@type='pmb')]"></xsl:copy-of>
            <xsl:element name="idno" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="type">
                    <xsl:text>pmb</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="concat('https://pmb.acdh.oeaw.ac.at/entity/', $nummer, '/')"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>
