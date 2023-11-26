.PHONY: kill build down

include .env

all: 
	chmod +x ./postgres/pg_init.sh
	chmod +x ./backend/migrations.sh
	docker compose up

kill:
	docker compose kill

down:
	docker compose down

rmvolumes:
	docker compose down --volumes

clean: down
	docker system prune

fclean: clean
	# docker image rm srcs_nginx || true
	# docker image rm srcs_wordpress || true
	# docker image rm srcs_mariadb || true
	# docker volume prune -f --filter "label=src_*"

re: fclean all

revolumes: rmvolumes all
