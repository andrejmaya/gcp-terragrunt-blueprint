# USAGE
define USAGE
Usage: make [help | install | lint | fmt | plan | apply | destroy]
endef
export USAGE

TF_DIR := ./terraform
UNAME := $(shell uname -s)

help:
	@echo "$$USAGE"

install:
	tfenv install
	tgenv install 0.67.4

bootstrap: install init plan

lint:
	./scripts/lint.sh

fmt:
	./scripts/fmt.sh

login:
	gcloud auth application-default login

init:
	./scripts/init.sh

plan: init
	./scripts/plan.sh

apply:
	./scripts/apply.sh

destroy:
	./scripts/destroy.sh
