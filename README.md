# csas-style
Latex style files for CSAS Research Documents

# Checklist

For final CSAP submission of Research Document, check the points in **Bibliography** and **Further CSAS rules** below.

## Branches

**temp** - Andy updating .sty and including a .bst. Separate branch from master so as to not mess up the Herring assessment.

**bit-testing** [typo - was meant to be **bib-testing**] - Andy creating off **temp**, to create a minimal working example to demonstrate the ordering of multi-author papers. Sean will have a stab at fixing the order (Issue #4). Done. 

## Files

**res-doc.sty** - formatting style file 

**res-doc.bst** - bibliography style file

**resDoc-rh.bst** - this contains code by Rowan Haigh to underline hyperlinks in url or doi fields from your .bib file. Andy does not use these as they are not required by CSAS (but be consistent in using or not using them), and so can't really test them. If you want to use them then do a diff on this and **res-doc.bst** and then include the extra bits of code and test it before sharing. Some stuff is commented out and I'm not sure if it has to be. See <https://github.com/andrew-edwards/pop-5ABC-17/issues/16> for how Andy compared various version of files.
	
**resDocSty-rh.sty** - Rowan's style file which has code that might be required for underlining hyperlinks. Putting here for reference in case someone wants to include it in **res-doc.sty**. Also has info on a font issue that someone cared about in around ~2015 but then isn't important now - Andy not including it **res-doc.sty** in case it messes up other stuff. 

**bib-test/test.tex** - test file to demonstrate and fix issue #4.

## Bibliography

1. May need to re-order some multi-author papers. See
Issue #4. **Fixed**.

1. If you want clickable web links see **resDoc-rh.bst** above, and the hyperlink rule below. 

1. For Redbanded Rockfish assessment, the .bbl file incorrectly strips out hyphens in hyphenated first names. See Issue #5. If not fixed then check yourself (and just edit your **.bbl** file if necessary). 

## Web accessibility check

1. To automatically add alternative text to figures in latex, use (this will go into a minimal working example at some point):

        \begin{figure}
        \centering 
        \pdftooltip{
           \includegraphics[width=\histsize]
                           {filename.png}}
           {Figure~\ref{fig:PRsealevel}}
        \caption{As for Figure \ref{fig:epnp} but for Model 2, for which $\beta_1$ represents the influence of the sea level at Prince Rupert on recruitment.}
        \label{fig:PRsealevel} 
        \end{figure}

  
    The ```\ref{fig:...}``` is the alternate text that gets inserted by ```\pdftooltip```.

1. To test the encoding part of Web Accessibility (in Adobe Acrobat XI Pro):

	View-Tools-Accessibility (Alt V T A)

	Accessibility window: Full Check, Start

	Document - Right-click Tagged - Fix - 'Some difficult pages' okay

	Page Content - expand - Character Encoding shows ones that aren't encoded. Try and fix (have to do in tex not the .pdf; not sure what to do with Chris's current ones). 'A few' are okay with CSAS (10 per 100 pages - see below).

