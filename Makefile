SOURCE_FILES = Makefile cookiecutter.json {{cookiecutter.project_slug}}/* {{cookiecutter.project_slug}}/*/*
GENERATED_PROJECT := my-project


# MAIN #########################################################################

.PHONY: all
all: ci

.PHONY: ci
ci: build ## CI Build: Test Sample
	make install -C $(GENERATED_PROJECT)
	make doctor -C $(GENERATED_PROJECT)
	make ci -C $(GENERATED_PROJECT)
	make docs -C $(GENERATED_PROJECT)

.PHONY: watch
watch: install clean
	poetry run sniffer

# DEPENDENCIES #################################################################

install: .install ## Install project

.install: poetry.lock 
ifdef CI
	poetry install --no-dev
else
	poetry install
endif
	@ touch $@

poetry.lock: pyproject.toml
	poetry lock

# BUILD ########################################################################

.PHONY: build
build: install $(GENERATED_PROJECT) ## Generate Sample
$(GENERATED_PROJECT): $(SOURCE_FILES)
	cat cookiecutter.json
	poetry run cookiecutter . --no-input --overwrite-if-exists
	mkdir -p $(GENERATED_PROJECT)
	cd $(GENERATED_PROJECT) && poetry lock
	@ touch $(GENERATED_PROJECT)

# CLEANUP ######################################################################

.PHONY: clean
clean: ## Delete all generated and temporary files
	rm -rf $(GENERATED_PROJECT)

# HELP ########################################################################

.PHONY: help
help:
	@ grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

