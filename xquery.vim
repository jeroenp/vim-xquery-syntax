" VIM Syntax file
" 
" Language:    XQuery
" Maintainer:  Jeroen Pulles <jeroen.pulles@redslider.net>
" Last Change: 22 November 2010
"
if exists("b:current_syntax")
   finish
endif

setlocal iskeyword=@,-,48-57,_,192-255

" Regions ---------------------
syn region xqyString           start=/\z(['"]\)/ skip=/\\\z1/ end=/\z1/ keepend
syn region xqyBlock            start=/{/ end=/}/ contains=xqyBlock,xqyString,xqyFLWOR,xqyConditional,xqyConstructor,xqyVariable,xqyComment,xqyStartTag,xqyEndTag
syn region xqyAttrString       start=/\z(['"]\)/ skip=/\\\z1/ end=/\z1/ contained contains=xqyBlock
syn region xqyStartTag         start=#<\([= \/]\)\@!# end=#># contains=xqyAttrString
syn region xqyEndTag           start=#</# end=#>#

" Prolog ----------------------
syn keyword xqyPrologKeyword   xquery version
syn keyword xqyPrologKeyword   module namespace import at
syn match   xqyDeclare         /declare/ nextgroup=xqyDeclareFun,xqyDeclareVar skipwhite
syn match   xqyDeclareVar      /variable/ nextgroup=xqyVariable skipwhite
syn match   xqyDeclareFun      /function/ nextgroup=xqyFunction skipwhite

syn match   xqyVariable        /\$\k\+/
syn match   xqyFunction        /foo()/

" Type ------------------------
syn keyword xqyTypeSigKeyword  as nextgroup=xqyType skipwhite
syn match   xqyType            /xs:\w\+/ contained
syn keyword xqyVariableExt     external

" FLWOR -----------------------
syn keyword xqyFLWOR           for in let where order by return
syn keyword xqyConstructor     attribute
syn match   xqyConstructor     /\(element\|comment\|processing-instruction\)\ze\s/
syn keyword xqyConditional     if then else
syn keyword xqyConditional     typeswitch case

" Commenting -------------------
syn keyword xqyTodo             TODO XXX FIXME contained
syn match   xqyDocKeyword       display /@\(version\|since\|deprecated\|error\|return\|param\|author\|see\)/ contained nextgroup=xqyVariable skipwhite
syn region  xqyDocComment       start="(:\~" end=":)" contains=xqyTodo,xqyDocKeyword,xqyVariable,xqyComment,xqyDocComment fold
syn region  xqyComment          start="(\:\(\~\)\@!" end="\:)" contains=xqyTodo,xqyComment,xqyDocComment,@Spell fold

" ==============================
hi def link xqyString           String
hi def link xqyAttrString       String
hi def link xqyStartTag         Constant
hi def link xqyEndTag           Constant

hi def link xqyComment          Comment
hi def link xqyDocComment       Comment
hi def link xqyDocKeyword       SpecialComment
hi def link xqyTodo             Todo

hi def link xqyPrologKeyword    PreProc
hi def link xqyDeclare          Define
hi def link xqyDeclareVar       Define
hi def link xqyDeclareFun       Define
hi def link xqyTypeSigKeyword   PreProc
hi def link xqyVariableExt      PreProc

hi def link xqyFLWOR            Keyword
hi def link xqyConstructor      Keyword
hi def link xqyConditional      Conditional

hi def link xqyVariable         Identifier
hi def link xqyType             Type

let b:current_syntax = "xquery"
