## Automated Iaas and Build Process

This project is for practicing terraform, aws, gcp, docker, k8s and Jenkins.

### Architechture


### Things to note:

1. As we are using ingress cidr blocks as the respective IP it will change on connecting to the different network which will results in failure of ssh connection

2. Owner and Team tags needs to be passed inorder to create an EC2 instance because of permission issues