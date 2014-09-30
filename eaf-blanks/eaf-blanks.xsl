<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="text" encoding="UTF-8" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="ALIGNABLE_ANNOTATION">
<xsl:if test="string-length(ANNOTATION_VALUE/text()) = 0">Blank (<xsl:value-of select="../ALIGNABLE_ANNOTATION/@ANNOTATION_ID"/>)
</xsl:if>
</xsl:template>

<xsl:template match="node()|@*">
		<xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>