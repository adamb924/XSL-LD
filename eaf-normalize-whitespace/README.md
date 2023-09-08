# eaf-normalize-whitespace.xsl

## Introduction
Language helpers who are new to computers often have strange intuitions about the proper use of whitespace. This XSL transformation fixes the whitespace in EAF files: stripping out whitespace at the beginning and end of an interval, and replacing every sequence of spaces with a single space.

## Parameters
There are no parameters.

## Example
The xsl file is used to transform WA039.eaf into WA039-output.eaf. (The first two intervals, at least, are fixed.)

## Example of using this file with xsltproc
```
xsltproc  -o WA039-output.eaf eaf-normalize-whitespace.xsl WA039.eaf
```