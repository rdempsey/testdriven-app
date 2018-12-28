#!/usr/bin/env bash

# Set up the database from scratch and run all migrations
docker-compose -f docker-compose-dev.yml run users python manage.py recreate-db
docker-compose -f docker-compose-dev.yml run users python manage.py seed-db
docker-compose -f docker-compose-dev.yml run users python manage.py db upgrade

