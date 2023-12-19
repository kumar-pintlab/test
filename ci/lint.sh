#!/bin/bash -e
#
# Runs flake8 linting
#
# This script is intended for CI and developers to check that
# linting standards are upheld.
#
# Usage:
#     $ ./ci/lint.sh             # flake8 check
#     $ ./ci/lint.sh docstring   # flake8 and docstring check
echo "Using flake8 version $(flake8 --version)"
flake8 secedgar --count --show-source --statistics

if [[ "$1" -eq "docstring" ]]; then
    echo "Running docstring style check"
    # Ignore tests directory
    pydocstyle secedgar/ --convention=google --count --add-ignore=D100,D104,D105,D107 --match-dir='[^\.][^tests].*'
fi