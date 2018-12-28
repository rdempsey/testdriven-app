# Microservices with Docker, Flask, and React

[![Build Status](https://travis-ci.com/rdempsey/testdriven-app.svg?branch=master)](https://travis-ci.com/rdempsey/testdriven-app)

This application is an example of a micro-services architecture using Docker, Flask and React from the online course, [Microservices with Docker, Flask, and React](https://testdriven.io/courses/microservices-with-docker-flask-and-react/)

## Manage the Application

* Deploy the application: `docker-compose -f docker-compose-dev.yml up -d --build`
* Create the database: `docker-compose -f docker-compose-dev.yml run users python manage.py recreate-db`
* Seed the database: `docker-compose -f docker-compose-dev.yml run users python manage.py seed-db`
* Run the Python tests: `docker-compose -f docker-compose-dev.yml run users python manage.py test`
* Run the Python tests with coverage: `docker-compose -f docker-compose-dev.yml run users python manage.py cov`
* Run Flake8: `docker-compose -f docker-compose-dev.yml run users flake8 project`
* Run the client-side (npm) tests: `docker-compose -f docker-compose-dev.yml run client npm test`
* Access the container logs: `docker-compose -f docker-compose-dev.yml logs -f`
* Access the Postgres container: `docker-compose -f docker-compose-dev.yml exec users-db psql -U postgres`

## Run a Multi-Stage Docker Build for the Client

```
docker build -f Dockerfile-prod -t "test" ./ \
  --build-arg NODE_ENV=development \
  --build-arg REACT_APP_USERS_SERVICE_URL=http://127.0.0.1
```


## Running Database Migrations

* Create a migration repository: `docker-compose -f docker-compose-dev.yml run users python manage.py db init`
* Generate an initial migration: `docker-compose -f docker-compose-dev.yml run users python manage.py db migrate`
* Apply the migrations to the database: `docker-compose -f docker-compose-dev.yml run users python manage.py db upgrade`


## Access the Application

* Homepage: [http://localhost](http://localhost)
* Users: [http://localhost/users](http://localhost/users)

## Working With the Postgres Database

Once you access the Postgres database (see above):

* Choose the `users_dev` database: `# \c users_dev`
* Describe the `users` table: `# \d+ users`
* Select all of the users: `# select * from users;`