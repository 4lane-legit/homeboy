## homeboy is local stack for kick-cms development.
Kicks-cms renders under a local nginx proxy which also routes to the offloader service.

### components:
#### 1: Gateway:
gateway is local gatway proxy that hosts all the services on Https locally using a self signed certificate.
you can generate your own key pair and certificate using command:
```
make gen-cert
```

#### 2: homeboy-mongo
homeboy mongo keeps all the local database information for the multitenant clients, the cloud provider content URLs and CDN urls fpr content, plus a reference to information like API-Keys for multi tenants to access downstream services.

#### 3: keycloak
keycloak SSO is used and is hosted on docker network by name identity_service, the service is backed by a postgres DB that keeps the account of SSO apps and other oauth related stuff

#### 4: localstack (local AWS s3 and SQS setup)
The content service relies heavily on s3 and sqs, so to test integration ahead in time the homeboy repo offers a easy setup for local AWS.
```
make start-localstack
```
To stop the local AWS setup:
```
make stop-localstack
```

To bootstrap AWS s3 content bucket and SQS queue for processing offloading requests, use localstack/docker-compose.yaml
and uncomment 
```
- ./bin:/docker-entrypoint-initaws.d 
```
For more details about boilerplate scirpt check localstack/bin/localstack-entrypoint.sh

## How to set this whole thing up ?
Setting up the services stack is super easy, 
run the commands in following sequence. 
```
make gen-cert
make build_targets
make run
```
make run command spins up all the dockers, docker networks and volumes in background.

### TBD:
Setup local stack on a kind cluster, side car SSO for all downstream services.

### Downstream services includes are.
1: kicks-cms:
Content management with god level search capabilities.
https://github.com/4lane-legit/kicks-cms

