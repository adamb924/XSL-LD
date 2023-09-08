<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:strip-space elements="*"/> 

<xsl:param name="writing-system">wbl-Qaaa-AF-fonipa-x-Zipa</xsl:param>
<xsl:param name="type">txt</xsl:param>
<xsl:param name="include-punct">true</xsl:param>
<xsl:param name="no-space-following">true</xsl:param>

<xsl:template match="*">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="phrase">
	<xsl:apply-templates/><xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="word">
	<xsl:apply-templates select="item[@type=$type and @lang=$writing-system]/text()" mode="text"/>
</xsl:template>

<xsl:template match="text()" mode="text">
	<xsl:value-of select="."/>
	<xsl:if test="$include-punct = 'true'">
		<xsl:value-of select="ancestor::word/following-sibling::word[1]/item[@type='punct']/text()"/>
	</xsl:if>
	<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>