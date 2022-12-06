---
layout: default
title: Dataiku DSS
parent: Playbooks
has_children: false
---

# Playbook Dataiku Data Science Studio (DSS)

## Summary

Installs the Dataiku DSS on a server behind a NGINX proxy with standard login. The playbook also checks if there is attached storage and moves its DATA_DIR accordingly. 


## Depends on
-   NGINX plugin on research cloud.

## Requires
-   Linux x86-64 server.
-   A minimum of 16 GB of RAM is required. More RAM will be required if you intend to load large datasets in memory (for example in the Jupyter notebook component), or for accomodating more users.
-   The hard limit on the maximum number of open files for the Unix user account running DSS should be at least 65536 (ulimit -Hn). For very large DSS instances, larger values may be required.

## Description
Installs Dataiku DSS Server as described in the [documentation](https://doc.dataiku.com/dss/latest/installation/custom/initial-install.html?highlight=linux&_gl=1*9grll9*_ga*MTQwOTEyNjY5Mi4xNjY3ODE3NDg4*_ga_B3YXRYMY48*MTY3MDMxODE5Ny41LjAuMTY3MDMxODIwMC41Ny4wLjA.).

## Variables
n/a