" ----------------------------------------------------------------------------
" Vim color file
" Maintainer:   John-Paul Bader <contact@smyck.org>
" Last Change:  2012 April
" License:      Beer Ware
" ----------------------------------------------------------------------------

" Reset Highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

let g:colors_name = "smyck"


" HighlightFunction: {{{
function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction
"
" ColorDefinitions: {{{
let s:none       = ['none',    'none']
let s:background = ['#282828', 'none']
let s:normal     = ['#F7F7F7', 15]
let s:gray1      = ['#FBFBFB', 15]
let s:gray2      = ['#d7d7d7', 10]
let s:gray3      = ['#8F8F8F', 8]
let s:grayBg1    = ['#5D5D5D', 8]
let s:grayBg2    = ['#424242', 238]
let s:grayBg3    = ['#3B3B3B', 8]
let s:aqua       = ['#2EB5C1', 6]
let s:aquaLight  = ['#9DEEF2', 12]
let s:yellow     = ['#F6DC69', 3]
let s:black      = ['#000000', 0]
let s:green      = ['#90AB41', 2]
let s:greenLight = ['#D1FA71', 10]
let s:blue       = ['#88CCE7', 4]
let s:blueLight  = ['#96D9F1', 12]
let s:red        = ['#FF4233', 9]
let s:redLight   = ['#FAB1AB', 9]
" }}}

" --------------
" Editor settings
call s:HL('Normal',         s:normal,   s:background)
"hi Cursor
call s:HL('CursorLine',     s:none,     s:grayBg2)
call s:HL('CursorLineNR',   s:yellow,   s:grayBg2,      'bold,')
call s:HL('LineNr',         s:gray3,    s:background)

" --------------
" - Number column
call s:HL('CursorColumn',   s:none,     s:grayBg2)
call s:HL('FoldColumn',     s:green,    s:grayBg3)
call s:HL('SignColumn',     s:gray3,    s:background)
call s:HL('Folded',         s:green,    s:grayBg3)

" --------------
" - Window/Tab delimiters
call s:HL('VertSplit',      s:gray3,    s:background,   'bold,')
call s:HL('ColorColumn',    s:none,     s:grayBg3)
"hi TabLine
"hi TabLineFill
"hi TabLineSel

" --------------
" - File Navigation / Searching
call s:HL('Directory',      s:blue,     s:background)
call s:HL('Search',         s:normal,   s:aqua)
call s:HL('IncSearch',      s:gray3,    s:yellow)

" --------------
" - Prompt/Status
"call s:HL('StatusLine',     s:gray1,    s:grayBg1)
"call s:HL('StatusLineNC',   s:gray1,    s:grayBg1)
"hi WildMenu
"hi Question
call s:HL('Title',          s:blue)
call s:HL('ModeMsg',        s:none,     s:none,     'bold,')
"hi MoreMsg

" --------------
" - Visual aid
call s:HL('MatchParen',     s:normal,       s:aqua)
call s:HL('Visual',         s:background,   s:normal)
"hi VisualNOS
call s:HL('NonText',        s:gray3,        s:none, 'bold,')

"hi Todo
call s:HL('Underlined',     s:none,         s:none, 'underline,',   s:grayBg1)
call s:HL('Error',          s:normal,       s:red)
call s:HL('ErrorMsg',       s:normal,       s:red)
call s:HL('WarningMsg',     s:background,   s:yellow)
hi Ignore               cterm=none ctermbg=none ctermfg=8           gui=none        guifg=bg
call s:HL('SpecialKey',     s:gray3,        s:none)

" --------------------------------
" Variable types
call s:HL('Constant',       s:greenLight,   s:none)
call s:HL('String',         s:yellow,       s:none)
call s:HL('StringDelimiter',s:yellow,       s:none)
call s:HL('Character',      s:yellow,       s:none)
call s:HL('Number',         s:red,          s:none)
call s:HL('Boolean',        s:greenLight,   s:none)
call s:HL('Float',          s:red,          s:none)

call s:HL('Identifier',     s:blue,         s:none)
call s:HL('Function',       s:normal,       s:none)

" --------------------------------
" Language constructs
call s:HL('Statement',      s:greenLight,   s:none)
call s:HL('Conditional',    s:greenLight,   s:none)
call s:HL('Repeat',         s:greenLight,   s:none)
call s:HL('Label',          s:greenLight,   s:none)
call s:HL('Operator',       s:normal,       s:none)
call s:HL('Keyword',        s:greenLight,   s:none)
call s:HL('Exception',      s:greenLight,   s:none)
call s:HL('Comment',        s:gray3,        s:none,     'italic,')

call s:HL('Special',        s:none,         s:none,     'bold,')
call s:HL('SpecialChar',    s:none,         s:none,     'bold,')
call s:HL('SpecialComment', s:none,         s:none,     'bold,')
"hi Tag
call s:HL('Delimiter',      s:normal,       s:none)
"hi Debug

" ----------
" - C like
call s:HL('PreProc',        s:greenLight,   s:none)
"hi Include
"hi Define
"hi Macro
"hi PreCondit

call s:HL('Type',           s:greenLight,   s:none)
call s:HL('StorageClass',   s:greenLight,   s:none)
call s:HL('Structure',      s:greenLight,   s:none)
call s:HL('Typedef',        s:greenLight,   s:none)

" --------------------------------
" semshi
call s:HL('semshiLocal',        s:blue,         s:none)
call s:HL('semshiGlobal',       s:blue,         s:none)
call s:HL('semshiImported',     s:normal,       s:none)
call s:HL('semshiParameter',    s:blue,         s:none)
call s:HL('semshiParameterUnused', s:blue,      s:none, 'undercurl,')

call s:HL('semshiBuiltin',      s:greenLight,   s:none)
call s:HL('semshiAttribute',    s:normal,       s:none)
call s:HL('semshiSelf',         s:blue,         s:none)

call s:HL('semshiSelected',     s:blue,         s:grayBg1)


" --------------------------------
" Diff
hi DiffAdd              cterm=bold ctermbg=2        ctermfg=15
hi DiffChange           cterm=bold ctermbg=4        ctermfg=15
hi DiffDelete           cterm=bold ctermbg=1        ctermfg=15
hi DiffText             cterm=bold ctermbg=3        ctermfg=8

" --------------------------------
" Completion menu
call s:HL('Pmenu',      s:normal,   s:grayBg2)
call s:HL('PmenuSel',   s:normal,   s:gray3)
"call s:HL('PmenuSbar',  s:normal,   s:gray2)
"call s:HL('PmenuThumb', s:normal,   s:gray2)

" --------------------------------
" Spelling
call s:HL('SpellBad',   s:none,     s:none,     'undercurl,',   s:gray3)
call s:HL('SpellCap',   s:none,     s:none,     'undercurl,',   s:gray3) 
call s:HL('SpellRare',  s:none,     s:none,     'undercurl,',   s:gray3)
call s:HL('SpellLocal', s:none,     s:none,     'undercurl,',   s:gray3)

" --------------------------------
" spelunker
call s:HL('SpelunkerSpellBad',              s:none, s:none, 'undercurl,', s:gray2)
call s:HL('SpelunkerComplexOrCompoundWord', s:none, s:none, 'undercurl,', s:gray2)
