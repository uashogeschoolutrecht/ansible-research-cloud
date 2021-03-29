#!/bin/bash
set -e

jupyter nbextension enable --user create_assignment/main
jupyter nbextension enable --user formgrader/main --section=tree

CONFIG_PATH=~/nbgrader_config.py

printf 'c = get_config()\n' > $CONFIG_PATH
printf "c.CourseDirectory.course_id = \"$HOSTNAME\"\n"  >> $CONFIG_PATH
printf 'c.ClearSolutions.code_stub = {\n' >> $CONFIG_PATH
printf '\t\"R\": \"# your code here\\nfail() # No Answer - remove if you provide an answer\",\n' >> $CONFIG_PATH
printf '\t\"python\": \"# your code here\\nraise NotImplementedError # No Answer - remove if you provide an answer\"\n' >> $CONFIG_PATH
printf '}\n' >> $CONFIG_PATH

echo "nbgrader is now enabled. Please stop your notebook server and start it again."
