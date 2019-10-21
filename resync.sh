#!/bin/bash
docker-compose -f validator.yml stop validator
docker-compose -f validator.yml run validator --resync
docker-compose -f validator.yml up -d validator
docker-compose -f validator.yml logs -f --tail=10 validator
