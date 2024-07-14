# Lunarvim & Tmux による開発用コンテナ

## 実行方法
* `docker compose up -d --build`
* `docker exec -it lviim-tmux tmux` tmuxで起動する
* `docker attach` 起動しているbashで入る
* コンテナ内で使用したいパッケージは`packages/packages.txt`内に記述する

## 注意事項
* docker-composeにsudoが必要な場合は `sudo env USER=$USER docker-compose up -d --build`
* DockerImageのビルドに数十分かかります
* /home/${USER}/.ssh/id_rsaを生成しておく必要があります
