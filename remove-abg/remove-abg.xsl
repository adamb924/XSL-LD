<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:abg="http://www.adambaker.org/gloss.php">
<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:template match="node()|@*">
	<xsl:copy>
		<xsl:apply-templates  select="@*|node()"/>
	</xsl:copy>
</xsl:template>

<xsl:template match="abg:*"></xsl:template>
<xsl:template match="@*[namespace-uri() = 'http://www.adambaker.org/gloss.php']"></xsl:template>

</xsl:stylesheet>