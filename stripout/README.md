# stripout.xsl

## Introduction
This XSL removes all of the text from from a FlexText (.flextext) file, except that of the writing system you specify.

## Parameters
_except_ : This is the writing system from the .flextext file that you want to keep. All others will be discarded.

## Example
The xsl file is used to transform `SA02.flextext` into `SA02-ipa.flextext`. We only want to keep items from the `isk-Qaaa-AF-fonipa-x-Zipa` writing system.

## Example of using this file with xsltproc
```
xsltproc -o SA02-ipa.flextext --param except "'isk-Qaaa-AF-fonipa-x-Zipa'" stripout.xsl SA02.flextext
```