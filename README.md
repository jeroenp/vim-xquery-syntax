XQuery syntax file for VIM
==========================

Motivation

This syntax file differs from Jean-Marc Vanel’s syntax file in that it doesn’t
use the XML syntax as a base. I find the XML highlighting distracting when
programming; Since you’re only working with snippets of XML at a time, I don’t
think the XML highlighting helps. Instead, the code structure is highlighted.
It’s easy to spot variable references inside XML literals this way, for
example.

Background

The syntax file has been used while working on a 2000+ lines project with
numerous modules where I found that the xquery syntax that currently comes with
VIM didn’t work. This syntax file is by no means complete, but I think that
it’s good enough to release. 

I try to stay close to the way VIM does C syntax highlighting. That makes me
most comfortable with working with large XQuery files. For variable names I use
the `\k` character class for keywords, which may not correspond to the XQuery
specification but in practice this will be what most people will want to use.
Standard library functions, such as those from XPath, like `fn:document-uri`,
are not marked as keyword, instead they’re treated as any other function. 

-- Jeroen

DETAILS
=======

Reference
---------
See the XQuery grammar specification at [Appendix A XQuery Grammar](http://www.w3.org/TR/xquery/#nt-bnf)

Words 
-----
XQuery uses NCNames for most keywords, and as it happens that sometimes even
includes dots. Which is totally weird for people coming from other programming
languages. This syntax file uses standard `\k` with minus and dot, `-.`.

Comments
--------
XQuery comments are balanced, so `(: (: :)` leaves a comment open; At least,
this is how it works in Mark Logic 4. XML Comments are supported like any
other literal piece of XML. So yes, these are part of the output and shouldn’t
be used to document your code. 

XML rendering 
-------------
The start tag is also used for end tags in Processing Instructions and CDATA sections. 

TODO
----
 * Function names should be marked as xqyFunction
 * xs:string is currently marked as a "type", but that needs a more generic
   solution that also works for sequences and matchers like
   schema-element(<type>) 
 * Operators such as <>+- should be marked as keywords 
 * Conditionals such as if/then and typeswitch can benefit from using a
   nextgroup
 * {} could be marked as a fold, but my short experiments with it gave
   problems in balancing the brackets when trying the fold. 
 * Specify all declare variations and make sure that these only work in the
   prolog and not in blocks. 

