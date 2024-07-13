FROM debian:stable-slim
WORKDIR /root/
CMD ["/bin/bash", "--login"]

LABEL maintainer="rikeda"
LABEL version="1.0"


RUN apt-get -y update && apt-get -y upgrade

# 必要なパッケージのインストール
COPY packages/core_packages.txt /tmp/core_packages.txt
RUN xargs -a /tmp/core_packages.txt apt-get -y install

# カスタムパッケージのインストール
COPY packages/packages.txt /tmp/packages.txt
RUN xargs -a /tmp/packages.txt apt-get -y install

# neovim binaryをインストール
RUN curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz && \
    tar xzvf nvim-linux64.tar.gz && \
    mv nvim-linux64 /usr/local/nvim && \
    ln -s /usr/local/nvim/bin/nvim /usr/bin/nvim && \
    rm nvim-linux64.tar.gz

# LunarVimのインストール
RUN bash -c "curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/release-1.4/neovim-0.9/utils/installer/install.sh | bash -s -- --no-install-dependencies"

# StarShipのインストール
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes
RUN starship preset no-runtime-versions -o /root/.config/starship.toml

# configfileのCOPY
COPY setting_files/.profile setting_files/.bashrc setting_files/.tmux.conf setting_files/.tmux.start.conf /root/
COPY setting_files/config.lua /root/.config/lvim/
