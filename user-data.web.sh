#!/bin/bash
set -e

# Update Ubuntu and install Ansible
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y ansible

# Create the Ansible playbook
cat > /root/config-and-deploy.web.yml <<'EOF'
---
- name: Configure and deploy website
  hosts: localhost
  connection: local
  become: true

  tasks:
    - name: Install Nginx, Git and rsync
      ansible.builtin.apt:
        name:
          - nginx
          - git
          - rsync
        state: present
        update_cache: yes

    - name: Start and enable Nginx
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: yes

    - name: Clone website from GitHub
      ansible.builtin.git:
        repo: https://github.com/nenemustafa/Hellome.git
        dest: /tmp/Hellome
        version: HEAD

    - name: Deploy website to Nginx
      ansible.builtin.copy:
        src: /tmp/Hellome/heyme
        dest: /var/www/html/index.html
        remote_src: yes
        mode: '0644'
EOF

# Run Ansible automatically
ansible-playbook /root/config-and-deploy.web.yml
