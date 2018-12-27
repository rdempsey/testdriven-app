# Microservices with Docker, Flask, and React

[![Build Status](https://travis-ci.org/rdempsey/testdriven-app.svg?branch=master)](https://travis-ci.org/rdempsey/testdriven-app)

This application is an example of a micro-services architecture using Docker, Flask and React from the online course, [Microservices with Docker, Flask, and React](https://testdriven.io/courses/microservices-with-docker-flask-and-react/)

## Manage the Application

Deploy the application:
```
docker-compose -f docker-compose-dev.yml up -d --build
```

Create the database:
```
docker-compose -f docker-compose-dev.yml run users python manage.py recreate-db
```

Seed the database:
```
docker-compose -f docker-compose-dev.yml run users python manage.py recreate-db
```

Run the tests:
```
docker-compose -f docker-compose-dev.yml run users python manage.py test
```

Run the tests with coverage:
```
docker-compose -f docker-compose-dev.yml run users python manage.py cov
```

Run Flake8:
```
docker-compose -f docker-compose-dev.yml run users flake8 project
```

Access the Postgres container:
```
docker-compose -f docker-compose-dev.yml exec users-db psql -U postgres
# \c users_dev
# select * from users;
```