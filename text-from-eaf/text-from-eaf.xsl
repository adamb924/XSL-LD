<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:strip-space elements="*"/> 

<xsl:param name="tier">default</xsl:param>

<xsl:template match="/ANNOTATION_DOCUMENT">
	<xsl:apply-templates select="TIER[@TIER_ID=$tier]" mode="tier"/>
</xsl:template>

<xsl:template match="TIER" mode="tier">
	<xsl:variable name="how-many-annotations" select="count(ANNOTATION)"/>
	<xsl:apply-templates select="ANNOTATION[position() &lt; $how-many-annotations]/ALIGNABLE_ANNOTATION/ANNOTATION_VALUE/text()" mode="text"/>
	<xsl:apply-templates select="ANNOTATION[last()]/ALIGNABLE_ANNOTATION/ANNOTATION_VALUE/text()" mode="text-nospace"/>
</xsl:template>

<xsl:template match="text()" mode="text"><xsl:value-of select="."/><xsl:text>
</xsl:text></xsl:template>
<xsl:template match="text()" mode="text-nospace"><xsl:value-of select="."/></xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>