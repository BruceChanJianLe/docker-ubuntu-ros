# Tags: https://hub.docker.com/r/osrf/ros/tags
FROM osrf/ros:melodic-desktop-full

LABEL maintainer="brucechanjianle <jianle001@e.ntu.edu.sg>"

# Replace shell with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Update and upgrade
RUN apt-get update -y \
        && apt-get upgrade -y \
        && apt-get -y autoclean

# Common dependencies
RUN apt-get update -y && apt-get install -y vim \
        git \
        gdb \
        tmux \
        curl \
        wget \
        python3-dev \
        python3-pip \
        apt-utils \
        bash-completion

# Setup tmux and vim
RUN curl -o ~/.tmux.conf https://raw.githubusercontent.com/BruceChanJianLe/TMUX_Setup/master/.tmux.conf \
        && curl https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux > ~/.bash_completion \
        && echo "source ~/.bash_completion" >> ~/.bashrc \
        && curl -o ~/.vimrc https://raw.githubusercontent.com/BruceChanJianLe/vim/master/.vimrc \
        && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell \
        && echo -e "\n# Base16 Shell" >> ~/.bashrc \
        && echo "BASE16_SHELL=\"\$HOME/.config/base16-shell/\"" >> ~/.bashrc \
        && echo "[ -n \"\$PS1\" ] && \\"  >> ~/.bashrc \
        && echo "    [ -s \"\$BASE16_SHELL/profile_helper.sh\" ] && \\"  >> ~/.bashrc \
        && echo "        eval \"\$(\"\$BASE16_SHELL/profile_helper.sh\")\"" >> ~/.bashrc

# Setup color prompt and git
RUN echo -e "\nparse_git_branch() {\n git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'\n}" >> ~/.bashrc \
        && echo -e "\nPS1='🐳\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]\$ '" >> ~/.bashrc \
        && sed -ie 's|#    . /etc/bash_completion|. /etc/bash_completion|g' ~/.bashrc 

# Source ROS
RUN echo -e "\nsource /opt/ros/\$ROS_DISTRO/setup.bash" >> ~/.bashrc

# config & cleanup
RUN apt-get autoclean -y && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/* /tmp/*

WORKDIR /root/docker_mount/

ENTRYPOINT ["bash"]
