FROM debian:stable-slim
LABEL maintainer="rikeda"
LABEL version="2.1"

ARG USER
ARG UID
ARG GID

RUN apt-get -y update && apt-get -y upgrade

# 必須パッケージのインストール
COPY packages/core_packages.txt /tmp/
RUN xargs -a /tmp/core_packages.txt apt-get -y install

# ロケールの追加
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

# ユーザーを作成し、sudo権限を付与
RUN groupadd -g $GID ${USER} && \
	useradd -u ${UID} -g ${GID} -m ${USER} && \
	usermod -aG sudo ${USER} && \
	echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# ユーザーのホームディレクトリを作成し、所有者権限を付与
RUN mkdir -p /home/${USER}/.local && \
	mkdir -p /home/${USER}/.config && \
	chown -R ${USER}:${GID} /home/${USER}

# neovimをインストール
RUN git clone https://github.com/neovim/neovim.git /tmp/neovim && \
	cd /tmp/neovim && \
	git checkout stable && \
	make CMAKE_BUILD_TYPE=Release && \
	make install && \
	rm -rf /tmp/neovim

# StarShipのインストール
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes && \
	starship preset gruvbox-rainbow -o /home/${USER}/.config/starship.toml

# カスタムパッケージのインストール
COPY packages/packages.txt /tmp/
RUN xargs -a /tmp/packages.txt apt-get -y install

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 以降のコマンドを作成したユーザーで実行・ログインユーザーを指定
USER ${USER}
WORKDIR /home/${USER}/

# LunarVimのインストール
RUN curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh -o install.sh && \
	bash install.sh -- --no-install-dependencies && \
	rm install.sh

# rust関係のインストール
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# configfileのCOPY
COPY setting_files/.gitconfig setting_files/.profile setting_files/.bashrc setting_files/.tmux.conf setting_files/.tmux.start.conf /home/${USER}/
COPY setting_files/config.lua /home/${USER}/.config/lvim/

# .envファイルでは動的に環境変数を設定できないためDockerfileで記述
ENV GIT_CONFIG_GLOBAL /home/${USER}/.gitconfig

CMD ["/bin/bash", "--login"]
