#! /usr/bin/env /bin/bash

python3 transcendence/manage.py makemigrations dbconnect
python3 transcendence/manage.py migrate