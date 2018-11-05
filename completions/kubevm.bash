_kubevm() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(kubevm commands) $(kubevm completions use)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(kubevm completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _kubevm kubevm
