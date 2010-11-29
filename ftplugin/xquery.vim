" VIM Filetype plugin file
" 
" Language:    XQuery
" Maintainer:  Jeroen Pulles <jeroen.pulles@redslider.net>
" Last Change: 29 November 2010

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Note that the syntax file defines iskeyword; Just in case author don't have 
" plugins enabled. 
setlocal comments=sr:(:,mb::,ex::)
setlocal formatoptions=croq
setlocal textwidth=78
