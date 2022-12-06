---
layout: default
title: VS Code
parent: Playbooks
has_children: false
---

# Playbook Visual Studio Code server

## Summary
Installs Visual Studio Code server behind JupyterHUB for multi user support. 

## Depends on
-   NGINX plugin

## Requires
-   Linux x86-64 server.

## Description
Installing VS-Code if fairly straightforward, installing it with multi user support without root privileges is quite tricky. We abandoned the idea to create our own nginx reverse proxy with user authentication with TOTP. This involved adjusting TOTP login, spawning daemons for every new user, route trafick accordingly and create login sessions.

Instead we now use JupyterHUB as an multi user agent to spawn all user services because it allready does all of this out of the box with TOTP login.

## Variables
n/a