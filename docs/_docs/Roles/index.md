---
layout: default
title: Roles
has_children: true
toc: true
---

## Roles
Roles are a level of abstraction on top of tasks and playbooks that let you structure your Ansible configuration in a modular and reusable format. As you add more and more functionality and flexibility to your playbooks, they can become unwieldy and difficult to maintain. Roles allow you to break down a complex playbook into separate, smaller chunks that can be coordinated by a central entry point.

For example, many workspaces might benefit from a good Data Science python environment so for reuse purposes we put it in a role. 