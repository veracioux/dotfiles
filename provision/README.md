# Provision

Vagrant + Ansible playground for testing development laptop provisioning before applying to actual hardware.

Arch Linux VM with ~1/2 host resources (4 cores, 12GB RAM) to validate provisioning playbooks.

## Usage

```bash
vagrant up          # Create and provision VM
vagrant destroy -f  # Destroy VM
```

## Files

- `Vagrantfile` - VM configuration
- `playbook.yml` - Ansible playbook
- `inventory` - Ansible inventory
- `ansible/` - Ansible project structure
