# Example of Terraform + Ansible deployment to AWS
### What this setup does
* Creates a security group with ingress rules for 22/80/443 ports
* Pops up two t2.micro instances and adds them to SG
* Creates an inventory file for Ansible using Terraform output
* Ansible:
  * Updates both instances
  * Installs Docker on `front`
  * Launches `nginx:alpine` container with config mapped
  * Launches `jenkins` container

### Prereqs
Python  
Ansible  
Terraform  

Configured AWS account with uploaded ssh-key deployed automatically.  
* Change `key_name = "ayb_nb"` in `test.tf` to yours.

### Usage
 `./deploy.sh`

### Todo
[ ] Make Jenkins config mapped to the container  
[ ] Make Jenkins Slave node autoconfigured in Jenkins config