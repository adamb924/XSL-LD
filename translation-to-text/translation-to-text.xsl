<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="text" encoding="UTF-8" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:param name="writing-system">prd-Arab</xsl:param>

<xsl:template match="/document/interlinear-text/paragraphs/paragraph/phrases/phrase/item[@type='gls']">
<xsl:if test="@lang=$writing-system">
<xsl:value-of select="text()"/><xsl:text>
</xsl:text>
</xsl:if>
</xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>