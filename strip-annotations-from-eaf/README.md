# strip-annotations-from-eaf.xsl

## Introduction
This XSL transformation removes the text of all the annotations from an EAF file. The intervals themselves are left intact; only the text is removed. (This is helpful, for instance, if you quickly segment a file in Elan, but have a few odd keystrokes in the file.)

## Parameters
There are no parameters.

## Example
The xsl file is used to transform WA039.eaf into WA039-output.eaf.

## Example of using this file with xsltproc
```
xsltproc -o WA039-output.eaf strip-annotations-from-eaf.xsl WA039.eaf
```