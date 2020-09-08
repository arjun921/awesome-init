export MACHINE_NAME=
sudo apt update
sudo apt install vim -y
cat /dev/zero | ssh-keygen -t ed25519 -C "Blackhawk" -q -N ""
