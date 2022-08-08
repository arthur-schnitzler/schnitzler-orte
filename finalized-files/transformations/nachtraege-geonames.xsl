<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
<xsl:output method="xml"/>
<xsl:mode on-no-match="shallow-copy"/>
    
    
    <!--
 orte ohne geonames ausfüllen       
        -->
    <xsl:param name="places">
        <listPlace>
            <place>
                <placeName>Dölach</placeName>
                <uri>https://www.geonames.org/2780871/</uri>
            </place>
            <place>
                <placeName>Malnitzer Tauern (Niederer Tauern)</placeName>
                <uri>https://www.geonames.org/2770598/</uri>
            </place>
            <place>
                <placeName>Pasterze</placeName>
                <uri>https://www.geonames.org/2769213/</uri>
            </place>
            <place>
                <placeName>Albulapass</placeName>
                <uri>https://www.geonames.org/2661821/</uri>
            </place>
            <place>
                <placeName>Isola Bella</placeName>
                <uri>https://www.geonames.org/8967155/</uri>
            </place>
            <place>
                <placeName>Cowes</placeName>
                <uri>https://www.geonames.org/2652204/</uri>
            </place>
            <place>
                <placeName>Kammer See</placeName>
                <uri>https://www.geonames.org/2774820/</uri>
            </place>
            <place>
                <placeName>Nordkap</placeName>
                <uri>https://www.geonames.org/9039621/</uri>
            </place>
            <place>
                <placeName>Grimselpass</placeName>
                <uri>https://www.geonames.org/2660501/</uri>
            </place>
            <place>
                <placeName>Pilatus</placeName>
                <uri>https://www.geonames.org/2659201/</uri>
            </place>
            <place>
                <placeName>Raibler See</placeName>
                <uri>https://www.geonames.org/3169875/</uri>
            </place>
            <place>
                <placeName>Fedaia</placeName>
                <uri>https://www.geonames.org/8354640/</uri>
            </place>
            <place>
                <placeName>St. Michael</placeName>
                <uri>https://www.geonames.org/2766495/</uri>
            </place>
            <place>
                <placeName>Runkelstein</placeName>
                <uri>https://www.geonames.org/11126795/</uri>
            </place>
            <place>
                <placeName>Waldrast</placeName>
                <uri>https://www.geonames.org/2771895/</uri>
            </place>
            <place>
                <placeName>Hochschwab</placeName>
                <uri>https://www.geonames.org/2775956/</uri>
            </place>
            <place>
                <placeName>Schreckenstein</placeName>
                <uri>https://www.geonames.org/7117043/</uri>
            </place>
            <place>
                <placeName>Grieser Thal</placeName>
                <uri>https://www.geonames.org/3175824/</uri>
            </place>
            <place>
                <placeName>Puchberg</placeName>
                <uri>https://www.geonames.org/2768279/</uri>
            </place>
            <place>
                <placeName>Isarthal</placeName>
                <uri>https://www.geonames.org/6559195/</uri>
            </place>
            <place>
                <placeName>Zögernsee</placeName>
                <uri>https://www.geonames.org/3324106/</uri>
            </place>
            <place>
                <placeName>Zuiderzee</placeName>
                <uri>https://www.geonames.org/2753361/</uri>
            </place>
            <place>
                <placeName>Nordwyk</placeName>
                <uri>https://www.geonames.org/2749814/</uri>
            </place>
            <place>
                <placeName>Schlappiner Joch</placeName>
                <uri>https://www.geonames.org/2658731/</uri>
            </place>
            <place>
                <placeName>Nasswald</placeName>
                <uri>https://www.geonames.org/2770921/</uri>
            </place>
        </listPlace>
    </xsl:param>
    
    <xsl:key name="place-lookup" match="place" use="placeName"/>
    
<xsl:template match="//tei:placeName[@ref='']">
    <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:attribute name="ref">
            <xsl:choose>
                <xsl:when test="key('place-lookup',., $places)">
                    <xsl:text>SEX</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:attribute>
        <xsl:value-of select="."/>
    </xsl:element>
</xsl:template>
</xsl:stylesheet>