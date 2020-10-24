export COMPOSE_FLAGS

.PHONY: gen-cert build_targets run

build_targets: 
	docker-compose build --pull

run:
	docker-compose ${COMPOSE_FLAGS} up -d gateway

gen-cert:
## target is TBD