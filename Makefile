# Helper Makefile to group development tasks

MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/sh  # for compatibility (mainly with redhat distros)
.SHELLFLAGS := -ec
PROJECT_DIR := $(abspath $(dir $(MAKEFILE_LIST)))

# Set bundle variables to install&use gems in local directory
export BUNDLE_DISABLE_SHARED_GEMS := true
export BUNDLE_PATH__SYSTEM := false
export BUNDLE_PATH := $(PROJECT_DIR)/dependencies/.bundle
export BUNDLE_GEMFILE := $(PROJECT_DIR)/dependencies/Gemfile

.POSIX:

.DEFAULT: all
.PHONY: all
all: bootstrap

.PHONY: bootstrap
bootstrap:
	# check if virtual environment exists or create it
	[ -n "$${VIRTUAL_ENV+x}" ] || [ -d venv ] \
		|| python3 -m venv venv \
		|| python -m venv venv \
		|| virtualenv venv \
		|| mkvirtualenv venv

	# install dependencies
	pip install --requirement requirements.txt

.PHONY: install
install: system-setup dotbot

.PHONY: system-setup
system-setup:
	sh system-dependencies/system-setup.sh

.PHONY: dotbot
dotbot: export PATH := $(PROJECT_DIR)/venv/bin:$(PATH)
dotbot:
	dotbot -c install.conf.yaml
