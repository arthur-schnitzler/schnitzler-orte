<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="text" indent="true"/>
    <xsl:mode on-no-match="shallow-skip"/>

<xsl:template match="tei:listEvent">
    <xsl:text>\documentclass[twoside=false,titlepage=false,open=any, parskip=never, fontsize=10pt, headings=small, chapterprefix=false, appendixprefix=false, DIV=15]{scrbook}
\addtolength{\oddsidemargin}{\evensidemargin}
\setlength{\oddsidemargin}{.5\oddsidemargin}
\setlength{\evensidemargin}{\oddsidemargin}
 \usepackage[usenames, dvipsnames]{xcolor}
\usepackage{scrlayer-scrpage}
\usepackage{hyphenat}
\usepackage{fontspec}
\usepackage{moresize}
\usepackage[english, french, greek, ngerman]{babel}
\usepackage{multicol}

\usepackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text}
\setromanfont[Mapping=tex-text]{Hoefler Text}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Gill Sans}
\setmonofont[Scale=MatchLowercase]{Andale Mono}
\newcommand{\kaufmannsund}{\&amp;}
\setlength{\parindent}{0pt}

\begin{document}
\begin{multicols}{3}
    </xsl:text>
    <xsl:apply-templates select="descendant::tei:event"/>
    <xsl:text>
        \end{multicols}

\end{document}  
    </xsl:text>
</xsl:template>

<xsl:template match="tei:event">
    <xsl:variable name="voriges-element" select="preceding-sibling::tei:event[1]"/>
    <xsl:variable name="naechstes-element" select="following-sibling::tei:event[1]"/>
    <xsl:variable name="voriges-element-monat" select="$voriges-element/@when/fn:month-from-date(.)"/>
    <xsl:variable name="dieser-monat" select="@when/fn:month-from-date(.)"/>
    <xsl:variable name="voriges-element-jahr" select="$voriges-element/@when/fn:year-from-date(.)"/>
    <xsl:variable name="dieses-jahr" select="@when/fn:year-from-date(.)"/>
    <xsl:variable name="dieses-datum" select="@when"/>
    <xsl:choose>
        <xsl:when test="not(preceding-sibling::tei:event)">
            <xsl:text>\chapter*{</xsl:text><xsl:value-of select="$dieses-jahr"/><xsl:text>}</xsl:text>
            <xsl:text>\section*{</xsl:text>
            <xsl:choose>
                <xsl:when test="$dieser-monat=1">Januar</xsl:when>
                <xsl:when test="$dieser-monat=2">Februar</xsl:when>
                <xsl:when test="$dieser-monat=3">März</xsl:when>
                <xsl:when test="$dieser-monat=4">April</xsl:when>
                <xsl:when test="$dieser-monat=5">Mai</xsl:when>
                <xsl:when test="$dieser-monat=6">Juni</xsl:when>
                <xsl:when test="$dieser-monat=7">Juli</xsl:when>
                <xsl:when test="$dieser-monat=8">August</xsl:when>
                <xsl:when test="$dieser-monat=9">September</xsl:when>
                <xsl:when test="$dieser-monat=10">Oktober</xsl:when>
                <xsl:when test="$dieser-monat=11">November</xsl:when>
                <xsl:when test="$dieser-monat=12">Dezember</xsl:when>
            </xsl:choose>
            <xsl:text>}</xsl:text>
            <xsl:text>
            </xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test="$dieses-jahr != $voriges-element-jahr">
                <xsl:text>\chapter*{</xsl:text><xsl:value-of select="$dieses-jahr"/><xsl:text>}</xsl:text>
            <xsl:text>
            </xsl:text>
            </xsl:if>            
            <xsl:if test="$voriges-element-monat != $dieser-monat and $voriges-element-jahr = $dieses-jahr">
                <xsl:text>\section*{</xsl:text>
                <xsl:choose>
                    <xsl:when test="$dieser-monat=1">Januar</xsl:when>
                    <xsl:when test="$dieser-monat=2">Februar</xsl:when>
                    <xsl:when test="$dieser-monat=3">März</xsl:when>
                    <xsl:when test="$dieser-monat=4">April</xsl:when>
                    <xsl:when test="$dieser-monat=5">Mai</xsl:when>
                    <xsl:when test="$dieser-monat=6">Juni</xsl:when>
                    <xsl:when test="$dieser-monat=7">Juli</xsl:when>
                    <xsl:when test="$dieser-monat=8">August</xsl:when>
                    <xsl:when test="$dieser-monat=9">September</xsl:when>
                    <xsl:when test="$dieser-monat=10">Oktober</xsl:when>
                    <xsl:when test="$dieser-monat=11">November</xsl:when>
                    <xsl:when test="$dieser-monat=12">Dezember</xsl:when>
                </xsl:choose>
                <xsl:text>}</xsl:text>
                <xsl:text>
            </xsl:text>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$voriges-element = $naechstes-element and . = $voriges-element"/>
                <xsl:otherwise>
                    <xsl:value-of select="@when/fn:day-from-date(.)"/><xsl:text>. </xsl:text>
                    <xsl:for-each select="descendant::tei:placeName">
                        <xsl:value-of select="."/>
                        <xsl:choose>
                            <xsl:when test="not(position()=last())">
                                <xsl:text> | </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>\par
            </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:otherwise></xsl:choose>
                   
                       
                  
    
    
</xsl:template>

 
</xsl:stylesheet>