# Main fzf-powered menu function
fzf-menu() {
  local app function

  # Prompt application selection
  app=$(printf "SSH\nGit\nDocker\nKubernetes\nTmux\nAsciinema\n**Fun**" | fzf \
    --prompt="Select Application: " \
    --height=10 \
    --reverse)

  # If no selection, exit
  [[ -z "$app" ]] && echo "No application selected." && return

  # Handle app selection by specifying respective function
  case "$app" in
    "SSH")
      function="fzf-app-ssh"
      ;;
    "Git")
      # do something
      ;;
    "Docker")
      # do something
      ;;
    "Kubernetes")
      function=$(printf "fzf-app-kubectx\nfzf-app-kubens" | fzf \
        --prompt="Select Kubernetes Function: " \
        --height=10 \
        --reverse)
      ;;
    "Tmux")
      # do something
      ;;
    "Asciinema")
      # do something
      ;;
    "**Fun**")
      # do something
      ;;
  esac

  # If no function is selected, exit
  [[ -z "$function" ]] && echo "No function selected." && return

  # Execute the selected function
  eval "$function"
}

# Load additional functions
source "${0:A:h}/fzf-app-ssh.zsh"
source "${0:A:h}/fzf-app-kubectx.zsh"
source "${0:A:h}/fzf-app-kubens.zsh"
