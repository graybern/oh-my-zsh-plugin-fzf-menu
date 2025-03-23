fzf-app-kubectx() {
  local selected_context
  selected_context=$(kubectl config get-contexts -o name | fzf \
    --prompt="Select Kubernetes Context: " \
    --height=10 \
    --reverse \
    --preview="kubectl config view --minify --context={} --raw")

  [[ -n "$selected_context" ]] && kubectl config use-context "$selected_context" || echo "No context selected."
}
