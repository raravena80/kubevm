if [[ ! -o interactive ]]; then
    return
fi

compctl -K _kubevm kubevm

_kubevm() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(kubevm commands) $(kubevm completions use)"
  else
    completions="$(kubevm completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
