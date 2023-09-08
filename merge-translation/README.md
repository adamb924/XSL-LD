# merge-translation.xsl

## Introduction
My language helper uses FreeTranslator to translate text in FlexText files (.flextext). He works with separate .flextext files for each text, like WA001.flextext, WA002.flextext, etc. (It is easier for him to use FreeTranslator than for me to train him to use Language Explorer, which would require my understanding Language Explorer.) But then I want to put those translations back into Language Explorer.

1. Export all texts from Language Explorer to a single .flextext file.
2. Merge the translations from individual .flextext files (WA001.flextext, WA002.flextext, etc.) into that file.
3. Import that .flextext file into Language Explorer.

This XSL merges the results from a .flextext file with a translation file, into the larger .flextext file (which was exported from Language Explorer).

## Parameters
- _exported-flextext_ : The filename of the file containing all of the exported texts from Language Explorer (a .flextext file).
- _writing-system_ : The writing system of the translations.

## Example of using this file with xsltproc
```
xsltproc -o export-output.flextext' --param writing-system "'prd-Arab'" --param exported-flextext "'export.flextext'" merge-translation.xsl WA002.flextext
```