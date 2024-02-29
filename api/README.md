# Nest CQRS Rest api example

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fkyhsa93%2Fnestjs-rest-cqrs-example&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

This is sample nestjs project.
- link: https://nestjs.com

## Introduction
### Purpose of this Repository
This is a main goals of this repository:
- Showing how you can implement application for microservice architecture

Domain Driven Design and CQRS can be used to design individual services in msa.

This repository presents examples of applications using domain-driven design and CQRS using nest, a nodejs framework using typescript.

The domain-driven design consists of four layers, each consisting of interface, application, domain, and infrastructure.

Each layer depends on a different layer, and we want to start with the most important layer, the domain layer.

It also briefly summarizes how CQRS is implemented with domain driven design and how event driven appears in this configuration.

### Domain Layer
---
The domain layer is the core layer in domain-driven design and the highest level layer that does not depend on any layer.

Here, a model consisting of aggregate, entity, and vo is implemented, and the model has core business logic inside.

In addition, domain events generated by business logic execution and the repository interface of the domain model are defined here.

The repository basically manages a collection of domain objects.

In addition, with a separated interface pattern, the interface of the repository exists in the domain layer and the implementation is in the infrastructure layer.

Here, when creating a domain object, the factory pattern is used to use the factory.

Events defined here are called domain events and are issued when domain logic is executed, and domain events are received by domain event handlers in the application layer and execute logic according to the event.

### Application Layer
---
The application layer depends on the domain layer and executes the domain logic of the domain model.

In addition, domain events generated by executing domain logic are handled through domain event handlers.

Integration events that are issued to services in external contexts are defined here, domain events received by domain event handlers are processed, and these integration events are published through the integration event publisher.

In addition to the integration event publisher, adapters for external communication are defined here as interfaces.

This allows you to configure integration with other services of msa in a synchronous or asynchronous manner.

In the application layer, the implementation of cqrs inside the service is shown.

You define command and query objects, and implement handlers that execute them.

Command and query are implemented separately, and the handler that handles them is also implemented and executed separately.

The point to note here is that access to the domain is done only by command, so all events are triggered by command.

Each command and command handler creates a domain object or gets it from the repository, executes the domain logic, and stores it through the repository.

On the other hand, query is processed through query handler, but executes only the query defined as interface without accessing the domain and returns the result.

### Interface Layer
---
In the interface layer, it depends on the application layer, generates necessary commands and queries and executes them through the bus.

This layer defines interfaces provided to users or other services, receives http, message, etc., verifies the request and returns a response if necessary.

### Infrastructure Layer
---
The infrastructure layer is responsible for implementing detailed technology at each other layer.

These can be technical contents such as repository in domain, publisher, adapter in application, controller in interface, etc.

Examples include database implementation and access, communication or messaging systems, caching or external communication technologies.

By having all of these detailed implementations in the infrastructure layer, you can isolate technical changes so that changes do not spread to other parts.

