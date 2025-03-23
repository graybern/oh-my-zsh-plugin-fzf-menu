fzf-app-kubens() {
  local selected_namespace
  selected_namespace=$(kubectl get ns --no-headers -o custom-columns=:metadata.name | fzf \
    --prompt="Select Kubernetes Namespace: " \
    --height=10 \
    --reverse \
    --preview="kubectl describe ns {} 2>/dev/null")

  [[ -n "$selected_namespace" ]] && kubectl config set-context --current --namespace="$selected_namespace" || echo "No namespace selected."
}
