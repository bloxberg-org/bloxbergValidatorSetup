#!/bin/bash
docker-compose -f validator.yml build --no-cache --force-rm validator
docker-compose -f validator.yml stop validator
docker-compose -f validator.yml up -d validator
docker-compose -f validator.yml logs -f --tail=20 validator
