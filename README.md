# Lunarvim & Tmux による開発用コンテナ

## 実行方法
* `docker compose up -d --build`
* `docker exec -it lviim-tmux tmux` tmuxで起動する
* `docker attach` 起動しているbashで入る
* コンテナ内で使用したいパッケージは`packages/packages.txt`内に記述する
* ホストOS側でalacrittyを使用する場合<br>`cp setting_files/.alacritty.yml ~/.alacritty.yml && alacritty migrate`<br>を実行するとコンテナが稼働中&&alacritty起動時に自動でコンテナ環境に入る

## 注意事項
* docker-composeにsudoが必要な場合は `sudo env USER=$USER docker-compose up -d --build`
* DockerImageのビルドに数十分かかります
* /home/${USER}/.ssh/id_rsaを生成しておく必要があります
