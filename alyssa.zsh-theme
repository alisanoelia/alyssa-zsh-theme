 # Define el prompt principal
PROMPT='󰔶  %1~$(git_prompt_info) %B%F{white}➜%b '

# Configura las partes del prompt de git
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} x"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Función personalizada para git_prompt_info que no muestra la rama
function git_prompt_info() {
  local ref dirty
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  dirty=$(command git status --porcelain 2> /dev/null)
  if [ -n "$dirty" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}
