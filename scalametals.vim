"=============================================================================
"" scalametals.vim --- SpaceVim lang#scala layer using coc-metals
" Copyright (c) 2020 Jason Ridgway-Taylor & Contributors
" " Author: Jason Ridgway-Taylor < jason at glottologist.co.uk >
" " URL: https://spacevim.org
" " License: GPLv3
" "=============================================================================
"
"

"
" @section lang#scalametals, layer-lang-scalametals
" @parentsection layers
" This layer is for scala development using the metals plugin, disabled by default, to enable this
" layer, add following snippet to your SpaceVim configuration file.
" >
"   [[layers]]
"     name = 'lang#scalametals'
" <
"
" @subsection Key bindings
" >
"   Mode            Key             Function
"   ---------------------------------------------
"   normal          SPC l g d       Goto definition
" <
"
"

function! SpaceVim#layers#lang#scalametals#plugins() abort
  let plugins = [
        \ ['neoclide/coc.nvim', {'branch': 'release'} ],
        \ ]

  return plugins
endfunction  


on! SpaceVim#layers#lang#scalametals#config() abort
  let g:scala_use_default_keymappings = 0
  call SpaceVim#mapping#space#regesit_lang_mappings('scala', function('s:language_specified_mappings'))
  call SpaceVim#plugins#repl#reg('scala', 'scala')
  call SpaceVim#plugins#runner#reg_runner('scala', 'sbt run')
  call SpaceVim#mapping#gd#add('scala', function('s:go_to_def'))
  call add(g:spacevim_project_rooter_patterns, 'build.sbt')
  augroup SpaceVim_lang_scalametals
    au!
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
  augroup END

endfunction


function! s:language_specified_mappings() abort

endfunction
