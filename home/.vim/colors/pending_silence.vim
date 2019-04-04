" This scheme was created by CSApproxSnapshot
" on Fri, 27 Jul 2012

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=8 ctermfg=252
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=208
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=29
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=62
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=243
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=250
    CSAHi Todo term=NONE cterm=NONE ctermbg=68 ctermfg=233
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=64
    CSAHi Number term=underline cterm=NONE ctermbg=bg ctermfg=208
    CSAHi SpecialKey term=NONE cterm=NONE ctermbg=bg ctermfg=239
    CSAHi NonText term=NONE cterm=NONE ctermbg=bg ctermfg=236
    CSAHi Directory term=NONE cterm=NONE ctermbg=bg ctermfg=62
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=231
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=160 ctermfg=220
    CSAHi Search term=reverse cterm=NONE ctermbg=220 ctermfg=233
    CSAHi MoreMsg term=NONE cterm=NONE ctermbg=bg ctermfg=155
    CSAHi ModeMsg term=NONE cterm=NONE ctermbg=bg ctermfg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=8
    "234
    CSAHi OverLength term=NONE cterm=NONE ctermbg=52 ctermfg=fg
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=219 ctermfg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=250 ctermfg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=252 ctermfg=233
    CSAHi TabLine term=underline cterm=underline ctermbg=252 ctermfg=fg
    CSAHi TabLineSel term=NONE cterm=NONE ctermbg=bg ctermfg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=252 ctermfg=233
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=254 ctermfg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=155
    CSAHi StatusLine term=reverse cterm=NONE ctermbg=246 ctermfg=233
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=241 ctermfg=233
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=241 ctermfg=233
    CSAHi Title term=NONE cterm=NONE ctermbg=bg ctermfg=122
    CSAHi Visual term=reverse,NONE cterm=NONE ctermbg=241 ctermfg=233
    CSAHi VisualNOS term=NONE,underline cterm=NONE,underline ctermbg=bg ctermfg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=160
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=220 ctermfg=16
    CSAHi Folded term=NONE cterm=NONE ctermbg=231 ctermfg=69
    CSAHi pythonSync term=NONE cterm=NONE ctermbg=bg ctermfg=fg
    CSAHi pythonSpaceError term=NONE cterm=NONE ctermbg=bg ctermfg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=217 ctermfg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=252 ctermfg=233
    CSAHi lCursor term=NONE cterm=NONE ctermbg=252 ctermfg=233
    "(  )
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=52 ctermfg=fg
    CSAHi Comment term=NONE cterm=NONE ctermbg=bg ctermfg=8
    "234
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=160
    CSAHi Special term=underline cterm=NONE ctermbg=bg ctermfg=130
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=68

    CSAHi Statement term=NONE cterm=NONE ctermbg=bg ctermfg=1
    "160
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=231 ctermfg=62
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=63 ctermfg=fg
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=131 ctermfg=fg
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=30 ctermfg=152
    CSAHi DiffText term=reverse cterm=NONE ctermbg=160 ctermfg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201
endif

if 1
    delcommand CSAHi
endif
