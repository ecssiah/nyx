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
let s:bg               = { "g": "#393f4c", "t": "237" }
let s:text             = { "g": "#c0c5ce", "t": "251" }
let s:comment          = { "g": "#6c6c6c", "t": "242" }
let s:error            = { "g": "#e74c3c", "t": "231" }
let s:cursor           = { "g": "#00ffff", "t": "014" }
let s:inactive         = { "g": "#949494", "t": "246" } 
let s:subtle           = { "g": "#585858", "t": "240" }
let s:selection        = { "g": "#ff87ff", "t": "213" }
let s:search           = { "g": "#d787ff", "t": "177" }

" Custom Colors
let s:black            = { "g": "#191f2c", "t": "233" }

let s:middleDarkGrey   = { "g": "#777777", "t": "241" }
let s:middleLightGrey  = { "g": "#999999", "t": "246" }
let s:lightGrey        = { "g": "#BBBBBB", "t": "249" }
let s:darkGrey         = { "g": "#575C68", "t": "238" }

let s:darkPink         = { "g": "#424a59", "t": "88"  }
let s:middleDarkPink   = { "g": "#FF0055", "t": "197" }
let s:middleLightPink  = { "g": "#D65E76", "t": "167" }
let s:lightPink        = { "g": "#FFAFAF", "t": "217" }

let s:darkBlue         = { "g": "#00838F", "t": "24"  }
let s:middleDarkBlue   = { "g": "#538192", "t": "24"  }
let s:middleLightBlue  = { "g": "#9FD3E6", "t": "116" }
let s:lightBlue        = { "g": "#b0dff2", "t": "195" }

let s:darkGreen        = { "g": "#5F5F00", "t": "58"  }
let s:middleDarkGreen  = { "g": "#739200", "t": "64"  }
let s:darkTan          = { "g": "#503D15", "t": "52"  }
let s:lightTan         = { "g": "#ECE1C8", "t": "230" }

" Custom
let s:darkNavyBlue     = { "g": "#3e4451", "t": "16" }
let s:middleYellow     = { "g": "#f2e3c9", "t": "149" }
let s:lightGreen       = { "g": "#c4e8bb", "t": "157" }
let s:cyan             = { "g": "#bbf9f8", "t": "800" }
let s:lightGrayBlue    = { "g": "#545c62", "t": "800" }

" Assign to semantic categories based on background color
let s:accent1    = s:middleLightBlue
let s:accent2    = s:middleYellow
let s:accent3    = s:lightGreen
let s:accent4    = s:lightTan
let s:normRed    = s:middleLightPink
let s:normGreen  = s:middleYellow
let s:normBlue   = s:middleLightBlue
let s:faintRed   = s:darkPink
let s:faintGreen = s:darkGreen
let s:faintBlue  = s:darkBlue

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
call s:h("Search",       { "f": s:search })
call s:h("StatusLine",   { "f": s:text, "b": s:black, "g": "bold", "t": "bold" })
call s:h("StatusLineNC", { "f": s:inactive, "b": s:black })
call s:h("SignColumn",   { "f": s:text })
call s:h("VertSplit",    { "f": s:subtle, "b": s:bg })
call s:h("TabLine",      { "f": s:inactive, "b": s:black })
call s:h("TabLineSel",   { "g": "bold", "t": "bold" })
call s:h("Folded",       { "f": s:comment, "b": s:black })
call s:h("Directory",    { "f": s:accent1 })
call s:h("Title",        { "f": s:accent4, "g": "bold", "t": "bold" })
call s:h("ErrorMsg",     { "b": s:faintRed })
call s:h("DiffAdd",      { "b": s:faintGreen })
call s:h("DiffChange",   { "b": s:faintRed })
call s:h("DiffDelete",   { "f": s:normRed, "b": s:faintRed })
call s:h("DiffText",     { "b": s:faintRed, "g": "bold", "t": "bold" })
call s:h("User1",        { "f": s:bg, "b": s:normGreen })
call s:h("User2",        { "f": s:bg, "b": s:normRed })
call s:h("User3",        { "f": s:bg, "b": s:normBlue })
call s:h("LineNr",       { "f": s:text, "b": s:darkNavyBlue })

hi! link WildMenu     IncSearch
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
call s:h("Keyword",    { "f": s:accent2, "g": "bold", "t": "bold" })
call s:h("Todo",       { "f": s:normRed, "g": "bold", "t": "bold" })
call s:h("Function",   { "f": s:lightBlue })
call s:h("Identifier", { "f": s:accent2 })
call s:h("Error",      { "f": s:error, "b": s:bg })
call s:h("ErrorMsg",   { "f": s:error, "b": s:bg })

if version >= 700
  call s:h("CursorLine",   { "b": s:black })
  call s:h("MatchParen",   { "f": s:selection, "g": "bold", "t": "bold" })
  call s:h("Pmenu",        { "b": s:black })
  call s:h("PmenuThumb",   { "b": s:text })
  call s:h("PmenuSBar",    { "b": s:subtle })
  call s:h("PmenuSel",     { "f": s:selection, "b": s:black })
  call s:h("ColorColumn",  { "b": s:faintRed })
  call s:h("CursorColumn", { "b": s:faintRed })
  call s:h("SpellBad",     { "s": s:normRed, "g": "undercurl" })
  call s:h("SpellCap",     { "s": s:accent1, "g": "undercurl" })
  call s:h("SpellRare",    { "s": s:normGreen, "g": "undercurl" })
  call s:h("SpellLocal",   { "s": s:accent4, "g": "undercurl" })

  " Use bg color, cterm does not support squiggly underline
  execute "hi! SpellBad   ctermbg=" s:faintRed.t
  execute "hi! SpellCap   ctermbg=" s:faintBlue.t
  execute "hi! SpellRare  ctermbg=" s:faintGreen.t
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