2. Combining two latex .pdf's in Adobe seemed to lose information, but (after doing the above steps) this works:
	
	Pages - Insert from file

    seems to retain it (at least for Andy's two POP 2017 appendices).

Two issues that still get flagged are

 - Figures alternate text. However the text is there from using \pdftooltips and gets correctly read out by Adobe read-out-loud, so hopefully this is okay.
 - Headings - Appropriate nesting; if important is probably an easy manual fix at the end (to do with Appendix title and then first section title).

Failed 'Primary language' and 'Title' are okay - easy to add in manually at the end by CSAP.

## Further CSAS rules

Partly from doing Redbanded Rockfish formatting edits:

1. Arrowtooth Flounder went through as a full latex document. Others, such as Redbanded Rockfish, have been a mixture of Word and Latex (which is a bit more fiddly). If you have to have a mixture then CSAS prefers, say, pages 1-100 to be Word and then pages 101-150 to be Latex (i.e. just one chunk of each). 

1. Tables that break across pages - may or may not be allowed to have the \longtable footer and subsequent header. Brittany is checking (but has now left). Not sure of current status of this.

1. No dotted lines in Tables or (I think) vertical lines.

1. No side-by-side figures with separate captions; i.e. must all be the same figure.

1. Need Chris's template (from Arrowtooth or Herring presumably) for properly making Table of Contents and labelling Appendices. He keeps that in Latex and so gets the Abstract translation and puts that into .tex, so no Word files at all.

1. The rules are that if you have hyperlinks (anywhere) in your document then the web address is *not* spelled out, so use ```\href``` in latex, for example

         available from \href{http://www.cpc.ncep.noaa.gov}{NOAA}

     They are not required for the references (so it's easiest to leave them out, though see resDoc-rh.bst above if you want them). 

1. Personal communications need a work location also; e.g. (Stephen Wischniowski, Pacific Biological Station, DFO, Nanaimo, BC, pers.~comm.)

1. Postscript files (**.eps**) caused issues with screen readers reading out the axes labels etc. Seems that **.png** do not, so use those instead with **\includegraphics**. Damn - **.pdf** apparently don't work either. Andy now using **pdflatex** (and viewing in ghostview) rather than **latex** and **dvips**. And to convert existing **.pdf** files to **.png** this is working fine, using ImageMagick:

		magick convert -density 600 plot_Y_obs.pdf plot_Y_obs.png

	Resolution almost as good as **.pdf**, with the resulting **.png** only 62kB. Works for converting **.eps** also.

## Notes and email from Brittany (ex-CSAP formatting expert) 

**Andy just copying these and briefly editing here for now so that we have one copy. Will need tidying up, and some things have likely been automatically fixed with our .sty file.**

### Brittany's email to Andy on 11th May 2017, regarding advice/rules for latex authors, with edits by Andy in [..]:

Last year the CSAP office made the decision to no longer accept LaTeX documents. However, through discussion with several authors, we understand that using LaTeX is important for the credibility of scientific reports and is much easier for authors to work with. 

Through thorough discussion, in hopes of finding a compromise, the CSAP and CSAS office have agreed upon several non-negotiable conditions for LaTeX submission. We hope that having these conditions met will reduce time and frustration for both offices, as well as increase the accessibility of these documents for all readers. We understand that it may initially take some adjusting and extra effort for authors, but these conditions are necessary for publication by the Canadian Science Advisory Secretariat.


1.	Authors MUST use the LaTeX template made by Andrew Edwards, no exceptions. If the LaTeX document has not used the template with the correct CSAS formatting, then it will be sent back to the author to contact Andrew. Keep in mind that using the template does not necessarily mean no changes will need to be made to the document; however, it will greatly minimize tedious changes such as bulleted lists, font sizes, indentations etc. [So this is now the .sty in this current repository - Chris and I are sharing the .sty files and putting the rules here so you can check them yourselves, and will obviously help out but don't want to be checking formatting from various documents. There was a Res Doc submitted that didn't use our earlier .sty file and this caused a lot of extra work for everyone. So **use the .sty file from the start, with a minimal working example (not hosted here yet, get one from Chris)**.

2.	Documents must be made web accessible—whatever that entails. Documents published by the Canadian Science Advisory Secretariat must be accessible to everyone, that includes people with visual impairments. LaTeX documents are not inherently web accessible and thus take a lot of time and effort to ensure they conform to the Government of Canada web accessibility guidelines and standards.  Once a LaTeX document is in PDF form it is manually made web accessible by the CSAP office, which can be time consuming  and sometimes not intuitive. As well, if the PDF needs to be regenerated by the author to make corrections or changes in the coding, the document must be made web accessible all over again. As of right now, the only web accessibility change that authors are responsible for is correcting character encoding errors. This is because they cannot be done in adobe, but must be done by altering the original coding. Instructions on how to check for these in adobe, as well as common problems/solutions, are included in the attached document. Authors may be asked to assist in completing other parts of the web accessibility check if there are many errors produced.
 [I think some of these problems occur for Word as well (and I think equations have to be manually made web accessible in Word but seem to mostly be fine in Latex). Hopefully there are some methods to automate this -- see Issue #3.] 
 
3.	Authors must be willing to communicate frequently with the CSAP office. It is difficult to ensure that the final PDF conforms to the CSAS publication guidelines and  requires quite  a bit of back of forth between the author and CSAP office to ensure the document meets all the publication requirements in terms of style and formatting. This can delay publication for months at a time and prompt responses can make all the difference. Please also keep in mind that formatting changes sent back to the author are not suggestions, they are mandatory changes. [This should be less of an issue provided we all use the same **.sty** file (and update it if necessary) and conform to the rules].
 
4.	A mix of LaTeX and Word is strongly discouraged. Most documents in the past have required piecing together Word and LaTeX components which can be time consuming , especially if this needs to be done more than once if corrections are made to the document. This also causes multiple accessibility errors such as corruption of the "reading order"(the order in which a screen reader reads a document), which is extremely time  consuming to fix. If this is entirely unavoidable (i.e., you have only one LaTeX appendix), then ALL other non-LaTeX parts must be submitted as one complete Word document, and vice versa. Page numbers may need to be updated in the LaTeX component after Word formatting is completed. [Another reason to do just LaTeX].
 
5.	FYI. Another hurdle we have encountered is that due to a formal complaint, the Government of Canada is considering translating all documents published by the Canadian Science Advisory Secretariat. Our translation service will translate pdf documents for us, but will charge us 55$ per hour for desktop publishing, as they will have to reformat the document for us. This is still up in the air and we are unsure if this is feasible, but it further enforces the need for a unionized LaTeX template.

If you have questions about web accessibility for LaTeX documents, please contact the CSAP Office. Please also note that this list is a working list, and as we encounter issues and discover solutions we will continue to alter it, but for now, these are the baseline requirements for LaTeX submission.

### Brittany's file called **WebAccessibilityInAdobe_CSAP_11May2017.docx** 

was with the above email and said the following (some of which is likely repeated/fixed above, and I've quickly annotated some of it):

How to Complete a Web Accessibility Check in Adobe

1.	To view accessibility in the tool bar, go to View > tools > accessibility
2.	Next, go to tools on the right hand side and expand the accessibility pane.
3.	Click full check and use the default settings, press start checking
4.	See Common Web Accessibility Errors and Fixes below for more information


Background on PDF conversion and tags
 
When a document is converted from a Word or LaTeX file to a PDF, Adobe automatically attaches tags to various parts of the document so that a screen reader not only reads what's on each page, but interprets this information as well. For example tags allow a screen reader to tell the individual "This is a Header", "this is a figure", "this is a table header row", etc) so the person hearing it knows what type of content is being read and in what context. This is what web accessibility does, it allows a screen reader to point out what can't be seen by someone who is visually impaired.
 
During conversion to PDF sometimes part of this tagging does not happen properly (adobe may not know how to interpret certain elements and does not apply a tab) and an error occurs. We can fix most of these in the PDF version once they are identified as errors during a web accessibility check.
 
Common Web Accessibility Errors and Fixes
 
1. Tagged PDF - Failed: This means tags have not be automatically applied to the various parts of the document  and comes up with pretty much all LaTex documents. This should be the first error you fix, BEFORE looking at your character encoding errors.

	a. Right click on the error and click "fix" and tags with automatically be applied.  DO THIS BEFORE YOU LOOK AT OR FIX ANY OTHER ERRORS as once this is fixed many other web accessibility errors will also be resolved at the same time.

1.	Primary Language and Title Failed:  This will appear for all PDF conversions (LaTeX and Word) and means a (proper) title and primary language need to be assigned to the document. 

	a.	Fix this once all the documents are combined. 
	
	b.	Right click on Primary Language an click fix, then select English as the primary language
	
	c.	For Title failed click on File (in Menu bar) then Properties. In the dialogue box that appears paste the name of the res doc in the Title field.

3.	Character encoding error - these cannot be fixed in adobe and need to be fixed in the original coding for the document. For example, Andy and I fixed several character encoding errors linked with a sigma symbol. In his latex coding he had written "\sum" which produced a sigma character when the document was converted to pdf. Andy changed his Latex coding to identify "\sigma" instead of just putting "\sum" [Chris now has a better fix - we can stick with \sum]. This fixed the character encoding errors in the pdf. As these errors can be difficult to fix, I discussed with CSAS and they said they will accept a certain number of character encoding errors based on the length of the document. We tentatively agreed to **less than 10 errors per 100 pages**; however, this is a guideline and CSAS may still refuse to accept it with this amount depending on what the errors are linked to. NOTE: Do not forget to fix the tagged pdf- failed before dealing with your character encoding errors. [So it's worth us figuring out a proper fix, such as the \sum one].


4.	Failed tagged annotations: This means one or more elements (annotations) of the PDF were not automatically tagged when converting to PDF.

	a.	Right click and click "show in the content panel" where the failed annotation link element is listed. 

	b.	Right click on the element and select "Find" then in the window that opens select "unmarked annotations" followed by "Search Document" and click "Find". Then click "Tag Element" and select the appropriate tag. If it lands on a page number or text I usually select "Note" as this seems to be the closest descriptor. Once you are finished tagging all the unmarked annotations, go back to the web accessibility check, right click on the error and press "check again" to ensure you caught them all

5.	Table - Headers Failed: This means that the header row for one or more tables has not been identified. To fix right click on the error (the Element) and select "show in tags panel" . The table you want will be highlgihted in the tags panel, you can expand it to see the rows which are signified as TR. Expand the first TR in the list and right click on each TD. Go to properties and change Table Data Cell to Table Header Cell. Do this for all the "TDs" under this "TR". After correcting check to ensure the error no longer appears  (go back to the web accessibility check, right click on the error and press "check again"). [This sounds to me like a Word thing maybe?]

6.	Headings - Appropriate Nesting Failed: This means that one or more headings does not nest within the above it (eg. A heading has been skipped - for example Heading 1 is first and the heading after it has been tagged as Heading 3 or 4 as instead of Heading 2.
a.	You can use the Touch Up Reading Order function under Tools/Accessibility to select the Heading(s) in question and assign them the proper heading name.  Select the Heading/Figure/Object you want to tag (give a name to) and select the appropriate label in the Touch Up Reading Pane (Dialogue Box) . Touch up Reading Order is also very helpful for tagging other parts of a document that may have been missed or come up as a web accessibility error. [I think this is all good now with latest .sty file, 25/9/17].

7.	Alternative Text - Failed: You will need to assign alt. text to each figure in a LaTeX document.  Alt. text is never generated automatically. Right click on the error and press fix. A dialogue box will appear that you can forward through for each figure that needs alt. text.  Make sure you save the changes before you exit it out of the dialogue box!  You will notice that some figures require alt. text for it's separate components so you will be applying, for example, Figure 1, more than once. [See Issue #3 - hopefully we can automate this once and for all].
	
8.	Bookmarks: When combining word and Latex components, bookmarks may have to be added in manually. The zoom level must be changed to inherit zoom by right clicking on the bookmark and going to properties. Then go to the action tab and click edit and change the zoom from fit to page to inherit zoom. Bookmarks can only be added manually when the heading for the bookmark appears at the top of the page, otherwise CSAS will refuse to publish it (you cannot have the bookmark go to the bottom of a page when doing this manually as far as I know… if you figure out a way please update this info!!).


Errors that do not require fixing
 
Tables - Regularity - these can be left as is.
 



