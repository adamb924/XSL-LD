# text-from-flextext.xsl

## Introduction
This XSL transformation extracts the text of a FlexText and creates a plain text file.

## Parameters
- _writing-system_ : The writing system of the text to be extracted.
- _export-configuration_ : Either 'txt' or 'gls'. This indicates whether text forms or glosses ought to be extracted.

## Example
This XSL is used to transform SA02.flextext into SA02.txt.

## Example of using this file with xsltproc
```
xsltproc --param writing-system "'isk-Qaaa-AF-fonipa-x-Zipa'" --param type "'txt'" -o SA02.txt text-from-flextext.xsl SA02.flextext
```