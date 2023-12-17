hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

if has("gui_running")
    set background=dark
endif

exec("hi Normal guifg=#ececec guibg=#191919 gui=NONE cterm=NONE")
exec("hi Comment guifg=#46f2f2 gui=NONE cterm=NONE")
exec("hi Statement guifg=#e12977 gui=NONE cterm=NONE")
exec("hi Include guifg=#c5e400 gui=NONE cterm=NONE")
exec("hi PreProc guifg=#cc4444 gui=NONE cterm=NONE")
exec("hi Delimiter guifg=#dd5555 gui=NONE cterm=NONE")
exec("hi Type guifg=#5577ff gui=NONE cterm=NONE")
exec("hi @field guifg=#ff66cc gui=NONE cterm=NONE")
exec("hi Constant guifg=#5f9cff gui=NONE cterm=NONE")
exec("hi String guifg=#ffb700 gui=NONE cterm=NONE")
exec("hi Function guifg=#c5e400 gui=NONE cterm=NONE")
exec("hi Identifier guifg=#9999ff gui=NONE cterm=NONE")
exec("hi LineNr guifg=#444444 gui=NONE cterm=NONE")
exec("hi DiffDelete guifg=#0a0a0a guibg=#cc0000 gui=NONE cterm=NONE")
exec("hi DiffAdd guifg=#0a0a0a guibg=#00cc00 gui=NONE cterm=NONE")
exec("hi DiffChange guifg=#0a0a0a guibg=#cc00cc gui=NONE cterm=NONE")
exec("hi DiffText guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE")
exec("hi ColorColumn guifg=#ececec guibg=#33313e gui=NONE cterm=NONE")
exec("hi CursorLine guifg=#cccccc guibg=#222222 gui=NONE cterm=NONE")
exec("hi MatchParen guifg=#000000 guibg=#cc33cc gui=NONE cterm=NONE")
exec("hi Search guifg=#ffffff guibg=#0000aa gui=NONE cterm=NONE")
exec("hi Visual guifg=#000000 guibg=#7b26cb gui=NONE cterm=NONE")
exec("hi Folded guifg=#33aa33 guibg=#555555 gui=NONE cterm=NONE")
exec("hi FoldColumn guifg=#00aa00 guibg=#333333 gui=NONE cterm=NONE")
exec("hi Whitespace guifg=#404040 gui=NONE cterm=NONE")
exec("hi NonText guifg=#33313e gui=NONE cterm=NONE")
exec("hi Todo guifg=#cccc44 gui=NONE cterm=NONE")
exec("hi Pmenu guifg=#ffffff guibg=#444444 gui=NONE cterm=NONE")
exec("hi PmenuSel guifg=#444444 guibg=#ffffff gui=NONE cterm=NONE")
exec("hi link @punctuation Delimiter")
exec("hi link @type Type")
exec("hi link @variable Identifier")
exec("hi link @parameter Identifier")
exec("hi link @function Function")
