.PHONY: kill build down

include .env

all: 
	mkdir -p ${HOME}/goinfre/transcendence/postgres/data
	docker compose up

kill:
	docker compose kill

down:
	docker compose down

clean: down
	docker system prune

fclean: clean
	# docker image rm srcs_nginx || true
	# docker image rm srcs_wordpress || true
	# docker image rm srcs_mariadb || true
	# docker volume prune -f --filter "label=src_*"

re: fclean all
