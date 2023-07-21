# dotfiles

Dotfiles, ansible and scripts that are used to setup PopOS machine.

To setup machine, run

```bash
# Update packages and install ansible
sudo apt-get update -y && sudo apt-get install -y ansible software-properties-common
# Replace ANSIBLE_SECRET_KEY with key from Bitwarden
echo "ANSIBLE_SECRET_KEY" > $HOME/.config/ansible-vault-key.txt
# Run ansible
ansible-pull -K -U https://github.com/apstanisic/dotfiles.git --vault-password-file $HOME/.config/ansible-vault-key.txt
# For laptop
ansible-pull -K -U https://github.com/apstanisic/dotfiles.git --vault-password-file $HOME/.config/ansible-vault-key.txt --skip-tags "home"
```

To rerun some tasks locally
```bash
# Change tag to desired tasks
ansible-playbook ~/.dotfiles/local.yml -K --tag dotfiles
```
