#!/bin/bash

# Add here any commands to run when the container starts

# Used to start the container if there are no scripts to run prodigy with 
tail -f /dev/null

# Example script to test if prodigy is working
# wget https://raw.githubusercontent.com/explosion/prodigy-recipes/master/example-datasets/news_headlines.jsonl
# python -m prodigy ner.manual ner_news_headlines blank:en news_headlines.jsonl --label "COMPANY, PERSON"