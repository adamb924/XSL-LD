# eaf-blanks.xsl

## Introduction
This XSL transformation checks an EAF file for any blanks intervals, and prints a list of the annotation ids of blank intervals. (This can often correspond to interval numbers.) If there are no blanks then there is no output; or the output is empty.

## Parameters
There are no parameters.

## Example
The xsl file is used to transform WA039.eaf into WA039.txt. WA039.txt indicates two intervals that have empty annotations.

## Example of using this file with xsltproc
```
xsltproc -o WA039.txt eaf-blanks.xsl WA039.eaf
```