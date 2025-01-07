let s:xdg = fnamemodify(expand("$VIM"), ':h:h')
let $XDG_CONFIG_HOME = s:xdg . '/config'
let $XDG_DATA_HOME = s:xdg . '/share'
let $XDG_STATE_HOME = s:xdg . '/state'
let &rtp .= ',' . expand("$XDG_CONFIG_HOME") . '/nvim'
