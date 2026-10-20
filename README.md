# AWS DevOps Level 3 — Terraform & Ansible

## Project Overview

This project demonstrates automated AWS infrastructure provisioning,
server configuration, and website deployment using DevOps tools.

The project was developed as part of my AWS DevOps Level 3 training.

## Technologies Used

- AWS EC2 — Cloud infrastructure
- Terraform — Infrastructure as Code (IaC)
- Ansible — Configuration management
- Ubuntu 24.04 — Linux operating system
- Nginx — Web server
- Git & GitHub — Version control
- Bash — Startup automation

## Project Architecture

GitHub Website Repository
        |
        v
Terraform provisions AWS EC2
        |
        v
Ubuntu EC2 instance starts
        |
        v
User Data installs Ansible
        |
        v
Ansible installs Nginx and Git
        |
        v
Ansible clones website from GitHub
        |
        v
Website deployed to Nginx

## Project Files

| File | Description |
|------|-------------|
| main.tf | Terraform AWS infrastructure |
| user-data.web.sh | EC2 startup automation |
| config-and-deploy.web.yml | Ansible deployment playbook |
| .gitignore | Excludes sensitive and generated files |
| .terraform.lock.hcl | Terraform provider dependency lock file |

## Deployment

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Create a deployment plan:

```bash
terraform plan -out=tfplan
```

Deploy the infrastructure:

```bash
terraform apply "tfplan"
```

## Verification

The website was successfully deployed using Terraform and Ansible.

Ansible execution results:

```text
ok=5
changed=3
unreachable=0
failed=0
```

The website was verified using curl.

## Cleanup

Remove Terraform-managed infrastructure when no longer needed:

```bash
terraform destroy
```

## Security

- SSH access is restricted to an authorized IP address.
- SSH private keys are excluded from Git.
- Terraform state files are excluded from Git.
- AWS credentials are not stored in the repository.

## Learning Outcomes

Through this project, I practiced:

- Infrastructure as Code using Terraform
- Provisioning AWS EC2 instances
- Linux server configuration
- Configuration management using Ansible
- Automated application deployment
- Git and GitHub version control
- Infrastructure testing and troubleshooting

## Author

Musdaf Omar


