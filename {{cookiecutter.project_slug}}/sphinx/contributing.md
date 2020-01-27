# Contributing

This project is based on [Geronimo-iaa's Python Template](https://github.com/geronimo-iia/template-python).
This is a cookiecutter template for a typical Python library following modern packaging conventions. 
It utilizes popular libraries to fully automate all development and deployment tasks.


## Setup

### Requirements

You will need:

* Python {{cookiecutter.python_major_version}}.{{cookiecutter.python_minor_version}}"+
* [Pyenv](https://github.com/pyenv/pyenv#installation)
* [poetry](https://python-poetry.org/)
* Make with find, sed



* Make:
    * macOS: `$ xcode-select --install`
    * Linux: [https://www.gnu.org/software/make](https://www.gnu.org/software/make)
    * Windows: [https://mingw.org/download/installer](https://mingw.org/download/installer)

* Pyenv: [https://github.com/pyenv/pyenv#installation](https://github.com/pyenv/pyenv#installation)

  Pyenv will manage all our python version.

* Python: `$ pyenv install {{cookiecutter.python_major_version}}.{{cookiecutter.python_minor_version}}`

  Note for [MacOS 10.14 user](https://github.com/pyenv/pyenv/issues/544):
  ```bash
    SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk MACOSX_DEPLOYMENT_TARGET=10.14 pyenv install 3.7.3
  ```

* Poetry: [https://poetry.eustace.io/docs/#installation](https://poetry.eustace.io/docs/#installation)

  Poetry will manage our dependencies and create our virtual environment for us.

To confirm these system dependencies are configured correctly:

```bash
$ make doctor
```

### Installation

Install project dependencies into a virtual environment:

```bash
$ make install
```

Note:
- this target create a dummy file ```.install```. The makefile rule depends on pyproject.toml and
poetry.lock file
- if for whatever reason, you have to force installation, just remove this ```.install``` file and
execute a ```make install```


## Development Tasks

### Manual

Run the tests:

```bash
$ make test
```

Run static analysis:

```bash
$ make check
```

Build the documentation:

```bash
$ make docs
```

Build the package:

```bash
$ make build
```

For help:

```bash
$ make help
```

### Integration With Visual Studio Code

Even if we use fabulous tool like pyenv, poetry, ... at the end, we just want to go on, and code.

So here, few detail of my installation.

- .bashrc
    ```bash
    # init pyenv with default python version
    if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    fi

    # add poetry in path
    export PATH="$HOME/.poetry/bin:$PATH"

    # Add Visual Studio Code (code)
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    ```

- poetry configuration: all is let with default

- How Launch Visual Studio Code within virtual environment created by poetry ?
    After do a ```make install```, you have to do:
    ```bash
    poetry shell
    code .
    ```
    ```poetry shell``` will activate project virtual environment.

## Continuous Integration

The CI server will report overall build status:

```text
$ make ci
```

## Release Tasks

Release to PyPI:

```text
$ make publish
```
