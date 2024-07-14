FROM debian:stable-slim
WORKDIR /root/
CMD ["/bin/bash", "--login"]

LABEL maintainer="rikeda"
LABEL version="1.0"


RUN apt-get -y update && apt-get -y upgrade

# 必要なパッケージのインストール
COPY packages/core_packages.txt /tmp/core_packages.txt
RUN xargs -a /tmp/core_packages.txt apt-get -y install

# neovimをインストール
RUN git clone https://github.com/neovim/neovim.git /neovim && \
	cd /neovim && \
	git checkout stable && \
	make CMAKE_BUILD_TYPE=Release && \
	make install

# LunarVimのインストール
RUN curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh -o install.sh && \
	bash install.sh -- --no-install-dependencies && \
	rm install.sh

# StarShipのインストール
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes && \
	starship preset no-runtime-versions -o /root/.config/starship.toml

# カスタムパッケージのインストール
COPY packages/packages.txt /tmp/packages.txt
RUN xargs -a /tmp/packages.txt apt-get -y install

# configfileのCOPY
COPY setting_files/.profile setting_files/.bashrc setting_files/.tmux.conf setting_files/.tmux.start.conf /root/
COPY setting_files/config.lua /root/.config/lvim/
