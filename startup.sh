export UID=$(id -u) > /dev/null 2>&1
export GID=$(id -g) > /dev/null 2>&1

if which docker-compose > /dev/null 2>&1; then
	sudo env USER=$USER UID=$UID GID=$GID docker-compose up -d --build
else
	docker compose up -d --build
fi

# このコマンドで起動時にtmuxで立ち上げ
# docker exec -it lvim-tmux tmux new-session -s mysession /bin/bash -c "umask 0000 && /bin/bash --login"
