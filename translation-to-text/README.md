# translation-to-text.xsl

## Introduction
This XSL transformation extracts the translation -- or phrase-level gloss -- from a FlexText file, and puts it into a plain text file

## Parameters
_writing-system_ : The writing system of the translation (phrasal gloss) to be extracted.
	
## Example
This XSL is used to transform SA02.flextext into SA02.txt.

## Example of using this file with xsltproc
```
xsltproc --param writing-system "'prd-Arab'" -o SA02.txt translation-to-text.xsl SA02.flextext
```