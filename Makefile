.PHONY: all deps fix pip build serve install replace upgrade venv install-venv upgrade upgrade-venv replace replace-venv reinstall watch deploy;

UID := $(shell id -u)
GID := $(shell id -g)

export VIRTUAL_ENV := $(abspath "./venv")
export VIRTUAL_ENV_BIN := $(abspath "./venv/bin")
export PATH := $(VIRTUAL_ENV_BIN):$(PATH)

-include .env
export

all: deploy
deps: pip upgrade
install: install-venv
upgrade: remove-venv install-venv
watch: serve
fix:
	sudo chown -R $(UID):$(GID) .
	sudo chmod -R a+rwX .
pip:
	sudo apt-get install -y git python3 python3-pip python3-venv python3-wheel
venv: install-venv
remove-venv:
	rm -rf ./venv
install-venv:
	python3 -m venv venv
	. ./venv/bin/activate
	./venv/bin/pip3 install wheel
	# Material for MkDocs Insiders is now free for everyone:
	# https://squidfunk.github.io/mkdocs-material/blog/2025/11/11/insiders-now-free-for-everyone/#switching-from-insiders
	./venv/bin/pip3 install --disable-pip-version-check mkdocs-material
	./venv/bin/pip3 install --disable-pip-version-check -r requirements.txt
serve:
	./venv/bin/mkdocs serve --livereload --watch docs --watch overrides --watch mkdocs.yml -a 0.0.0.0:8000
build:
	./venv/bin/mkdocs build --config-file mkdocs.deploy.yml
deploy:
	./venv/bin/mkdocs gh-deploy --force --config-file mkdocs.deploy.yml
pull:
	git checkout develop
	git pull origin develop
push:
	git checkout develop
	git push origin develop
replace: upgrade
merge:
	git checkout deploy
	git pull origin deploy
	git merge develop
	git push origin deploy
	git checkout develop
img-resize:
	mogrify -resize '1000x860>' docs/user-guide/img/*.jpg
	mogrify -resize '1000x860>' docs/user-guide/**/img/*.jpg
