# update-eaf-from-flextext.xsl

## Introduction
This XSL takes the text from a FlexText file (.flextext) and puts it into an Elan annotation file (.eaf). For this to work, there need to be the same number of “phrases” in the FlexText file (i.e., lines of text in the Language Explorer interface) as there are annotations in the Elan file.

In my project, text is first entered in to Elan, and then is moved over to Language Explorer. If I update the baseline text in Language Explorer (i.e., correcting a typo), I want to be able to put those changes back into the Elan file. Hence this XSL.

NB: This XSL file makes an assumption that is valid for my project: that there is only one transcription tier. If that were not true, terrible things would happen.

## Parameters
- _flextext_ : This is the filename or path to the .flextext file which you want to update your Elan file.
- _writing-system_ : This is the writing system from the .flextext file that you want to put into the Elan file. Since .flextext files have multiple writing systems, you need to choose which to put into the Elan file. 

## Example of using this file with xsltproc
```
xsltproc -o WA112-update.eaf --param flextext "'WA112.flextext'" --param writing-system "'wbl-Arab-AF'" update-eaf-from-flextext.xsl WA112.eaf
```