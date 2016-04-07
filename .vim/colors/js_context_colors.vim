" Vim color file
"
" Author: David Wilhelm <dewilhelm@gmail.com>
"
" Note: Used by the JavaScript Context Colors plugin
" to highlight function scopes differently by level
" top level = 0
" To override these colors, copy this colorscheme
" to your ./vim/colors/ dir and change as desired

"echom "JSCC: loading highlighting groups"

hi JSCC_UndeclaredGlobal ctermfg=199 guifg=#FF0000
hi JSCC_Level_0 ctermfg=8 guifg=#002b36
hi JSCC_Level_1 ctermfg=3 guifg=#b58900
hi JSCC_Level_2 ctermfg=9 guifg=#cb4b16
hi JSCC_Level_3 ctermfg=5 guifg=#d33682
hi JSCC_Level_4 ctermfg=13 guifg=#6c71c4
hi JSCC_Level_5 ctermfg=4 guifg=#268bd2
hi JSCC_Level_6 ctermfg=2 guifg=#859900

hi Comment ctermfg=243 guifg=#767676

if !g:js_context_colors_colorize_comments
    hi link javaScriptComment              Comment
    hi link javaScriptLineComment          Comment
    hi link javaScriptDocComment           Comment
    hi link javaScriptCommentTodo          Todo
endif
