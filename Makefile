# Helper Makefile to group development tasks

MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/sh  # for compatibility (mainly with redhat distros)
.SHELLFLAGS := -ec
PROJECT_DIR := $(dir $(abspath $(MAKEFILE_LIST)))

# Set bundle variables to install&use gems in local directory
export BUNDLE_DISABLE_SHARED_GEMS := true
export BUNDLE_PATH__SYSTEM := false
export BUNDLE_PATH := $(PROJECT_DIR)/dependencies/.bundle
export BUNDLE_GEMFILE := $(PROJECT_DIR)/dependencies/Gemfile

# Modify PATH to access dependency binaries
export PATH := $(PROJECT_DIR)/venv/bin:$(PATH)

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
install:
	dotbot -c install.conf.yaml
