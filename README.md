# Rapid Ansible Iteration

1. Make changes to the yaml file
2. Rebuild the docker image `sudo ./build.sh`
3. Run a temporary docker container `sudo docker --rm -it nvim-computer bash`
4. When in the container run `ansible-playbook -t <tags> -v <playbook.yaml>`

Note: `-t <tags>` allows you to run tasks with the given tag.

# Process for installing new ZSH plugin

- Install location for custom plugins `~/.oh-my-zsh/custom/plugins` or `$ZSH_CUSTOM`.
- Modify ansible to use git and clone the plugin's repo.
- Go to dotfiles repo and edit the plugins line in `.zshrc` and commit the change.
- Rerun ansible to pull the personal dotfiles then install the dependencies.
