# SPDX-FileCopyrightText: 2023 Michael Søegaard <https://soegaard.ai>
# SPDX-License-Identifier: MIT

!/usr/bin/bash

echo "Enter project name"
read project
# echo "Enter python version"
# read python
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/pyproject.toml -o ./pyproject.toml
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/.gitignore -o ./.gitignore
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/.pre-commit-config.yaml -o ./.pre-commit-config.yaml
curl https://raw.githubusercontent.com/MichaelSoegaard/bash_setup/master/mypy.ini -o mypy.ini
apt-get update < "/dev/null"
apt-get install curl -y < "/dev/null"
curl -sSL https://install.python-poetry.org | python3 -
# echo 'PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
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
