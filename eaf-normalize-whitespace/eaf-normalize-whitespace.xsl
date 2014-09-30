<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="ANNOTATION_VALUE">
			<ANNOTATION_VALUE><xsl:copy-of select="@*"/><xsl:value-of select="normalize-space(text())"/></ANNOTATION_VALUE>
</xsl:template>

<xsl:template match="node()|@*">
  <xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>