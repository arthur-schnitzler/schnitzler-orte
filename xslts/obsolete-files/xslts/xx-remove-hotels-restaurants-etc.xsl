<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'Hotel')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'hotel')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'Restaurant')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'Gasthaus')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'Straße')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'straße')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'Gasse')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'gasse')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'Allee')]"/>
    
    <xsl:template match="//tei:place[contains(tei:placeName, 'allee')]"/>
    
</xsl:stylesheet>