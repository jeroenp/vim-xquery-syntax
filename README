XQuery syntax file for VIM
==========================

Motivation

This syntax file differs from Jean-Marc Vanel's syntax file in that it doesn't
use the XML syntax as a base. I find the XML highlighting distracting when
programming; Since you're only working with snippets of XML at a time, I don't
think the XML highlighting helps. Instead, the code structure is highlighted.
It's easy to spot variable references inside XML literals this way, for
example.

Background

The syntax file has been used while working on a 2000+ lines project with
numerous modules where I found that the xquery syntax that currently comes with
VIM didn't work. This syntax file is by no means complete, but I think that
it's good enough to release. 

I try to stay close to the way VIM does C syntax highlighting; For variable
names I use the \k character class for keywords, which may not correspond to
the XQuery specification but in practice this will be what most people will
want to use. 

-- Jeroen


DETAILS
=======

Comments
--------

XQuery Comments are balanced, so "(: (: :)" leaves a comment open (Mark Logic 4.0)

XML Comments are supported like any other literal piece of XML. So yes, these
are part of the output and shouldn't be used to document your code. 

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