Please refer to the image below.[[image source]](http://seedstack.org/docs/business/layers/)

<img width="502" alt="Screenshot 2020-12-15 at 11 32 25 PM" src="https://user-images.githubusercontent.com/20676870/102228546-2b27b480-3f2e-11eb-8312-453fa669612e.png">

## Getting started
This is REST api made by node.js, nest, redis, mysql with typescript.

So you have to get node.js environment, redis for cache, mysql for database, know typescript syntax.

### Prerequisites
---
Please install node.js and I recommend to use docker for your database.

My recommand node.js version is dubnium and latest docker version.

* Install node.js: [https://nodejs.org/en/download/](https://nodejs.org/en/download/)

* Install Docker Desktop for MAC: [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/)

* Install Docker Desktop for Windows: [https://docs.docker.com/docker-for-windows/install/](https://docs.docker.com/docker-for-windows/install/)

* Install compose: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

## Create development environment
First, clone this repository into your local environment. Run followed command in your terminal.

```bash
  git clone https://github.com/kyhsa93/nestjs-rest-cqrs-example.git
```

Second step, install package that needed in this project.

If your node.js environment is successly downloaded, you can use node package manager.

Run followed command in your terminal.

```bash
  npm install
```

Next up, generate mysql and redis.

If you already have mysql, redis in your development environment, you can use that.

But if you don't have one or both, try this process.

Install docker for your OS from link in top of this documentation.

And run followed command.

If your docker is successfully installed, you can use docker cli.

```bash
  docker run --name nest -d -p 3306:3306 -e MYSQL_DATABASE=nest -e MYSQL_ROOT_PASSWORD=test -v ~/database/nest:/var/lib/mysql mysql:5.7
  docker run --name redis -d -p 6379:6379 redis:alpine

  OR

  docker-compose -f docker-compose.development.yml up -d # create mysql, redis container for development environment
  docker-compose -f docker-compose.development.yml down  # remove created containers
```

And then, you can connect mysql in http://localhost:3306, user name 'root' and password is 'test'.

Finaly, your develop environment is created.

You can start api with followed command.

```bash
  npm start
```

And if you modify code and save, you can see the process detect code changes and restart it self.

## Start with docker
If you can use docker cli, you can build docker image.

```bash
  docker build -t nest-sample
  docker images # list up docker images
```

And then you can create and run docker container using builded image.

```bash
  docker run -d -p 5000:5000 nest-sample
  docker ps # list up running container
```

and now you can connect api through http://localhost:5000.

## Start with docker compose
Docker compose in this project is include api redis and mysql 5.7 for database.

Run followed command in project directory.

```bash
  docker-compose up -d # build images, create and run containers in background
```

If container is created, you can access api on http://localhost:5000.

And you can access database through http://localhost:3306.

Default database user is root and password is test.

If you want apply your modified code into the running container, you can add build option.

```bash
  docker-compose up -d --build # if source code is changed, rebuild image, recreate and start container
```

After use compose, you have to stop and remove containers.

```bash
  docker-compose down # stop and remove container in compose
```

## Start with kubernetes
If you want to use kubernetes, you can use manifest.yaml for apply to your kubernetes cluster.

Use minikube for create kubernetes locally or use your own kubernetes. (docker for desktop can be enable local cluster)

Minikube: [https://kubernetes.io/docs/setup/learning-environment/minikube/](https://kubernetes.io/docs/setup/learning-environment/minikube/)

```bash
  kubectl apply -f manifest.yaml  # create kubernetes resource in your kubernetes using manifest.yaml file
  kubectl delete -f manifest.yaml # delete kubernetes resource using manifest.yaml file
```

When all Deployment, Service and Pods is created, you can use api through http://localhost.

Also swagger ui address is http://localhost/api.

If you want see all container in deployment, you can use kubectl.

```bash
  kubectl get all # print all kubernetes default namespace
  kubectl logs deployment.apps/nestjs-rest-cqrs-example --all-containers=true
  kubectl logs deployment.apps/nestjs-rest-cqrs-example --all-containers=true -f
```

About kubernetes: [https://kubernetes.io/](https://kubernetes.io/)

### Start with helm

Helm can help you to manage kubernetes applications.

Helm Charts help you define, install, and upgrade even the most complex Kubernetes application.

```bash
  helm install --name <releasename> helm # create helm chart
  helm delete --purge <releasename> # delete helm chart
```

About helm: [https://helm.sh/](https://helm.sh/)

## Configuration
All configuration is in [src/app.config.ts](https://github.com/kyhsa93/nestJS-sample/blob/main/src/Config.ts)

Most default configuration can use through you environment values.

And also you can modify configurations.

## Documentation
Documentaion about this project is made swagger.

Start this api and connect http://localhost:5000/api in your browser.

## Scripts
```bash
  git clone https://github.com/kyhsa93/nestjs-rest-cqrs-example.git # clone this project

  # run mysql database container
  docker run --name nest -d -p 3306:3306 -e MYSQL_DATABASE=nest -e MYSQL_ROOT_PASSWORD=test -v ~/database/nest:/var/lib/mysql mysql:5.7

  docker build -t nest-sample # build docker image named nest-sample

  docker images # list up docker images

  docker run -d -p 5000:5000 nest-sample # run docker container using image nameed nest-sample (host port 5000 is mapped container port 5000 and container run background process)

  docker ps # list up running container

  docker-compose up -d # build images, create and start containers in background

  docker-compose up -d --build # if container image's change exists, rebuild image, recreate and restart container

  docker-compose down # stop and remove container in compose

  npm install   # install packges
  npm test      # run test
  npm run build # transpile typescript
  npm start     # run sample code

  docker-compose up # use compose
  
  kubectl apply -f manifest.yaml  # create kubernetes resource in your kubernetes using manifest.yaml file
  kubectl delete -f manifest.yaml # delete kubernetes resource using manifest.yaml file

  kubectl get all # print all kubernetes default namespace
  kubectl logs deployment.apps/nestjs-rest-cqrs-example --all-containers=true
  kubectl logs deployment.apps/nestjs-rest-cqrs-example --all-containers=true -f

  helm install --name <releasename> helm # create helm chart
  helm delete --purge <releasename> # delete helm chart
```

## Troubleshooting

- docker-compose: npm ci The `npm ci` command can only install with an existing package-lock.json or
1.432 npm ERR! npm-shrinkwrap.json with lockfileVersion >= 1. Run an install with npm@5 or
1.432 npm ERR! later to generate a package-lock.json file, then try again.
  - Solution: `npm install`

## Links
Github: [https://github.com/kyhsa93/nestjs-rest-cqrs-example](https://github.com/kyhsa93/nestjs-rest-cqrs-example)

Dockerhub: [https://cloud.docker.com/repository/docker/kyhsa93/nestjs-rest-cqrs-example/](https://cloud.docker.com/repository/docker/kyhsa93/nestjs-rest-cqrs-example/)