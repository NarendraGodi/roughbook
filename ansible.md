
# Ansible

## How to check if all the servers handled by Ansible are up or not?
```bash
ansible -i hosts all -a uptime
```

## Ansible Inventory File
```bash
docker ansible_host=xx.xx.0.21 ansible_user=godi ansible_ssh_pass=godi ansible_become=yes ansible_become_method=sudo ansible_become_pass=godi
kubernete ansible_host=xx.xx.0.19 ansible_user=godi ansible_ssh_pass=godi ansible_become=yes ansible_become_method=sudo ansible_become_pass=godi
```

## Pull an Image from Docker Hub
```bash
- name: Docker Pull
  hosts: docker
  remote_user: godi
  become: yes
  vars:
    ansible_python_interpreter: /usr/bin/python
  tasks:
  - name: Pull image from Docker Hub
    docker_image:
      name: narendragodi/pod_hostname
      source: pull
```
