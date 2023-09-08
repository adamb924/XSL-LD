# split-flextext.xsl

## Introduction
If you export multiple texts from Language Explorer, they all get put into a single .flextext file. split-flextext.xml splits the files so that each is in a separate .flextext file. For instance, I exported a bunch of texts from Language Explorer into a single file called batch.flextext. Then I used this XSL transformation, and it was split into 24 files—one for each text—with names like WA002.flextext, WA029.flextext, WA042.flextext, etc.

The reason this is a useful file is because for many applications you would want each interlinear text in a separate file, but Language Explorer will not do that for you automatically. It makes me cringe to think of exporting each text separately...

## Parameters
_title-language_ : The name of the new file will be taken from the text's title, in the language specified by this tag. (In Language Explorer, there can be multiple titles for a text, for different languages and writing systems.)

## Example of using this file with xsltproc
```
xsltproc --param title-language "'en'" split-flextext.xsl myfile.flextext
```