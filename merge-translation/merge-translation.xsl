<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets" extension-element-prefixes="str fn set">
<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:param name="exported-flextext"></xsl:param>
<xsl:param name="writing-system">prd-Arab</xsl:param>

<xsl:variable name="translation-phrases" select="/document/interlinear-text/paragraphs/paragraph/phrases/phrase"/>

<xsl:template match="/">
	<xsl:apply-templates select="document($exported-flextext)/document"/>
</xsl:template>

<xsl:template match="node()|@*">
  <xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

<xsl:template match="phrase/item[@type='gls']">
	<xsl:variable name="guid"><xsl:value-of select="../@guid"/></xsl:variable>
	<xsl:variable name="translation"><xsl:value-of select="$translation-phrases[@guid=$guid]/item[@type='gls' and @lang=$writing-system]/text()"/></xsl:variable>
	<xsl:choose>
		<xsl:when test="@lang=$writing-system and string-length($translation) != 0">
			<item type="gls">
				<xsl:attribute name="lang"><xsl:value-of select="$writing-system"/></xsl:attribute>
				<xsl:value-of select="$translation"/>
			</item>
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>