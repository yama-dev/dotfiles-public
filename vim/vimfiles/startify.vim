" startify
let g:startify_files_number = 3

let g:startify_use_env = 1

let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

let g:startify_bookmarks = [
  \ "~/",
  \ "~/yama-dev/",
  \ "~/yama-dev/work/",
  \ "~/yama-dev/work/task.txt",
  \ "~/yama-dev/work/input.txt",
  \ "~/.zprezto/runcoms/zprofile",
  \ "~/.vimrc",
  \ "~/.gvimrc",
  \ "~/vimfiles/",
  \ "~/vimfiles/coc.vim",
  \ "~/vimfiles/plugins.toml",
  \ "~/vimfiles/plugins_lazy.toml",
  \ "~/.vim/coc-settings.json",
  \ ]

let g:startify_custom_header = [
  \ '  -----------------------------------------------------',
  \ '                                         _             ',
  \ '   _   _  __ _ _ __ ___   __ _        __| | _____   __ ',
  \ '  | | | |/ _` | `_ ` _ \ / _` |_____ / _` |/ _ \ \ / / ',
  \ '  | |_| | (_| | | | | | | (_| |_____| (_| |  __/\ V /  ',
  \ '   \__, |\__,_|_| |_| |_|\__,_|      \__,_|\___| \_/   ',
  \ '   |___/                                               ',
  \ '  -----------------------------------------------------',
  \ ]

