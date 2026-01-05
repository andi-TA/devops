FILE_YML = srcs/docker-compose.yml

CONTAINER = react

PERMISSION_SCRIPT = chmod +x script_ssl_generate/script.sh

BIND_DB = mkdir -p /home/atahiry-/data/database/

all: build

run_ssl_key:
	@${PERMISSION_SCRIPT}
	@script_ssl_generate/script.sh


build: run_ssl_key
	@${BIND_DB}
	docker compose -f ${FILE_YML} up --build

stop:
	docker compose -f ${FILE_YML} stop

start:
	docker compose -f ${FILE_YML} start

clean:
	docker image prune -f
	docker compose -f ${FILE_YML} down --remove-orphans -v --rmi all

info:
	docker compose -f ${FILE_YML} ps
	@echo "---------------- logs"
	docker compose -f ${FILE_YML} logs
	@echo "---------------- logs"

exec:
	docker compose -f ${FILE_YML} exec ${CONTAINER} sh

.PHONY: info stop start build clean exec all