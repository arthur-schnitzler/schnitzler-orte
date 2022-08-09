<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <!-- # events unterteilen # -->

    <xsl:variable name="from-not-feb" select="/tei:event/@from[not(contains(., '-02-'))]"/>
    <!-- from außer februar -->
    <xsl:variable name="to-not-feb" select="/tei:event/@to[not(contains(., '-02-'))]"/>
    <!-- to außer februar -->

    <xsl:variable name="from-feb-kein-schaltjahr"
        select="/tei:event/@from[not(.[contains(., '1880') or contains(., '1884') or contains(., '1888') or contains(., '1892') or contains(., '1896') or contains(., '1904') or contains(., '1908') or contains(., '1912') or contains(., '1916') or contains(., '1920') or contains(., '1924') or contains(., '1928')])][contains(., '-02-')]"/>
    <!-- from februar (kein schaltjahr) -->
    <xsl:variable name="to-feb-kein-schaltjahr"
        select="/tei:event/@to[not(.[contains(., '1880') or contains(., '1884') or contains(., '1888') or contains(., '1892') or contains(., '1896') or contains(., '1904') or contains(., '1908') or contains(., '1912') or contains(., '1916') or contains(., '1920') or contains(., '1924') or contains(., '1928')])][contains(., '-02-')]"/>
    <!-- to februar (kein schaltjahr) -->
    <xsl:variable name="from-feb-schaltjahr"
        select="/tei:event/@from[contains(., '1880') or contains(., '1884') or contains(., '1888') or contains(., '1892') or contains(., '1896') or contains(., '1904') or contains(., '1908') or contains(., '1912') or contains(., '1916') or contains(., '1920') or contains(., '1924') or contains(., '1928')][contains(., '-02-')]"/>
    <!-- from februar (schaltjahr) -->
    <xsl:variable name="to-feb-schaltjahr"
        select="/tei:event/@to[contains(., '1880') or contains(., '1884') or contains(., '1888') or contains(., '1892') or contains(., '1896') or contains(., '1904') or contains(., '1908') or contains(., '1912') or contains(., '1916') or contains(., '1920') or contains(., '1924') or contains(., '1928')][contains(., '-02-')]"/>
    <!-- to februar (schaltjahr) -->

    <!-- # monate und tage unterteilen # -->

    <xsl:variable name="from-month-not-feb"
        select="$from-not-feb/substring-before(substring-after(., '-'), '-')"/>
    <!-- monat von from -->
    <xsl:variable name="from-day-not-feb-num"
        select="number(foo:nullerWeg($from-not-feb/substring-after(substring-after(., '-'), '-')))"/>
    <xsl:variable name="from-day-not-feb"
        select="$from-not-feb/substring-after(substring-after(., '-'), '-')"/>
    <!-- tag von from -->
    <xsl:variable name="to-month-not-feb"
        select="$to-not-feb/substring-before(substring-after(., '-'), '-')"/>
    <!-- monat von to -->
    <xsl:variable name="to-day-not-feb-num"
        select="number(foo:nullerWeg($to-not-feb/substring-after(substring-after(., '-'), '-')))"/>
    <xsl:variable name="to-day-not-feb"
        select="$to-not-feb/substring-after(substring-after(., '-'), '-')"/>
    <!-- tag von to -->
    <xsl:variable name="year-not-feb"
        select="substring-before(/tei:event/@from[not[., [contains(., '-02-')]]], '-')"/>
    <!-- jahr, nicht februar -->

    <xsl:variable name="from-day-feb-kein-schaltjahr-num"
        select="number(foo:nullerWeg($from-feb-kein-schaltjahr/substring-after(substring-after(., '-'), '-')))"/>
    <xsl:variable name="from-day-feb-kein-schaltjahr"
        select="$from-feb-kein-schaltjahr/substring-after(substring-after(., '-'), '-')"/>
    <!-- tag von from februar (kein schaltjahr) -->
    <xsl:variable name="to-day-feb-kein-schaltjahr-num"
        select="number(foo:nullerWeg($to-feb-kein-schaltjahr/substring-after(substring-after(., '-'), '-')))"/>
    <xsl:variable name="to-day-feb-kein-schaltjahr"
        select="$to-feb-kein-schaltjahr/substring-after(substring-after(., '-'), '-')"/>
    <!-- tag von to februar (kein schaltjahr) -->
    <xsl:variable name="from-day-feb-schaltjahr-num"
        select="number(foo:nullerWeg($from-feb-schaltjahr/substring-after(substring-after(., '-'), '-')))"/>
    <xsl:variable name="from-day-feb-schaltjahr"
        select="$from-feb-schaltjahr/substring-after(substring-after(., '-'), '-')"/>
    <!-- tag von from februar (schaltjahr) -->
    <xsl:variable name="to-day-feb-schaltjahr-num"
        select="number(foo:nullerWeg($to-feb-schaltjahr/substring-after(substring-after(., '-'), '-')))"/>
    <xsl:variable name="to-day-feb-schaltjahr"
        select="$to-feb-schaltjahr/substring-after(substring-after(., '-'), '-')"/>
    <!-- tag von to februar (schaltjahr) -->
    <xsl:variable name="month-feb" select="'02'"/>
    <xsl:variable name="month-not-feb" select="/tei:event/@from[not[., [contains(., '-02-')]]]"/>
    <xsl:variable name="year-feb" select="substring-before(/tei:event/@from[contains(., '-02-')], '-')"/>
    <!-- jahr februar -->

    <xsl:variable name="long-months"
        select="/tei:event/@from[contains(., '-01-') or contains(., '-03-') or contains(., '-05-') or contains(., '-07-') or contains(., '-08-') or contains(., '-10-') or contains(., '-12-')]"/>
    <!-- monate mit 31 tagen -->
    <xsl:variable name="short-months"
        select="/tei:event/@from[contains(., '-04-') or contains(., '-06-') or contains(., '-09-') or contains(., '-11-')]"/>
    <!-- monate mit 30 tagen -->

    <!-- # differenzen berechnen # -->

    <xsl:param name="day-difference-simple" select="$to-day-not-feb-num - $from-day-not-feb-num + 1"/>
    <!-- differenz ohne monatswechsel -->
    <xsl:param name="day-difference-31-from" select="31 - $from-day-not-feb-num + 1"/>
    <!-- differenz bis ende eines monats mit 31 tagen (januar, märz, mai, juli, august, oktober, dezember) -->
    <xsl:param name="day-difference-30-from" select="30 - $from-day-not-feb-num + 1"/>
    <!-- differenz bis ende eines monats mit 30 tagen (april, juni, september, november) -->
    <xsl:param name="day-difference-feb-kein-schaltjahr"
        select="28 - $from-day-feb-kein-schaltjahr-num + 1"/>
    <!-- differenz bis ende februar (kein schaltjahr) -->
    <xsl:param name="day-difference-feb-schaltjahr" select="29 - $from-day-feb-schaltjahr-num + 1"/>
    <!-- differenz bis ende februar (schaltjahr) -->

    <!-- ### -->

    <xsl:template match="tei:listEvent" name="repeat">
        <xsl:param name="times-simple" select="$day-difference-simple - 1"/>
        <xsl:param name="times-31-bis" select="$day-difference-31-from - 1"/>
        <xsl:param name="times-ab" select="$to-day-not-feb-num - 1"/>
        <xsl:param name="times-30-bis" select="$day-difference-30-from - 1"/>
        <xsl:param name="times-feb-kein-schaltjahr" select="$day-difference-feb-kein-schaltjahr - 1"/>
        <xsl:param name="times-feb-schaltjahr" select="$day-difference-feb-schaltjahr - 1"/>

        <!-- wenn to und from nicht übereinstimmen, mache events abhängig von der differenz der daten -->

        <xsl:for-each select="tei:event[@from != @to]">

            <!-- testen, ob auch monate nicht übereinstimmen -->
            <xsl:choose>
                <xsl:when
                    test="@from/substring-before(substring-after(., '-'), '-') != @to/substring-before(substring-after(., '-'), '-')">
                    <xsl:choose>
                        <!-- 31 tage -->
                        <xsl:when test="$long-months">
                            <!-- erster tag -->
                            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="$year-not-feb"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="$from-month-not-feb"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="$from-day-not-feb"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="@cert">
                                        <xsl:attribute name="cert">
                                            <xsl:value-of select="@cert"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="tei:desc/*"/>
                                    <xsl:choose>
                                        <xsl:when test="tei:note">
                                            <xsl:copy-of select="tei:note"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:element>
                            <!-- alle anderen tage -->
                            <!-- tage vor monatswechsel -->
                            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="when">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="$year-not-feb"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="$from-month-not-feb"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of
                                            select="foo:nullerHinzu($from-day-not-feb-num + 1)"/>
                                    </xsl:attribute>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="@cert">
                                        <xsl:attribute name="cert">
                                            <xsl:value-of select="@cert"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="tei:desc/*"/>
                                    <xsl:choose>
                                        <xsl:when test="tei:note">
                                            <xsl:copy-of select="tei:note"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                                <xsl:call-template name="repeat">
                                    <xsl:with-param name="times-31-bis" select="$times-31-bis"/>
                                </xsl:call-template>
                            </xsl:element>
                            <!-- erster tag nach monatswechsel -->
                            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="when">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="$year-not-feb"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="$to-month-not-feb"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="$to-day-not-feb"/>
                                    </xsl:attribute>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="@cert">
                                        <xsl:attribute name="cert">
                                            <xsl:value-of select="@cert"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="tei:desc/*"/>
                                    <xsl:choose>
                                        <xsl:when test="tei:note">
                                            <xsl:copy-of select="tei:note"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:element>
                            <!-- andere tage nach monatswechsel -->
                            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="when">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="$year-not-feb"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="$to-month-not-feb"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of
                                            select="foo:nullerHinzu($to-day-not-feb-num - 1)"/>
                                    </xsl:attribute>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="@cert">
                                        <xsl:attribute name="cert">
                                            <xsl:value-of select="@cert"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="tei:desc/*"/>
                                    <xsl:choose>
                                        <xsl:when test="tei:note">
                                            <xsl:copy-of select="tei:note"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                                <xsl:call-template name="repeat">
                                    <xsl:with-param name="times-ab" select="$times-ab"/>
                                </xsl:call-template>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- 30 tage -->
                            <xsl:choose>
                                <xsl:when test="$short-months">
                                    <!-- erster tag -->
                                    <xsl:element name="event"
                                        namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="when">
                                            <xsl:element name="event"
                                                namespace="http://www.tei-c.org/ns/1.0">
                                                <xsl:attribute name="when">
                                                  <xsl:attribute name="when">
                                                  <xsl:value-of select="$year-not-feb"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="$from-month-not-feb"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="$from-day-not-feb"/>
                                                  </xsl:attribute>
                                                </xsl:attribute>
                                                <xsl:choose>
                                                  <xsl:when test="@cert">
                                                  <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                </xsl:choose>
                                                <xsl:element name="desc"
                                                  namespace="http://www.tei-c.org/ns/1.0">
                                                  <xsl:value-of select="tei:desc/*"/>
                                                  <xsl:choose>
                                                  <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                  </xsl:when>
                                                  </xsl:choose>
                                                </xsl:element>
                                                <xsl:call-template name="repeat">
                                                  <xsl:with-param name="times-ab" select="$times-ab"
                                                  />
                                                </xsl:call-template>
                                            </xsl:element>
                                        </xsl:attribute>
                                    </xsl:element>
                                    <!-- alle anderen tage -->
                                    <!-- tage vor monatswechsel -->
                                    <xsl:element name="event"
                                        namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="when">
                                            <xsl:value-of select="$year-not-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="$from-month-not-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of
                                                select="foo:nullerHinzu($from-day-not-feb-num + 1)"
                                            />
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="@cert">
                                                <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:element name="desc"
                                            namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:value-of select="tei:desc/*"/>
                                            <xsl:choose>
                                                <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:element>
                                        <xsl:call-template name="repeat">
                                            <xsl:with-param name="times-30-bis"
                                                select="$times-30-bis"/>
                                        </xsl:call-template>
                                    </xsl:element>
                                    <!-- erster tag nach monatswechsel -->
                                    <xsl:element name="event"
                                        namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="when">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="$year-not-feb"/>
                                                <xsl:text>-</xsl:text>
                                                <xsl:value-of select="$to-month-not-feb"/>
                                                <xsl:text>-</xsl:text>
                                                <xsl:value-of select="$to-day-not-feb"/>
                                            </xsl:attribute>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="@cert">
                                                <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:element name="desc"
                                            namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:value-of select="tei:desc/*"/>
                                            <xsl:choose>
                                                <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:element>
                                    </xsl:element>
                                    <!-- andere tage nach monatswechsel -->
                                    <xsl:element name="event"
                                        namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="when">
                                            <xsl:value-of select="$year-not-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="$to-month-not-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of
                                                select="foo:nullerHinzu($from-day-not-feb-num - 1)"
                                            />
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="@cert">
                                                <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:element name="desc"
                                            namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:value-of select="tei:desc/*"/>
                                            <xsl:choose>
                                                <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:element>
                                        <xsl:call-template name="repeat">
                                            <xsl:with-param name="times-ab" select="$times-ab"/>
                                        </xsl:call-template>
                                    </xsl:element>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- februar, kein schaltjahr -->
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="$from-feb-kein-schaltjahr">
                            <!-- erster tag -->
                            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="$year-feb"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="$month-feb"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="$to-day-feb-kein-schaltjahr"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="@cert">
                                        <xsl:attribute name="cert">
                                            <xsl:value-of select="@cert"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="tei:desc/*"/>
                                    <xsl:choose>
                                        <xsl:when test="tei:note">
                                            <xsl:copy-of select="tei:note"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:element>
                            <!-- alle anderen tage -->
                            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="$year-feb"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="$month-feb"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of
                                        select="foo:nullerHinzu($to-day-feb-kein-schaltjahr-num + 1)"
                                    />
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="@cert">
                                        <xsl:attribute name="cert">
                                            <xsl:value-of select="@cert"/>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="tei:desc/*"/>
                                    <xsl:choose>
                                        <xsl:when test="tei:note">
                                            <xsl:copy-of select="tei:note"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                                <xsl:call-template name="repeat">
                                    <xsl:with-param name="times-feb-kein-schaltjahr"
                                        select="$day-difference-feb-kein-schaltjahr - 1"/>
                                </xsl:call-template>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- februar, schaltjahr -->
                            <xsl:choose>
                                <xsl:when test="$from-feb-schaltjahr">
                                    <!-- erster tag -->
                                    <xsl:element name="event"
                                        namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="when">
                                            <xsl:value-of select="$year-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="$month-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="$to-day-feb-schaltjahr"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="@cert">
                                                <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:element name="desc"
                                            namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:value-of select="tei:desc/*"/>
                                            <xsl:choose>
                                                <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:element>
                                    </xsl:element>
                                    <!-- alle anderen tage -->
                                    <xsl:element name="event"
                                        namespace="http://www.tei-c.org/ns/1.0">
                                        <xsl:attribute name="when">
                                            <xsl:value-of select="$year-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="$month-feb"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="$to-day-feb-schaltjahr"/>
                                        </xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="@cert">
                                                <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:element name="desc"
                                            namespace="http://www.tei-c.org/ns/1.0">
                                            <xsl:value-of select="tei:desc/*"/>
                                            <xsl:choose>
                                                <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:element>
                                        <xsl:call-template name="repeat">
                                            <xsl:with-param name="times-feb-schaltjahr"
                                                select="$day-difference-feb-schaltjahr - 1"/>
                                        </xsl:call-template>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- monat bleibt gleich, kein februar -->
                                    <xsl:choose>
                                        <xsl:when test="$month-not-feb">
                                            <!-- erster tag -->
                                            <xsl:element name="event"
                                                namespace="http://www.tei-c.org/ns/1.0">
                                                <xsl:attribute name="when">
                                                  <xsl:value-of select="$year-not-feb"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="$month-not-feb"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="$to-day-not-feb"/>
                                                </xsl:attribute>
                                                <xsl:choose>
                                                  <xsl:when test="@cert">
                                                  <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                </xsl:choose>
                                                <xsl:element name="desc"
                                                  namespace="http://www.tei-c.org/ns/1.0">
                                                  <xsl:value-of select="tei:desc/*"/>
                                                  <xsl:choose>
                                                  <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                  </xsl:when>
                                                  </xsl:choose>
                                                </xsl:element>
                                            </xsl:element>
                                            <!-- alle anderen tage -->
                                            <xsl:element name="event"
                                                namespace="http://www.tei-c.org/ns/1.0">
                                                <xsl:attribute name="when">
                                                  <xsl:value-of select="$year-not-feb"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="$month-not-feb"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of
                                                  select="foo:nullerHinzu($to-day-not-feb-num + 1)"
                                                  />
                                                </xsl:attribute>
                                                <xsl:choose>
                                                  <xsl:when test="@cert">
                                                  <xsl:attribute name="cert">
                                                  <xsl:value-of select="@cert"/>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                </xsl:choose>
                                                <xsl:element name="desc"
                                                  namespace="http://www.tei-c.org/ns/1.0">
                                                  <xsl:value-of select="tei:desc/*"/>
                                                  <xsl:choose>
                                                  <xsl:when test="tei:note">
                                                  <xsl:copy-of select="tei:note"/>
                                                  </xsl:when>
                                                  </xsl:choose>
                                                </xsl:element>
                                                <xsl:call-template name="repeat">
                                                  <xsl:with-param name="times-simple"
                                                  select="$times-simple"/>
                                                </xsl:call-template>
                                            </xsl:element>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>

        <!-- wenn to und from übereinstimmen, erstelle nur ein event -->

        <xsl:for-each select="tei:event[@from != @to]">
            <xsl:element name="event" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="when">
                    <xsl:value-of select="@from"/>
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="@cert">
                        <xsl:attribute name="cert">
                            <xsl:value-of select="@cert"/>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:element name="desc" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:copy-of select="tei:desc/*"/>
                    <xsl:choose>
                        <xsl:when test="tei:note">
                            <xsl:copy-of select="tei:note"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:function name="foo:nullerWeg">
        <xsl:param name="zahl" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="contains($zahl, '-01')">
                <xsl:text>1</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains($zahl, '-02')">
                        <xsl:text>2</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains($zahl, '-03')">
                                <xsl:text>3</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="contains($zahl, '-04')">
                                        <xsl:text>4</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="contains($zahl, '-05')">
                                                <xsl:text>5</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                  <xsl:when test="contains($zahl, '-06')">
                                                  <xsl:text>6</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '-07')">
                                                  <xsl:text>7</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '-08')">
                                                  <xsl:text>8</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '-09')">
                                                  <xsl:text>9</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '01-')">
                                                  <xsl:text>1</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '02-')">
                                                  <xsl:text>2</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '03-')">
                                                  <xsl:text>3</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '04-')">
                                                  <xsl:text>4</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '05-')">
                                                  <xsl:text>5</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '06-')">
                                                  <xsl:text>6</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '07-')">
                                                  <xsl:text>7</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '08-')">
                                                  <xsl:text>8</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when test="contains($zahl, '09-')">
                                                  <xsl:text>9</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="$zahl"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="foo:nullerHinzu">
        <xsl:param name="zahl"/>
        <xsl:choose>
            <xsl:when test="string-length($zahl) = 1">
                <xsl:value-of select="concat('0', $zahl)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$zahl"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
