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
bootstrap:
	# Check if virtual environment exists or create it
	[ -n "$${VIRTUAL_ENV+x}" ] || \
		[ -d venv ] \
		|| python3 -m venv venv \
		|| python -m venv venv \
		|| virtualenv venv \
		|| mkvirtualenv venv

	# Install project dependencies
	python3 -m pip install --requirement requirements.txt

	# Python dependencies
	parallel python3 -m venv ::: deamons/photo-import/venv deamons/screenrecording-rename/venv deamons/screenshots-rename/venv
	tmpfile="$(shell mktemp)" && \
	printf 'deamons/photo-import\ndeamons/screenrecording-rename\ndeamons/screenshots-rename\n' >"$$tmpfile" && \
	while read -r dir; do \
		cd "$(PROJECT_DIR)/$$dir" && \
		PATH="$$PWD/venv/bin:$(PATH)" \
		PIP_DISABLE_PIP_VERSION_CHECK=1 \
			pip install --requirement requirements.txt --quiet --upgrade && \
	true; done <"$$tmpfile" && \
	rm -f "$$tmpfile"

	# NodeJS dependencies
	npm install --no-save --no-progress --no-audit --quiet --prefix scripts/photos-to-pdf

.PHONY: build
build:
	npm --prefix scripts/photos-to-pdf run build

.PHONY: install
install:
	dotbot -c install.conf.yml

.PHONY: clean
clean:
	rm -rf venv
	rm -rf deamons/photo-import/venv
	rm -rf deamons/screenrecording-rename/venv
	rm -rf deamons/screenshots-rename/venv
	rm -rf scripts/photos-to-pdf/node_modules
	rm -rf scripts/photos-to-pdf/dist
