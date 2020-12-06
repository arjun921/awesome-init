export MACHINE_NAME=$HOSTNAME-$(whoami)
sudo apt update
sudo apt install vim curl zsh unzip python3-pip -y

# SSH keygen for github/gitlab
cat /dev/zero | ssh-keygen -t ed25519 -C $MACHINE_NAME -q -N ""
cat ~/.ssh/id_ed25519.pub

# git config
git config --global user.name "Arjun Sunil"
git config --global user.email "arjun921@gmail.com"

# install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "# Launch Zsh
if [ -t 1 ]; then
exec zsh
fi
" >> ~/.bashrc  
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip && sudo ./aws/install
rm -rf awscliv2.zip aws

# auto env
# cd directory_with_.env_file
# executes .env in shell
pip install autoenv
