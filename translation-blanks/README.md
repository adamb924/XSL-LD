# translation-blanks.xsl

## Introduction
This tells you whether there are any blank phrase-level translations/glosses in a FlexText file (.flextext), for a given language. When you put a FlexText file through this XSL, if there are no blanks in the phrase-level glosses for the writing system, then there is no output. If there are blanks, a file is created with as many lines with the word “Blank” as there are blank translations in the file. (This is not very helpful output; the idea is to identify the files with blanks in them by looking for the presence or absence of an output file.)

## Parameters
_writing-system_ : The writing system of the translations (phrasal glosses) to check.
	
## Example
This XSL is used to transform SA02.flextext into SA02.txt. The text file then has a list of lines with blank translations in the given writing system.

## Example of using this file with xsltproc
```
xsltproc --param writing-system "'prd-Arab'" -o SA02.txt translation-blanks.xsl SA02.flextext
```