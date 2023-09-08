<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:exsl="http://exslt.org/common"
                extension-element-prefixes="exsl">

<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:param name="title-language">en</xsl:param>

<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="interlinear-text">
	<xsl:variable name="filename" select="concat(item[@type='title' and @lang=$title-language]/text(),'.flextext')"/>
	<exsl:document href="{$filename}" method="xml" indent="yes">
		<document version="2">
			<interlinear-text>
				<xsl:attribute name="guid"><xsl:value-of select="@guid"/></xsl:attribute>
				<xsl:copy-of select="*"/>
			</interlinear-text>
		</document>
	</exsl:document>
</xsl:template>

</xsl:stylesheet>