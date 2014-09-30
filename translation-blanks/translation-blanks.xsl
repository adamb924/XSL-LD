<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="text" encoding="UTF-8" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:param name="writing-system">prd-Arab</xsl:param>

<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="phrase/item[@type='gls']">
<xsl:if test="@lang=$writing-system and string-length(text()) = 0">Blank (<xsl:value-of select="count( ancestor::paragraph/preceding-sibling::paragraph ) + 1"/><xsl:text>)
</xsl:text></xsl:if>
</xsl:template>

<xsl:template match="node()|@*">
		<xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>