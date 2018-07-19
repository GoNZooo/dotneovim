" Vim color file
"   This file was generated by Palette
"   http://rubygems.org/gems/palette
"
" Author: Rickard Andersson
" Notes:  gonz' color scheme

hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name="gonzcolors"

if has("gui_running")
    set background=dark
endif

hi Normal      guifg=#ECECEC ctermfg=255  guibg=#23212E ctermbg=235  gui=NONE cterm=NONE
hi Comment     guifg=#777777 ctermfg=243  gui=NONE cterm=NONE
hi Statement   guifg=#E12977 ctermfg=162  gui=NONE cterm=NONE
hi Include     guifg=#C5E400 ctermfg=184  gui=NONE cterm=NONE
hi PreProc     guifg=#CC4444 ctermfg=167  gui=NONE cterm=NONE
hi Delimiter   guifg=#882255 ctermfg=89   gui=NONE cterm=NONE
hi Type        guifg=#4477FF ctermfg=69   gui=NONE cterm=NONE
hi Constant    guifg=#5F9CFF ctermfg=75   gui=NONE cterm=NONE
hi String      guifg=#FFB700 ctermfg=214  gui=NONE cterm=NONE
hi Function    guifg=#C5E400 ctermfg=184  gui=NONE cterm=NONE
hi Identifier  guifg=#8888CC ctermfg=104  gui=NONE cterm=NONE
hi LineNr      guifg=#AA0000 ctermfg=124  gui=NONE cterm=NONE
hi DiffDelete  guifg=#0A0A0A ctermfg=232  guibg=#CC0000 ctermbg=160  gui=NONE cterm=NONE
hi DiffAdd     guifg=#0A0A0A ctermfg=232  guibg=#00CC00 ctermbg=40   gui=NONE cterm=NONE
hi DiffChange  guifg=#0A0A0A ctermfg=232  guibg=#CC00CC ctermbg=164  gui=NONE cterm=NONE
hi DiffText    guifg=#000000 ctermfg=16   guibg=#FFFFFF ctermbg=231  gui=NONE cterm=NONE
hi ColorColumn guifg=#000000 ctermfg=16   guibg=#111111 ctermbg=233  gui=NONE cterm=NONE
hi CursorLine  guifg=#CCCCCC ctermfg=252  guibg=#222222 ctermbg=235  gui=NONE cterm=NONE
hi MatchParen  guifg=#000000 ctermfg=16   guibg=#CC33CC ctermbg=170  gui=NONE cterm=NONE
hi Search      guifg=#FFFFFF ctermfg=231  guibg=#0000AA ctermbg=19   gui=NONE cterm=NONE
hi Todo        guifg=#CCCC44 ctermfg=185  gui=NONE cterm=NONE
hi Pmenu       guifg=#FFFFFF ctermfg=231  guibg=#444444 ctermbg=238  gui=NONE cterm=NONE
hi PmenuSel    guifg=#444444 ctermfg=238  guibg=#FFFFFF ctermbg=231  gui=NONE cterm=NONE

hi link ALEWarning            Underlined
hi link ALEError              Underlined
hi link elixirKeyword         Statement
hi link elixirInclude         elixirKeyword
hi link elixirModuleDefine    elixirKeyword
hi link elixirPrivateDefine   elixirKeyword
hi link elixirBlock           elixirKeyword
hi link elixirBlockDefinition elixirKeyword
hi link elixirDefine          elixirKeyword
hi link elixirTupleDelimiter  Delimiter
hi link elixirMapDelimiter    Delimiter
hi link ocamlConstructor      Type
