# 1.1.0

- rely on poetry v1.0.0 :)
- remove unused tooling dependencies
- remove test sniffer
- remove python 2 support

# 1.0.3

- add paramater use_coveragespace to use or not coveragespace
- fix some python version tag generation

# 1.0.2 (2019-11-28)

- change upload target for publish
- fix travis python version definition
- change root folder for project slug
- change default github_repo with project slug

# 1.0.1 (2019-11-19)

- change root folder for project name
- adding 'requirements.txt' target (waiting poetry 1.0.0)

# 1.0.0 (2019-09-04)

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


