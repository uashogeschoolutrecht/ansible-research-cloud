# ansible Provisioning on SURF Research Cloud
This repository contains Ansible configuration scripts that are used to set up and configure a virtual machine running on [SURF ResearchCloud](https://portal.live.surfresearchcloud.nl). Every user of SURF Research Cloud is able to create Catalog items from this repository and should point there plugins to the playbooks in the /playbooks folder. 

## Playbooks
Playbooks are used to provision host machines and install/configure a specific workspace. The playbooks under playbooks/ run against the localhost and should be designed to combine the different roles in the /playbooks/roles folder and should not contain any tasks, therefore encouraging the reusability of roles. Some playbooks need access to sensitive values that cannot be stored in plain text, they should be injected into the VM and picked up by your playbook. 

## Documentation
The documentation of every specific playbook is documented [here](https://uashogeschoolutrecht.github.io/ansible-research-cloud/). 
