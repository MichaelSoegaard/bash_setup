# SPDX-FileCopyrightText: 2023 Michael Søegaard <https://soegaard.ai>
# SPDX-License-Identifier: MIT

!/usr/bin/bash

echo "Enter project name"
read project
echo "Enter python version"
read python
curl https://github.com/MichaelSoegaard/bash_setup/blob/master/pyproject.toml
curl https://github.com/MichaelSoegaard/bash_setup/blob/master/.gitignore
curl https://github.com/MichaelSoegaard/bash_setup/blob/master/.pre-commit-config.yaml
curl https://github.com/MichaelSoegaard/bash_setup/blob/master/mypy.ini
apt-get update
apt-get install curl -y
curl -sSL https://install.python-poetry.org | python3 -
mkdir $project
mkdir tests
mkdir LICENSES
echo "LICENSES/MIT.txt" > LICENSE/MIT.txt
touch $project/__init__.py
touch tests/__init__.py
touch Readme.md
poetry install
pre-commit install
poetry pre-commit autoupdate
