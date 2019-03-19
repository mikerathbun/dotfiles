#!/usr/bin/env bash

file=/vagrant_dev/python/django/acas_project/Pipfile.lock

echo "${file#*.} is something"

echo "${file%.*} is sometyhing"
