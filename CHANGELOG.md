# Change log


## 2.0.3
 - remove coveragespace dependency
 - fix coverage data file location
 - fix publish makefile target
 - fix nojekyll file name with docs generation

## 2.0.2

- fix coverage and coveragespace configuration
- fix isort [configuration](https://github.com/psf/black/issues/333) with iblack
- fix .nojekill missing issue after updating doc
- clear docs folder before building

## 2.0.1

- fix publish target to obtain current project version

## 2.0.0

- rely on poetry v1.0.2
  
- remove unused tooling dependencies
- remove python 2 support
- remove graphviz for uml generated diagram
  
- group all file configuration per project into setup.cfg until they support pyproject.toml
- isort configuration rely on pyproject.toml
- add extra flake8 plugin
- fix cookiecutter test and disable coveragespace per default
- add precommit hook on install target
- tag git reposioty when publishing
- add more check on 'doctor' testing target
- rewrite makefile in a more simple way
- add requirements.txt export

- use sphinx for documentation
- all markdown doc are on root folder

- add .cookiecutter.yaml to save context of template generation
- change fake boolean configuration for int 1/0 ...
- add "year" configuration property

- switch to travis-ci.com

- change bin folder to tools
  
## 1.0.3

- add paramater use_coveragespace to use or not coveragespace
- fix some python version tag generation

## 1.0.2 (2019-11-28)

- change upload target for publish
- fix travis python version definition
- change root folder for project slug
- change default github_repo with project slug

## 1.0.1 (2019-11-19)

- change root folder for project name
- adding 'requirements.txt' target (waiting poetry 1.0.0)

## 1.0.0 (2019-09-04)

- rewrote template from async-btree experience:
  - use flake8
  - simplify makefile
  - remove use of .venv folder with poetry
  - remove need of checksum by using makefile rules
  - add pydocmd and mkdocs
  - documentation compatible with github page
  - lighter code sample (less to remove for final user)
  - add max_code_line_length parameter
  - remove python2 support
- extends ci with generation of docs
