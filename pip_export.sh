#!/bin/bash

pip freeze > /home/pwk/scripts/$(echo "$CONDA_DEFAULT_ENV").txt
echo "Exported $(cat /home/pwk/scripts/$(echo "$CONDA_DEFAULT_ENV").txt | wc -l) package names to .txt file"
