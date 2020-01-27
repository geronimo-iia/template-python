# Geronimo-iia's Python Template

This is a [cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a typical Python library following modern packaging conventions.

It utilizes popular libraries to fully automate all development and deployment tasks.

About this project:
* It's a fork from [Jace's Python Template](https://github.com/jacebrowning/template-python).
* Sphink related configuration came from [](https://medium.com/georgian-impact-blog/python-tooling-makes-a-project-tick-181d567eea44)
* It's a [pep-0518](https://www.python.org/dev/peps/pep-0518/) started, after a lot of reading about Python...



## Features

* Preconfigured setup for:
  * [Travis CI](https://travis-ci.org/),
  * [Coveralls](https://coveralls.io/) (optional),
  * [Scrutinizer](https://scrutinizer-ci.com/) (optional)
* [pep-0518](https://www.python.org/dev/peps/pep-0518/) alias `pyproject.toml` for managing dependencies, package metadata, ...
* [precommit](https://pre-commit.com/) for managing and maintaining multi-language pre-commit hooks.
* `Makefile` for automating common development tasks
* [poetry](https://python-poetry.org/) to rules them all
* Formatting with [isort]() and [black]()
* Analysing with [flake8]()
* Type checking with `mypy`
* Docstring styling with `pydocstyle`
* Running tests with `pytest`
* Documentation:
      - Building documentation with `sphinx`
      - Auto generation of API reference
      - Expose with Github Page project under 'docs' folder


## Usage

Install `cookiecutter` and generate a project:

```
$ pip install cookiecutter
$ cookiecutter gh:geronimo-iia/template-python -f
```

Cookiecutter will ask you for some basic info (your name, project name, python package name, etc.) and generate a base Python project for you.

Target list:

- install: install dependencies
- test: launch test
- check: check with flake & co
- docs: generate doc site
- build: build distribution
- publish: publish version on pypy


## Story

Initially, I have forcked [Jace's Python Template](https://github.com/jacebrowning/template-python) in order to:
- add autodocumentation, because mkdoc did not give us this feature
- make improvement about makefile target, etc...
- target on python framework
- learn of course ! At this time, I wasn't go deep on PEP things. And all I wanted to do was "using poetry".
- use flake8 rather than pylint
- remove most of dependencies in order to have a simple starting point for a project

About makefile, main change are on 'install' target, in order to have an "auto install on change", like this:

```bash
install: .install .cache ## Install project dependencies

.install: poetry.lock
	poetry install
	poetry check
	poetry run pre-commit install -f --install-hooks
	@touch $@

poetry.lock: pyproject.toml
	poetry lock

.cache:  # .cache is a unique folder to put all temp generated stuff
	@mkdir -p .cache

```

After that, i take a look on mkdoc, and pydoc-markdown.
Even it's working, I'm not satisfact with my solution, because pydoc-markdown is not totally up-to-date,
and autodoc need yet a lot of configuration. So not totally 'auto'.

Now, I give a try of the most used documentation framework Sphinx, and try to have the most simple configuration.
You could retreive all sphinx source under 'sphinx' folder.

Since 20 years, I continue to learn... and I wish to be able to continue for the next 20 years :)

Things in mind:

- obtain a KISS template
- removing Scrutinizer and Coveralls
- take an alternative of mypi
- introduce tox (so usefull for testing agains multiple environement)
