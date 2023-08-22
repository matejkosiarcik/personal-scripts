# Helper Makefile to group development tasks

MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/sh  # for compatibility (mainly with redhat distros)
.SHELLFLAGS := -ec
PROJECT_DIR := $(abspath $(dir $(MAKEFILE_LIST)))
PATH := $(PROJECT_DIR)/venv/bin:$(PATH)

.POSIX:

.DEFAULT: all
.PHONY: all
all: clean bootstrap build install

.PHONY: bootstrap
bootstrap:`
	# Check if virtual environment exists or create it
	[ -n "$${VIRTUAL_ENV+x}" ] || \
		[ -d venv ] \
		|| python3 -m venv venv \
		|| python -m venv venv \
		|| virtualenv venv \
		|| mkvirtualenv venv

	# Install project dependencies
	python3 -m pip install --requirement requirements.txt

	# Install system dependencies
	rm -rf dependencies/venv
	cd dependencies && \
		python3 -m venv venv && \
		PATH="$$PWD/venv/bin:$$PATH" python3 -m pip install --requirement requirements.txt

.PHONY: build
build:
	npm --prefix scripts/photos-to-pdf run build

.PHONY: install
install: build
	dotbot -c install.conf.yml

.PHONY: clean
clean:
	rm -rf venv
	rm -rf dependencies/venv
	rm -rf scripts/photos-to-pdf/node_modules
	rm -rf scripts/photos-to-pdf/dist
