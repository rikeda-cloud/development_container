# Lunarvim & Tmux による開発用コンテナ

## 実行方法
* `./startup.sh`を実行。`docker compose`コマンドが使用不可の場合、`sudo ./startup.sh`を実行
* `docker exec -it lviim-tmux tmux new-session -s mysession /bin/bash -c "umask 0000 && /bin/bash --login"` tmuxで起動する
* コンテナ内で使用したいパッケージは`packages/packages.txt`内に記述する
* ホストOS側でalacrittyを使用する場合<br>`cp setting_files/.alacritty.yml ~/.alacritty.yml && alacritty migrate`<br>を実行するとコンテナが稼働中&&alacritty起動時に自動でコンテナ環境に入る

## 注意事項
* DockerImageのビルドに数十分かかります
* /home/${USER}/.ssh/を生成しておく必要があります
