"""Hook post generation."""
import os
import shutil


def remove(filepath):
    """Remove file/folder."""
    if os.path.isfile(filepath):
        os.remove(filepath)
    elif os.path.isdir(filepath):
        shutil.rmtree(filepath)


create_scrutinizer = '{{cookiecutter.use_scrutinizer}}' == 1


if not create_scrutinizer:
    remove(os.path.join(os.getcwd(), '.scrutinizer.yml'))
