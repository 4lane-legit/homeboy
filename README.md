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

## How to set this whole thing up ?
Setting up the services stack is super easy, 
run the commands in following sequence. 
```
make gen-cert
make build_targets
make run
```
make run command spins up all the dockers, docker networks and volumes in background.

### TDB:
Setup local stack on a kind cluster, side car SSO for all downstream services.

### Downstream services includes are.
1: kicks-cms:
Content management with god level search capabilities.
https://github.com/4lane-legit/kicks-cms

