<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:param name="except">wbl-Qaaa-AF-fonipa-x-Zipa</xsl:param>
<xsl:strip-space elements="*"/> 

<xsl:template match="@* | node()">
	<xsl:copy>
		<xsl:apply-templates select="@* | node()"/>
	</xsl:copy>
</xsl:template>

<xsl:template match="word">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="item[@lang = $except]"/>
		</xsl:copy>
</xsl:template>

</xsl:stylesheet>