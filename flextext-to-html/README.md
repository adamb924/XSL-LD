# flextext-to-html.xsl

## Introduction
This XSL transformation converts a FlexText file into an HTML 5 document. ("HTML 5" means you'll need a reasonably modern browser for it to look right.)

## Parameters
_export-configuration_ : This is the location of an XML configuration file.

## Example
flextext-to-html.xsl is used to transform SA02.flextext into SA02.html. The parameters for doing this are in configuration.xml.

## Example of using this file with xsltproc
```
xsltproc --param export-configuration "'C:/Users/Adam/Documents/XSL-LD/flextext2html/configuration.xml'" -o SA02.html flextext-to-html.xsl SA02.flextext
```