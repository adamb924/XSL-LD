# remove-abg.xsl

## Introduction
This XSL transformation removed all XML elements from the 'http://www.adambaker.org/gloss.php' namespace (i.e., abg:). That is, it removes everything from a FlexText file that is specific to Gloss.

## Parameters
There are no parameters.

## Example
The XSL file is used to transform SA02.flextext into SA02-output.flextext.

## Example of using this file with xsltproc
```
xsltproc -o SA02-output.flextext remove-abg.xsl SA02.flextext
```