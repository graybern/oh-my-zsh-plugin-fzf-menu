fzf-app-ssh() {
  local selected_host
  selected_host=$(find -L ~/.ssh/config.d/ -type f -exec grep -h '^Host ' {} \; | awk '{print $2}' | sort | fzf \
    --prompt="Select SSH host: " \
    --height 10 \
    --reverse \
    --preview="grep -A 5 -h '^Host {1}' ~/.ssh/config.d/* 2>/dev/null")

  # Check if a host was selected
  if [[ -n "$selected_host" ]]; then
    ssh "$selected_host"
  else
    echo "No host selected."
  fi
}
