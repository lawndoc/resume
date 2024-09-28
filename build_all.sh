#!/bin/bash

if [ "$GITHUB_ACTION" = true ]; then
    git config --global user.name "GitHub Actions [bot]"
    git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
    git config --global --add safe.directory '*'
fi
make -f Makefile_DevSecOps
make -f Makefile_CyberSec