<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:abg="http://www.adambaker.org/gloss.php" version="1.0">

<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/> 

<xsl:strip-space elements="*"/>

<xsl:param name="export-configuration">C:/Users/Adam/Documents/XSL/flextext2html-schema.xml</xsl:param>

<xsl:variable name="configuration" select="document($export-configuration)/flextext2html-configuration"/>
<xsl:variable name="meta-writing-system" select="$configuration/meta-language/@lang"/>
<xsl:variable name="title" select="/document/interlinear-text/item[@type='title' and @lang=$meta-writing-system]/text()"/>
<xsl:variable name="first-line-writing-system" select="/document/interlinear-text/languages/language[@lang=$configuration/line[1]/@writing-system]"/>


<xsl:template match="/">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
<html>
<head>
<meta charset="utf-8" />
<title><xsl:value-of select="$title"/></title>
<style>
@media print  
{
    div.phrase {
        page-break-inside: avoid;
    }
}
div.text {
	direction: <xsl:choose><xsl:when test="$first-line-writing-system/@RightToLeft = 'true'">rtl</xsl:when><xsl:otherwise>ltr</xsl:otherwise></xsl:choose>;
}
div.phrase {
	display: flex;
	flex-wrap: wrap;
	margin-top: 1.5em;
}
div.word {
}
div.word span {
	display: block;
	margin-right: 0.5em;
}
div.line-number {
	display: block;
	margin-right: 0.5em;
}
.gls {
	font-style: italic;
}
<xsl:apply-templates mode="writing-systems" select="/document/interlinear-text/languages/language"/>
</style>
</head>
<body>
<h1><xsl:value-of select="$title"/></h1>
<xsl:text>&#xa;</xsl:text>
<div class="text"><xsl:text>
</xsl:text><xsl:apply-templates/>
</div>
</body>
</html>
</xsl:template>

<xsl:template match="/document/interlinear-text/paragraphs">
	<div class="paragraphs">
		<xsl:apply-templates/>
	</div>
</xsl:template>

<xsl:template match="/document/interlinear-text/paragraphs/paragraph">
<xsl:text>&#xa;</xsl:text>
	<div class="paragraph">
		<xsl:apply-templates/>
	</div>
</xsl:template>

<xsl:template match="/document/interlinear-text/paragraphs/paragraph/phrases">
<xsl:text>&#xa;</xsl:text>
	<div class="phrases">
		<xsl:apply-templates/>
	</div>
</xsl:template>

<xsl:template match="/document/interlinear-text/paragraphs/paragraph/phrases/phrase">
<xsl:text>&#xa;</xsl:text>
	<div class="phrase">
		<div class="line-number">(<xsl:value-of select="count(preceding::phrase|.)"/>)</div>
		<xsl:apply-templates/>
	</div>
	<xsl:if test="words/word/abg:annotation[@key='English translation']">
		<ul>
		<xsl:apply-templates select="words/word/abg:annotation[@key='English translation']" mode="annotation-processor"/>
		</ul>
	</xsl:if>
</xsl:template>

<xsl:template match="/document/interlinear-text/paragraphs/paragraph/phrases/phrase/words/word">
	<xsl:variable name="word-node" select="."/>
	<xsl:text>&#xa;</xsl:text>
	<div>
		<xsl:choose>
			<xsl:when test="item[@type='punct']">
				<xsl:attribute name="class">punct</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="class">word</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:for-each select="$configuration/line">
			<xsl:choose>
				<xsl:when test="@type='gls' or @type='txt' or @type='punct'">
					<span>
						<xsl:attribute name="class"><xsl:value-of select="@writing-system"/><xsl:text> </xsl:text><xsl:value-of select="@type"/></xsl:attribute>
						<xsl:value-of select="$word-node/item[@lang = current()/@writing-system and (@type = current()/@type or @type = 'punct')]"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="$word-node/morphemes[@*[local-name()='lang' and namespace-uri()='http://www.adambaker.org/gloss.php'] = current()/@baseline-writing-system]" mode="morpheme-processor">
						<xsl:with-param name="writing-system" select="@display-writing-system"/>
						<xsl:with-param name="type" select="@line-type"/>
					</xsl:apply-templates>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>&#xa;</xsl:text>
		</xsl:for-each>
	</div>
</xsl:template>

<!-- Begin morphological analysis output templates -->
<xsl:template match="morphemes" mode="morpheme-processor">
	<xsl:param name="writing-system"/>
	<xsl:param name="type"/>
	<span>
		<xsl:attribute name="class">ma <xsl:value-of select="$writing-system"/><xsl:text> </xsl:text><xsl:value-of select="$type"/></xsl:attribute>
		<xsl:apply-templates select="morph/item[@lang=$writing-system and @type=$type]" mode="morpheme-processor"/>
	</span>
</xsl:template>

<xsl:template match="item" mode="morpheme-processor">
	<xsl:value-of select="."/>
	<xsl:if test="parent::morph/following-sibling::morph">
<!--
	(<xsl:value-of select="parent::morph/following-sibling::morph/@type"/>)
-->
		<xsl:choose>
			<xsl:when test="parent::morph/following-sibling::morph[1]/@type = 'Proclitic' or parent::morph/following-sibling::morph[1]/@type = 'Enclitic'">=</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:if>
</xsl:template>
<!-- End morphological analysis output templates -->

<xsl:template match="item" mode="word-processor">
<xsl:text>&#xa;</xsl:text>
	<span>
		<xsl:attribute name="class"><xsl:value-of select="@lang"/><xsl:text> </xsl:text><xsl:value-of select="@type"/></xsl:attribute>
		<xsl:value-of select="text()"/>
	</span>
</xsl:template>

<xsl:template match="abg:annotation" mode="annotation-processor">
	<li><xsl:value-of select="."/></li>
</xsl:template>

<xsl:template match="/document/interlinear-text/languages/language" mode="writing-systems">
.<xsl:value-of select="@lang"/> {
	font-family: <xsl:value-of select="@font"/>;
	font-size: <xsl:value-of select="@*[local-name()='font-size' and namespace-uri()='http://www.adambaker.org/gloss.php']"/>pt;
	direction: <xsl:choose><xsl:when test="@RightToLeft='true'">rtl</xsl:when><xsl:otherwise>ltr</xsl:otherwise></xsl:choose>;
	text-align: <xsl:choose><xsl:when test="$first-line-writing-system/@RightToLeft = 'true'">right</xsl:when><xsl:otherwise>left</xsl:otherwise></xsl:choose>;
}
</xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>