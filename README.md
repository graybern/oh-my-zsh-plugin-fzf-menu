# fzf-menu

**fzf-menu** is an [Oh My Zsh](https://ohmyz.sh/) plugin that enhances your terminal experience by providing interactive menus using [fzf](https://github.com/junegunn/fzf). It allows you to seamlessly select SSH hosts, Kubernetes contexts, namespaces, and more. Additionally, you can extend its functionality by adding custom `.zsh` scripts.

## Features

- **SSH Host Selection:** Quickly connect to SSH hosts defined in your configuration.
- **Kubernetes Context Selection:** Easily switch between Kubernetes contexts.
- **Kubernetes Namespace Selection:** Effortlessly switch between Kubernetes namespaces with a preview of each namespace's details.

## How It Works

1. **Top-Level Menu:** Triggered by running `fzf-menu` in the terminal.
2. **Application Selection:** Choose an application from the menu to navigate through sub-menus until you reach the desired command.

### Example Usage (SSH):

Run `fzf-menu`, select `SSH`, then choose the SSH host from your `~/.ssh/config`.

_![Example GIF Placeholder]_

## Project Structure

```
fzf-menu/
├── fzf-menu.plugin.zsh   # Main entry point that sources all functions
│── fzf-app-ssh.zsh         # SSH host selection
│── fzf-app-kube-ctx.zsh    # Kubernetes context selection function
│── fzf-app-kube-ns.zsh     # Kubernetes namespace selection function with preview
# Additional custom apps...
├── .gitignore            # Specifies files to ignore in the repository
├── LICENSE               # License information
└── README.md             # Documentation
```

## Installation

### Prerequisites

- [Oh My Zsh](https://ohmyz.sh/)
- [fzf](https://github.com/junegunn/fzf)

### Steps

1. **Clone the Repository:**

   ```sh
   git clone https://github.com/graybern/oh-my-zsh-plugin-fzf-menu.git ~/.oh-my-zsh/custom/plugins/fzf-menu
   ```

2. **Enable the Plugin:**

   Add `fzf-menu` to the plugins array in your `~/.zshrc` file:

   ```zsh
   plugins=(... fzf-menu)
   ```

3. **Reload Zsh Configuration:**

   Apply the changes by sourcing your `~/.zshrc`:

   ```sh
   source ~/.zshrc
   ```

## Customization

To add additional applications and sub-menus:

1. **Configure Menu Options:** Modify `fzf-menu.plugin.zsh` to include new menu options.
2. **Add Custom Scripts:** Place additional `.zsh` scripts in the plugin's root directory.

### Example: Adding a New Application

To add a new application, follow these steps:

1. **Update the Main Menu:**

   In `fzf-menu.plugin.zsh`, add your new application to the main prompt selection:

   ```bash
   # fzf-menu.plugin.zsh (top-level fzf alias)

   # Update main prompt selection
   ...
   app=$(printf "SSH\nGit\nDocker\nKubernetes\nTmux\nAsciinema\n**Fun**\nNewApp" | fzf \
       --prompt="Select Application: " \
       --height=10 \
       --reverse)
   ...
   ```

2. **Handle the New Application Selection:**

   Extend the case statement to handle the new application:

   ```bash
   # Handle application selection
   ...
   case "$app" in
       "Kubernetes")
           function=$(printf "fzf-app-kubectx\nfzf-app-kubens" | fzf \
               --prompt="Select Kubernetes Function: " \
               --height=10 \
               --reverse)
           ;;
       "NewApp")
           fzf-app-newapp
           ;;
   esac
   ...
   ```

3. **Create the Application Script:**

   Implement the functionality for your new application in a separate `.zsh` script, e.g., `fzf-app-newapp.zsh`:

   ```bash
   # fzf-app-newapp.zsh (application fzf alias)

   # Configure the application sub-menu
   fzf-app-newapp() {
       local selected_option
       selected_option=$(echo -e "Option1\nOption2\nOption3" | fzf \
           --prompt="Select an option: " \
           --height=10 \
           --reverse \
           --preview="echo {} details")

       # Check if an option was selected
       if [[ -n "$selected_option" ]]; then
           echo "You selected: $selected_option"
           # Add your command execution logic here
       else
           echo "No option selected."
       fi
   }
   ```

4. **Reload Zsh Configuration:**

   Apply the changes by sourcing your `~/.zshrc`:

   ```sh
   source ~/.zshrc
   ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Oh My Zsh](https://ohmyz.sh/)
- [fzf](https://github.com/junegunn/fzf)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
