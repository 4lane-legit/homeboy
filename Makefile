export COMPOSE_FLAGS

.PHONY: gen-cert build_targets run

build_targets: 
	docker-compose build --pull

run:
	docker-compose ${COMPOSE_FLAGS} up -d gateway

stop:
	docker-compose stop

gen-cert:
## target is TBD

start-localstack:
	cd localstack && docker-compose up -d

stop-localstack:
	cd localstack && docker-compose stop