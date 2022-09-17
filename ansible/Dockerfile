FROM ubuntu
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install ansible neovim sudo -y
# Create normal user "user1" with password "qwer" that has sudo access
RUN useradd -rm -d /home/user1 -s /bin/bash -g root -G sudo -u 1000 user1 -p "$(openssl passwd -1 qwer)"
# Become user1 
USER user1
# Go to user1 folder
WORKDIR /home/user1
# Copy ansible files
COPY local.yml local.yml
COPY tasks tasks
# Docker does not set user variable, but it's needed for nix
# Othervise .profile script won't run
ENV USER user1
# Used for testing in clean env
# To build:
# docker build -t ans-docker .
# To run:
# docker run --rm -it ans-docker
