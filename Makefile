SHELL := /bin/bash
VENV_DIR := ${CURDIR}/.venv/bin
VENV_PYTHON := ${VENV_DIR}/python
PYTEST_ARGS := ""
TAG := $(shell git rev-parse --short HEAD)
ENVIRONMENT := dev

include .env

.venv:
	@python3 -m venv .venv
	@${VENV_PYTHON} -m pip install -U -q pip pip-tools

.PHONY: install-deps
install-deps: .venv
	@"${VENV_PYTHON}" -m pip install -r requirements.txt

.PHONY: isort-check
isort-check: install-deps
	@${VENV_PYTHON} -m isort -c .

.PHONY: black-check
black-check: install-deps
	@${VENV_PYTHON} -m black .

.PHONY: autoflake-check
autoflake-check: install-deps
	@${VENV_PYTHON} -m autoflake -c --remove-unused-variables --remove-all-unused-imports -r dags tests &> /dev/null

.PHONY: mypy
mypy: install-deps
	@${VENV_PYTHON} -m mypy

.PHONY: lint
lint: autoflake-check isort-check black-check mypy

.PHONY: isort
isort: install-deps
	@${VENV_PYTHON} -m isort .

.PHONY: black
black: install-deps
	@${VENV_PYTHON} -m black .

.PHONY: autoflake
autoflake: install-deps
	@${VENV_PYTHON} -m autoflake --remove-unused-variables --remove-all-unused-imports -i -r -r dags tests

.PHONY: format
format: autoflake isort black

.PHONY: setup
setup:
	docker-compose up -d --force-recreate --remove-orphans
	sleep 120

.PHONY: down
down:
	docker-compose down

.PHONY: test
test: format lint
	docker exec airflow pytest --cov=./ --cov-report=xml ${PYTEST_ARGS}
	docker cp airflow:/opt/airflow/coverage.xml .
	docker cp airflow:/opt/airflow/.coverage .
	