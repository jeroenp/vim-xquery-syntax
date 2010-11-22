" (incomplete) XQuery syntax file
" 
" Nothing smart in the XML department, 
" focusing on control flow and modules
" 
" Language: XQuery
" Maintainer: Jeroen Pulles <jeroen.pulles@redslider.net>
" Last Change: 22 November 2010


if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Regions ---------------------
syn region xqyString           start=/\z(['"]\)/ skip=/\\\z1/ end=/\z1/ keepend
syn region xqyBlock            start=/{/ end=/}/ contains=xqyBlock,xqyString,xqyFLWOR,xqyConditional,xqyConstructor,xqyVariable,xqyComment

" Prolog ----------------------
syn keyword xqyPrologKeyword   xquery version
syn keyword xqyPrologKeyword   module namespace import at
syn keyword xqyTypeSigKeyword  as

syn match   xqyDeclare         /declare/ nextgroup=xqyDeclareFun,xqyDeclareVar skipwhite
syn match   xqyDeclareVar      /variable/ nextgroup=xqyVariable skipwhite
syn match   xqyDeclareFun      /function/ nextgroup=xqyFunction skipwhite
syn match   xqyVariable        /\$\k\+/
" FIXME include - minus as iskeyword 
syn match   xqyFunction        /foo()/
" FIXME function sig

" FLWOR -----------------------
syn keyword xqyFLWOR           for in let where order by return
syn keyword xqyConstructor     attribute
syn match   xqyConstructor     /element\ze\s/
syn keyword xqyConditional     if then else

" Commenting -------------------
syn keyword xqyTodo             TODO XXX FIXME contained
syn match   xqyDocKeyword       /@\(version\|since\|deprecated\|error\|return\|param\|author\|see\)/ contained nextgroup=xqyVariable skipwhite
syn region  xqyDocComment       start=/(:\~/        end=/:)/  contains=xqyTodo,xqyDocKeyword,xqyVariable
syn region  xqyComment          start=/(:\(\~\)\@!/ end=/:)/  contains=xqyTodo

" ==============================
" Map names to colors ----------
hi def link xqyString           String
hi def link xqyComment          Comment
hi def link xqyDocComment       Comment
hi def link xqyDocKeyword       SpecialComment
hi def link xqyTodo             Todo

hi def link xqyPrologKeyword    PreProc
hi def link xqyDeclare          PreProc
hi def link xqyDeclareVar       PreProc
hi def link xqyDeclareFun       PreProc
hi def link xqyTypeSigKeyword   PreProc

hi def link xqyFLWOR            Keyword
hi def link xqyConstructor      Keyword
hi def link xqyConditional      Conditional

hi def link xqyVariable         Identifier
