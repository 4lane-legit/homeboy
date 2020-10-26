export COMPOSE_FLAGS

.PHONY: gen-cert build_targets run

build_targets: 
	docker-compose build --pull

run:
	docker-compose ${COMPOSE_FLAGS} up -d gateway

stop:
	docker-compose stop

gen-cert:
	chmod +x gateway/gen-cert.sh 
	cd gateway && sh gen-cert.sh 
	cd gateway && rm -rf server*

start-localstack:
	cd localstack && docker-compose up -d

stop-localstack:
	cd localstack && docker-compose stop