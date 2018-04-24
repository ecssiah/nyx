" nyx.vim - Vim color scheme
" ----------------------------------------------------------
" Author: Michael Chapman
" Cred: Based on vim-sialoquent
" ----------------------------------------------------------

" Reset syntax highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nyx"

" Abbreviations:
"   g - gui
"   t - cterm
"   f - foreground
"   b - background
"   s - spelling

" Context Colors
let s:black            = { "g": "#191f2c", "t": "233" }
let s:bg               = { "g": "#343a47", "t": "236" }
let s:text             = { "g": "#c0c5ce", "t": "251" }
let s:comment          = { "g": "#808080", "t": "244" }
let s:error            = { "g": "#ff0000", "t": "007" }
let s:cursor           = { "g": "#00ffff", "t": "014" }
let s:inactive         = { "g": "#949494", "t": "246" } 
let s:faint            = { "g": "#424a59", "t": "237" }
let s:subtle           = { "g": "#585858", "t": "240" }
let s:selection        = { "g": "#ff5d00", "t": "202" }
let s:search           = { "g": "#d787ff", "t": "177" }

let s:accent1          = { "g": "#9fd3e6", "t": "116" } " light blue
let s:accent2          = { "g": "#f2e3c9", "t": "187" } " sandy yellow
let s:accent3          = { "g": "#c4e8bb", "t": "157" } " mint green
let s:accent4          = { "g": "#ffd7ff", "t": "225" } " light pink

" This function builds a call to the `highlight` function by checking for
" options that were provided by a style dictionary
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="    (has_key(a:style, "f") ? a:style.f.g : "NONE")
        \ "guibg="    (has_key(a:style, "b") ? a:style.b.g : "NONE")
        \ "guisp="    (has_key(a:style, "s") ? a:style.s.g : "NONE")
        \ "gui="      (has_key(a:style, "g") ? a:style.g   : "NONE")
        \ "ctermfg="  (has_key(a:style, "f") ? a:style.f.t : "NONE")
        \ "ctermbg="  (has_key(a:style, "b") ? a:style.b.t : "NONE")
        \ "cterm="    (has_key(a:style, "t") ? a:style.t   : "NONE")
endfunction

call s:h("Normal",       { "f": s:text, "b": s:bg })
call s:h("NonText",      { "f": s:subtle })
call s:h("Cursor",       { "f": s:black, "b": s:cursor })
call s:h("Visual",       { "f": s:selection, "b": s:bg })
call s:h("IncSearch",    { "f": s:search })
call s:h("WildMenu",     { "f": s:search })
call s:h("Search",       { "f": s:search })
call s:h("StatusLine",   { "f": s:text, "b": s:black, "g": "bold", "t": "bold" })
call s:h("StatusLineNC", { "f": s:inactive, "b": s:black })
call s:h("SignColumn",   { "f": s:text })
call s:h("VertSplit",    { "f": s:inactive, "b": s:inactive })
call s:h("TabLine",      { "f": s:inactive, "b": s:black })
call s:h("TabLineSel",   { "g": "bold", "t": "bold" })
call s:h("Directory",    { "f": s:accent1 })
call s:h("Title",        { "f": s:accent4, "g": "bold", "t": "bold" })
call s:h("ErrorMsg",     { "b": s:error })
call s:h("DiffAdd",      { "b": s:accent3 })
call s:h("DiffChange",   { "b": s:accent4 })
call s:h("DiffDelete",   { "f": s:error, "b": s:faint })
call s:h("DiffText",     { "b": s:accent4, "g": "bold", "t": "bold" })
call s:h("Folded",       { "f": s:comment, "b": s:black })
call s:h("User1",        { "f": s:bg, "b": s:accent2 })
call s:h("User2",        { "f": s:bg, "b": s:accent4 })
call s:h("User3",        { "f": s:bg, "b": s:accent1 })
call s:h("LineNr",       { "f": s:text, "b": s:faint })

hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC
hi! link SpecialKey   NonText

call s:h("Delimiter",  { "f": s:inactive })
call s:h("Comment",    { "f": s:comment, "g": "italic" })
call s:h("Underlined", { "f": s:accent1, "g": "underline", "t": "underline" })
call s:h("Type",       { "f": s:accent3 })
call s:h("String",     { "f": s:accent2 })
call s:h("Keyword",    { "f": s:accent1, "g": "bold", "t": "bold" })
call s:h("Todo",       { "f": s:accent4, "g": "bold", "t": "bold" })
call s:h("Function",   { "f": s:accent2 })
call s:h("Identifier", { "f": s:accent4 })
call s:h("Error",      { "f": s:error, "b": s:bg })
call s:h("ErrorMsg",   { "f": s:error, "b": s:bg })

if version >= 700
  call s:h("CursorLine",   { "b": s:black })
  call s:h("MatchParen",   { "f": s:selection, "g": "bold", "t": "bold" })
  call s:h("Pmenu",        { "b": s:black })
  call s:h("PmenuThumb",   { "b": s:text })
  call s:h("PmenuSBar",    { "b": s:subtle })
  call s:h("PmenuSel",     { "f": s:selection, "b": s:black })
  call s:h("ColorColumn",  { "b": s:faint })
  call s:h("CursorColumn", { "b": s:faint })
  call s:h("SpellBad",     { "s": s:accent4, "g": "undercurl" })
  call s:h("SpellCap",     { "s": s:accent1, "g": "undercurl" })
  call s:h("SpellRare",    { "s": s:accent2, "g": "undercurl" })
  call s:h("SpellLocal",   { "s": s:accent4, "g": "undercurl" })

  " Use bg color, cterm does not support squiggly underline
  execute "hi! SpellBad   ctermbg=" s:error.t
  execute "hi! SpellCap   ctermbg=" s:accent1.t
  execute "hi! SpellRare  ctermbg=" s:accent3.t
  execute "hi! SpellLocal ctermbg=" s:black.t
endif

hi! link Statement   Type
hi! link Constant    Directory
hi! link Number      Constant
hi! link Special     Constant
hi! link PreProc     Constant

" Highlights - HTML ----------
hi! link htmlLink    Underlined
hi! link htmlTag     Type
hi! link htmlEndTag  htmlTag

" Highlights - CSS -----------
hi! link cssBraces      Delimiter
hi! link cssSelectorOp  cssBraces
hi! link cssClassName   Normal

" Highlights - Markdown ------
hi! link mkdListItem  mkdDelimiter

" Highlights - Shell ---------
hi! link shOperator  Delimiter
hi! link shCaseBar   Delimiter

" Highlights - JavaScript ----
hi! link javaScriptValue   Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces  Normal

" Highlights - Help ----------
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined


