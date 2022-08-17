<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:csv="csv:csv"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="text" encoding="utf-8"/>

    <xsl:variable name="separator" select="','"/>
    <xsl:variable name="quote" select="'&quot;'"/>
    <xsl:variable name="newline" select="'&#xA;'"/>

    <xsl:template match="tei:teiHeader"/>
    
    <xsl:template match="tei:head"/>

    <xsl:template match="tei:listEvent">

        <xsl:text>date</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>cert</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place1</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place2</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place3</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place4</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place5</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place6</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place7</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place8</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place9</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place10</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place11</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place12</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place13</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>place14</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames1</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames2</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames3</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames4</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames5</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames6</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames7</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames8</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames9</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames10</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames11</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames12</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames13</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>geonames14</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat1</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat2</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat3</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat4</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat5</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat6</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat7</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat8</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat9</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat10</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat11</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat12</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat13</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>lat14</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long1</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long2</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long3</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long4</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long5</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long6</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long7</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long8</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long9</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long10</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long11</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long12</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long13</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>long14</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note1</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note2</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note3</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note4</xsl:text>
        <xsl:value-of select="$separator"/>
        <xsl:text>note5</xsl:text>
        <xsl:value-of select="$newline"/>

        <xsl:for-each select="tei:event">

            <xsl:value-of select="$quote"/>
            <xsl:value-of select="@when"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="@cert">
                    <xsl:value-of select="@cert"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:desc/tei:placeName[1]/text()"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[2]">
                    <xsl:copy-of select="tei:desc/tei:placeName[2]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[3]">
                    <xsl:copy-of select="tei:desc/tei:placeName[3]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[4]">
                    <xsl:copy-of select="tei:desc/tei:placeName[4]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[5]">
                    <xsl:copy-of select="tei:desc/tei:placeName[5]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[6]">
                    <xsl:copy-of select="tei:desc/tei:placeName[6]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[7]">
                    <xsl:copy-of select="tei:desc/tei:placeName[7]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[8]">
                    <xsl:copy-of select="tei:desc/tei:placeName[8]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[9]">
                    <xsl:copy-of select="tei:desc/tei:placeName[9]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[10]">
                    <xsl:copy-of select="tei:desc/tei:placeName[10]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[11]">
                    <xsl:copy-of select="tei:desc/tei:placeName[11]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[12]">
                    <xsl:copy-of select="tei:desc/tei:placeName[12]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[13]">
                    <xsl:copy-of select="tei:desc/tei:placeName[13]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[14]">
                    <xsl:copy-of select="tei:desc/tei:placeName[14]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="tei:desc/tei:placeName[1]/@ref"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[2]">
                    <xsl:value-of select="tei:desc/tei:placeName[2]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[3]">
                    <xsl:value-of select="tei:desc/tei:placeName[3]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[4]">
                    <xsl:value-of select="tei:desc/tei:placeName[4]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[5]">
                    <xsl:value-of select="tei:desc/tei:placeName[5]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[6]">
                    <xsl:value-of select="tei:desc/tei:placeName[6]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[7]">
                    <xsl:value-of select="tei:desc/tei:placeName[7]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[8]">
                    <xsl:value-of select="tei:desc/tei:placeName[8]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[9]">
                    <xsl:value-of select="tei:desc/tei:placeName[9]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[10]">
                    <xsl:value-of select="tei:desc/tei:placeName[10]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[11]">
                    <xsl:value-of select="tei:desc/tei:placeName[11]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[12]">
                    <xsl:value-of select="tei:desc/tei:placeName[12]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[13]">
                    <xsl:value-of select="tei:desc/tei:placeName[13]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:placeName[14]">
                    <xsl:value-of select="tei:desc/tei:placeName[14]/@ref"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:desc/tei:location[1]/tei:geo/substring-before(., ' ')"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[2]">
                    <xsl:copy-of select="tei:desc/tei:location[2]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[3]">
                    <xsl:copy-of select="tei:desc/tei:location[3]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[4]">
                    <xsl:copy-of select="tei:desc/tei:location[4]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[5]">
                    <xsl:copy-of select="tei:desc/tei:location[5]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[6]">
                    <xsl:copy-of select="tei:desc/tei:location[6]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[7]">
                    <xsl:copy-of select="tei:desc/tei:location[7]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[8]">
                    <xsl:copy-of select="tei:desc/tei:location[8]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[9]">
                    <xsl:copy-of select="tei:desc/tei:location[9]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[10]">
                    <xsl:copy-of select="tei:desc/tei:location[10]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[11]">
                    <xsl:copy-of select="tei:desc/tei:location[11]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[12]">
                    <xsl:copy-of select="tei:desc/tei:location[12]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[13]">
                    <xsl:copy-of select="tei:desc/tei:location[13]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[14]">
                    <xsl:copy-of select="tei:desc/tei:location[14]/tei:geo/substring-before(., ' ')"></xsl:copy-of>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:copy-of select="tei:desc/tei:location[1]/tei:geo/substring-after(., ' ')"/>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[2]">
                    <xsl:copy-of select="tei:desc/tei:location[2]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[3]">
                    <xsl:copy-of select="tei:desc/tei:location[3]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[4]">
                    <xsl:copy-of select="tei:desc/tei:location[4]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[5]">
                    <xsl:copy-of select="tei:desc/tei:location[5]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[6]">
                    <xsl:copy-of select="tei:desc/tei:location[6]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[7]">
                    <xsl:copy-of select="tei:desc/tei:location[7]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[8]">
                    <xsl:copy-of select="tei:desc/tei:location[8]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[9]">
                    <xsl:copy-of select="tei:desc/tei:location[9]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[10]">
                    <xsl:copy-of select="tei:desc/tei:location[10]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[11]">
                    <xsl:copy-of select="tei:desc/tei:location[11]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[12]">
                    <xsl:copy-of select="tei:desc/tei:location[12]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[13]">
                    <xsl:copy-of select="tei:desc/tei:location[13]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:desc/tei:location[14]">
                    <xsl:copy-of select="tei:desc/tei:location[14]/tei:geo/substring-after(., ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:note[1]">
                    <xsl:copy-of select="tei:note[1]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:note[2]">
                    <xsl:copy-of select="tei:note[2]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:note[3]">
                    <xsl:copy-of select="tei:note[3]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:note[4]">
                    <xsl:copy-of select="tei:note[4]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$separator"/>
            <xsl:value-of select="$quote"/>
            <xsl:choose>
                <xsl:when test="tei:note[5]">
                    <xsl:copy-of select="tei:note[5]/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="$newline"/>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
