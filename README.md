# dotfiles

Dotfiles, ansible and scripts that are used to setup PopOS machine.

To setup machine, run

```bash
sudo apt-get update -y && sudo apt-get install -y ansible software-properties-common
ansible-pull -K -U https://github.com/apstanisic/dotfiles.git
```

To rerun some tasks locally
```bash
# Change tag to desired tasks
ansible-playbook ~/.dotfiles/local.yml -K --tag dotfiles
```
