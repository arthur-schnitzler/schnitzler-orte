<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:foo="whatever" xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
	<xsl:output method="xml" indent="true"/>
	<xsl:mode on-no-match="shallow-copy"/>
	<xsl:template match="tei:place[tei:idno/@type = 'pmb']/tei:placeName">
		<xsl:variable name="pmb-id" as="xs:string">
			<xsl:variable name="idnopmb" select="parent::tei:place/tei:idno[@type = 'pmb']"/>
			<xsl:choose>
				<xsl:when test="starts-with($idnopmb, 'https://pmb.acdh.oeaw.ac.at/entity/')">
					<xsl:value-of
						select="tokenize(substring-after($idnopmb, 'https://pmb.acdh.oeaw.ac.at/entity/'), '/')[1]"
					/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of
						select="substring-after($idnopmb, 'https://pmb.acdh.oeaw.ac.at/entity/')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
			<xsl:variable name="eintrag"
				select="fn:escape-html-uri(concat('https://pmb.acdh.oeaw.ac.at/apis/entities/tei/place/', $pmb-id))"
				as="xs:string"/>
			
			<xsl:choose>
				<xsl:when
					test="doc-available($eintrag)">
					<xsl:value-of select="document($eintrag)/descendant::placeName[1]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="error">
						<xsl:text>place</xsl:text>
						<xsl:value-of select="$pmb-id"/>
						<xsl:value-of select="."/>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
