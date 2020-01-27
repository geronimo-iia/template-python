# Project settings
PACKAGE := {{cookiecutter.package_name}}
REPOSITORY := {{cookiecutter.github_username}}/{{cookiecutter.github_repo}}
PACKAGES := $(PACKAGE) tests
MODULES := $(wildcard $(PACKAGE)/*.py)

# MAIN TASKS ##################################################################

.PHONY: all
all: install

.PHONY: ci
ci: check test ## Run all tasks that determine CI status

# SYSTEM DEPENDENCIES #########################################################

.PHONY: doctor
doctor:  ## Confirm system dependencies are available
	bin/verchew

.PHONY: debug-info
debug-info:  ## Show poetry debug info
	poetry debug:info

# PROJECT DEPENDENCIES ########################################################

install: .install .cache | $(directory) ## Install project dependencies

.install: poetry.lock
	poetry install
	poetry check
	@touch $@

poetry.lock: pyproject.toml
	poetry lock

.cache:
	@mkdir -p .cache

# Install pre-commit only if we are in a git repository
directory = $(wildcard ./.git)
$(directory):
	poetry run pre-commit install -f --install-hooks

requirements.txt: poetry.lock ## Generate requirements.txt
	poetry export --without-hashes -f requirements.txt > requirements.txt


# CHECKS ######################################################################

.PHONY: check
check: install   ## Run linters and static analysis
	poetry run isort $(PACKAGES) --recursive --apply
	poetry run black $(PACKAGES)
	poetry run flake8 $(PACKAGES)
	poetry run pydocstyle $(PACKAGES) $(wildcard *.py)
	poetry run mypy $(PACKAGE)

# TESTS #######################################################################

RANDOM_SEED ?= $(shell date +%s)
FAILURES := .cache/v/cache/lastfailed
PYTEST_OPTIONS := --random --random-seed=$(RANDOM_SEED)
ifdef DISABLE_COVERAGE
	PYTEST_OPTIONS += --no-cov --disable-warnings
endif

.PHONY: test
test: install ## Run unit tests

	@if test -e $(FAILURES); then poetry run pytest tests --last-failed --exitfirst; fi
	@rm -rf $(FAILURES)
	poetry run pytest tests $(PYTEST_OPTIONS)
	{%- if cookiecutter.use_coveragespace == "true" -%}
	poetry run coveragespace $(REPOSITORY) overall
	{% endif %}
ifndef DISABLE_COVERAGE
	bin/open htmlcov/index.html
endif


# BUILD #######################################################################

DIST_FILES := dist/*.tar.gz dist/*.whl

.PHONY: build
build: install check test $(DIST_FILES) ## Builds the source and wheels archives
$(DIST_FILES): $(MODULES) pyproject.toml
	@rm -f $(DIST_FILES)
	poetry build

# RELEASE #####################################################################

.PHONY: publish
publish: build ## Publishes the package, previously built with the build command, to the remote repository
	@git diff --name-only --exit-code
	poetry publish
	PROJECT_RELEASE := $$(sed -n -E "s/__version__ = '(.+)'/\1/p" {{cookiecutter.package_name}}/__version__.py)
	@git tag "v$(PROJECT_RELEASE)"
	@git push origin "v$(PROJECT_RELEASE)"
	@bin/open https://pypi.org/project/{{cookiecutter.project_name}}


# DOC #########################################################################

SPHINX_BUILD_DIR = .cache/sphinx
.PHONY: docs
docs:  ## Build and publish sit documentation.
	@mkdir -p $(SPHINX_BUILD_DIR)
	@poetry run sphinx-build -M html "sphinx" "$(SPHINX_BUILD_DIR)"
	@rm -rf docs/
	@mv $(SPHINX_BUILD_DIR)/html docs/


# CLEANUP #####################################################################

.PHONY: clean
clean:  ## Delete all generated and temporary files
	@rm -rf *.spec dist build .eggs *.egg-info .install
	@rm -rf .cache .pytest .coverage htmlcov
	@find $(PACKAGES) -name '__pycache__' -delete
	@rm -rf *.egg-info

# HELP ########################################################################

.PHONY: help
help: all
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
