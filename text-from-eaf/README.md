# text-from-eaf.xsl

## Introduction
This XSL transformation extracts the text from an EAF file, producing a plain text file.

## Parameters
_tier_ : This is the name of the tier from which to extract text.

## Example
The xsl file is used to transform WA039.eaf into WA039.txt.

## Example of using this file with xsltproc
```
xsltproc --param tier "'default'" -o WA039.txt text-from-eaf.xsl WA039.eaf
```