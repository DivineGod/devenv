" This scheme was created by CSApproxSnapshot
" on Fri, 27 Jul 2012

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
" :so $VIMRUNTIME/syntax/hitest.vim

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="sol"

hi Normal ctermbg=15 ctermfg=0
hi PreProc ctermbg=bg ctermfg=3
hi Type ctermbg=bg ctermfg=6
hi Underlined term=underline cterm=underline ctermbg=bg ctermfg=4
hi Ignore ctermbg=bg ctermfg=243
hi Error term=reverse cterm=NONE ctermbg=1 ctermfg=fg
hi Todo ctermbg=bg ctermfg=2
hi String ctermbg=bg ctermfg=2
hi Number term=underline cterm=NONE ctermbg=bg ctermfg=3
hi SpecialKey ctermbg=bg ctermfg=239
hi NonText ctermbg=bg ctermfg=236
hi Directory ctermbg=bg ctermfg=4
hi ErrorMsg ctermbg=bg ctermfg=1
hi IncSearch term=reverse cterm=NONE ctermbg=4 ctermfg=15
hi Search term=reverse cterm=NONE ctermbg=14 ctermfg=15
hi MoreMsg ctermbg=bg ctermfg=fg
hi ModeMsg ctermbg=bg ctermfg=fg

hi OverLength ctermbg=52 ctermfg=fg
hi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30
hi Pmenu ctermbg=219 ctermfg=fg
hi PmenuSel ctermbg=250 ctermfg=fg
hi PmenuSbar ctermbg=250 ctermfg=fg
hi PmenuThumb ctermbg=252 ctermfg=233
hi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg
hi TabLineSel ctermbg=bg ctermfg=fg
hi TabLineFill term=reverse cterm=NONE ctermbg=252 ctermfg=233
hi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg
hi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg
hi Question ctermbg=bg ctermfg=fg
"hi StatusLine term=reverse cterm=NONE ctermbg=246 ctermfg=233
"hi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=233
"hi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=233

"0 - black
"1 - red
"2 - green
"3 - yellow
"4 - blue
"5 - purple
"6 - cayan
"7 - grey
"8 - dark grey
hi StatusLine term=reverse cterm=NONE ctermbg=7 ctermfg=0
hi StatusLineNC term=reverse cterm=NONE ctermbg=7 ctermfg=8
hi VertSplit term=reverse cterm=NONE ctermbg=7 ctermfg=7

hi Title ctermbg=bg ctermfg=122
hi Visual term=reverse,NONE cterm=NONE ctermbg=7 ctermfg=0
hi VisualNOS term=NONE,underline cterm=NONE,underline ctermbg=bg ctermfg=fg
hi WarningMsg ctermbg=bg ctermfg=1
hi WildMenu ctermbg=220 ctermfg=16
hi Folded ctermbg=231 ctermfg=69
hi pythonSync ctermbg=bg ctermfg=fg
hi pythonSpaceError ctermbg=bg ctermfg=fg
hi ColorColumn term=reverse cterm=NONE ctermbg=7
hi Cursor ctermbg=252 ctermfg=233
hi lCursor ctermbg=252 ctermfg=233
hi MatchParen term=reverse cterm=NONE ctermbg=fg ctermfg=bg

"hi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=15
hi LineNr ctermbg=bg ctermfg=7 ctermbg=15
hi Comment ctermbg=bg ctermfg=7
"8
"comment here
hi Constant term=underline cterm=NONE ctermbg=bg ctermfg=1
hi Special term=underline cterm=NONE ctermbg=bg ctermfg=9
hi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=4
hi Statement ctermbg=bg ctermfg=1
hi FoldColumn ctermbg=231 ctermfg=62
hi DiffAdd ctermbg=63 ctermfg=fg
hi DiffChange ctermbg=131 ctermfg=fg
hi DiffDelete ctermbg=30 ctermfg=152
hi DiffText term=reverse cterm=NONE ctermbg=160 ctermfg=fg
hi SignColumn ctermbg=250 ctermfg=18
hi Conceal ctermbg=248 ctermfg=252
hi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196
hi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21
hi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201
