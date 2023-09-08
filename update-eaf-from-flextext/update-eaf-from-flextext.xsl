<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:str="http://exslt.org/strings" xmlns:set="http://exslt.org/sets" extension-element-prefixes="str fn set">
<xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:param name="flextext"></xsl:param>
<xsl:param name="writing-system">wbl-Arab-AF</xsl:param>

<xsl:variable name="phrases" select="document($flextext)/document/interlinear-text/paragraphs/paragraph/phrases/phrase"/>
<xsl:variable name="phrase-count" select="count(/ANNOTATION_DOCUMENT/TIER/ANNOTATION)"/>

<xsl:template match="/">
	<xsl:if test="$phrase-count != count($phrases)">
		<xsl:message terminate="yes">The number of lines in the flextext file does not match the number of lines in the Elan file. Something must be wrong.</xsl:message>
	</xsl:if>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="ANNOTATION">
	<xsl:variable name="thisposition" select="position()"/>
	<ANNOTATION>
		<ALIGNABLE_ANNOTATION>
			<xsl:copy-of select="ALIGNABLE_ANNOTATION/@*"/>
			<ANNOTATION_VALUE><xsl:apply-templates select="$phrases[position() = $thisposition]" mode="flextext"/></ANNOTATION_VALUE>
		</ALIGNABLE_ANNOTATION>
	</ANNOTATION>
</xsl:template>

<xsl:template match="node()|@*">
  <xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

<xsl:template match="phrase" mode="flextext">
	<!-- a little added complexity here to avoid an extraneous space -->
	<xsl:variable name="how-many-words" select="count(words/word)"/>
	<xsl:apply-templates select="words/word[position() &lt; $how-many-words]/item[@lang=$writing-system]/text()" mode="flextext"/>
	<xsl:apply-templates select="words/word[last()]/item[@lang=$writing-system]/text()" mode="flextext-nospace"/>
</xsl:template>

<xsl:template match="text()" mode="flextext"><xsl:value-of select="."/><xsl:text> </xsl:text></xsl:template>
<xsl:template match="text()" mode="flextext-nospace"><xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>