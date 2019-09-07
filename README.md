# Geronimo-iia's Python Template

This is a [cookiecutter](https://github.com/cookiecutter/cookiecutter) template for a typical Python library following modern packaging conventions. It utilizes popular libraries alongside Make and Graphviz to fully automate all development and deployment tasks.

This project is forked from [Jace's Python Template](https://github.com/jacebrowning/template-python).

## Features

* Preconfigured setup for [Travis CI](https://travis-ci.org/), [Coveralls](https://coveralls.io/), and [Scrutinizer](https://scrutinizer-ci.com/)
* `pyproject.toml` for managing dependencies and package metadata
* `Makefile` for automating common [development tasks](https://github.com/geronimo-iia/template-python/blob/master/%7B%7Bcookiecutter.project_name%7D%7D/mkdocs/docs/contributing.md):
    - Installing dependencies with `poetry`
    - Automatic formatting with `isort` and `black`
    - Static analysis with `flake8`
    - Type checking with `mypy`
    - Docstring styling with `pydocstyle`
    - Running tests with `pytest`
    - Documentation:
      - Building documentation with `mkdocs`
      - Generate API documentation with `pydocmd`
      - Expose with Github Page project under 'docs' folder
    - Publishing to PyPI using `poetry`
    

## Usage

Install `cookiecutter` and generate a project:

```
$ pip install cookiecutter
$ cookiecutter gh:geronimo-iia/template-python -f
```

Cookiecutter will ask you for some basic info (your name, project name, python package name, etc.) and generate a base Python project for you.
