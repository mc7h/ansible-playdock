# ansible-playdock

A playground to in which to learn and practice Ansible safely.


## Pre-requisites

* Ansible
* Ansible Collections
* Docker
* sshpass
* Optional: Ansible Lint


## Usage

Playbooks are run against a local Docker container, so you don't need to worry about breaking anything on your host machine or remote servers.

Run `make` to get started:

```
❯ make
Usage: make <command>
  help
  docker-build
  docker-serve
  galaxy
  lint
  run
  clean
```

Typically, you will want to run the following commands in this order: `make docker-build`, `make docker-serve`, `make galaxy`, and finally `make run` to execute the playbooks.



> [!NOTE]  
> If you hit issues with `make galaxy` try to install the `ansible.utils` collection with the Ansible Galaxy CLI: `ansible-galaxy collection install ansible.utils`.

