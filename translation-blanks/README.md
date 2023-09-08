# translation-blanks.xsl

## Introduction
This XSL transformation finds blank translations (or phrasal glosses) in FlexText files.

## Parameters
_writing-system_ : The writing system of the translations (phrasal glosses) to check.
	
## Example
This XSL is used to transform SA02.flextext into SA02.txt. The text file then has a list of lines with blank translations in the given writing system.

## Example of using this file with xsltproc
```
xsltproc --param writing-system "'prd-Arab'" -o SA02.txt translation-blanks.xsl SA02.flextext
```