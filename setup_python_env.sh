# SPDX-FileCopyrightText: 2023 Michael Søegaard <https://soegaard.ai>
# SPDX-License-Identifier: MIT

# Script to setup a new python project with following componenets:
# - Folders for app, tests and license
# - setup Poetry for enviroment handling
# - setup pre-commit hooks
# - setup MIT licenses
# Adding pyproject.toml, .gitignore, pre-commit-config.yaml and mypy.ini
#####################################################################
# BEFORE RUNNING THIS SCRIPT PLEASE INITIALIZE GIT WITH $ git init
# ALSO RUN chmod +x setup_python_env.sh
# to change permissions for this script.

!/usr/bin/bash

echo "Enter project name"
read project
apt-get update < "/dev/null"
apt-get install curl -y < "/dev/null"
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/pyproject.toml -o ./pyproject.toml
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/.gitignore -o ./.gitignore
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/.pre-commit-config.yaml -o ./.pre-commit-config.yaml
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/mypy.ini -o mypy.ini
curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.poetry/bin:$PATH"
mkdir $project
mkdir tests
mkdir LICENSES
echo "LICENSES/MIT.txt" > LICENSES/MIT.txt
touch $project/__init__.py
touch tests/__init__.py
touch Readme.md
poetry --version
poetry install
pre-commit install

#newline
