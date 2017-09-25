# csas-style
Latex style files for CSAS research documents

## Branches

**temp** - Andy updating .sty and including a .bst. Separate branch from master so as to not mess up the Herring assessment.

## Files

**res-doc.sty** - formatting style file 

**res-doc.bst** - bibliography style file

**resDoc-rh.bst** - this contains code by Rowan Haigh to underline hyperlinks in url or doi fields from your .bib file. Andy does not use these, and so can't really test them. If you want to use them then do a diff on this and **res-doc.bst** and then include the extra bits of code and test it before sharing. Some stuff is commented out and I'm not sure if it has to be.

## Bibliography

1. May need to re-order some multi-author papers. See
Issue #4. 

1. Doing http:// links (CSAS wants them to be live and clickable) seems to work automatically when you make a .pdf. They don't have to be underlined. Though I think that has since changed and they don't want the http text visible (just alternate text). For Redbanded I've just taken them all out of the bibliography. People can Google.

1. For Redbanded Rockfish assessment, the .bbl file incorrectly strips out hyphens in hyphenated first names. Doing manually for Redbanded in for Lecomte (2013), both J.-B. and M.-P. Maybe just a quirk of my .bib file, so not making a full Issue. Other .bst files don't seem to mess this up.

### Tips and tricks

Partly from doing Redbanded Rockfish formatting edits:

1.\sum seemed to cause encoding issues in the final .pdf, so have created 
	
	\renewcommand{\sum}{{\mathlarger{\mathlarger{\mathlarger{\Sigma}}}}}

as a workaround, which isn't ideal but works. Can't use in $..$. Needs \usepackage{relsize}


2.To test the encoding part of Web Accessibility (in Adobe Acrobat XI Pro):

View-Tools-Accessibility (Alt V T A)

Accessibility window: Full Check, Start

Document - Right-click Tagged - Fix - 'Some difficult pages' okay

Page Content - expand - Character Encoding shows ones that aren't encoded. Try and fix (have to do in tex not the .pdf; not sure what to do with Chris's current ones). 'A few' are okay with CSAS.

3.Tables that break across pages - may or may not be allowed to have the \longtable footer and subsequent header. Brittany is checking.

4.No dotted lines in Tables or (I think) vertical lines.

5.No side-by-side figures with separate captions; i.e. must all be the same figure. See \twofigRHb in Redbanded.

6.Need Chris's template for properly making Table of Contents and labelling Appendices. He keeps that in Latex and so gets the Abstract translation and puts that into .tex.

7. Personal communications need a work location also; e.g. (Stephen Wischniowski, Pacific Biological Station, DFO, Nanaimo, BC, pers.~comm.)



