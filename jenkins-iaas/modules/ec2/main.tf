variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instance"
    type        = string
}

variable "instance_type" {
    description = "The type of EC2 instance to launch"
    type        = string
}

variable "tag_name" {
    description = "The name of the EC2 instance"
    type        = string
}

variable "owner" {
    description = "The owner of the EC2 instance"
    type        = string
}

variable "team" {
    description = "The team responsible for the EC2 instance"
    type        = string
}

variable "public_key" {
    description = "The public key to use for SSH access"
    type        = string
}

variable "subnet_id" {
    description = "The ID of the subnet in which to launch the EC2 instance"
    type        = string
}

variable "security_group_ids" {
    description = "The IDs of the security groups to associate with the EC2 instance"
    type        = list(string)
}

variable "enable_public_ip_address" {
    description = "Whether to associate a public IP address with the EC2 instance"
    type        = bool
}

variable "user_data" {
    description = "The user data to provide when launching the EC2 instance"
    type        = string
}



resource "aws_instance" "jenkins_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name  = var.tag_name
    Owner = var.owner
    Team  = var.team
  }
  key_name                    = "jenkins_proj_public_key"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.enable_public_ip_address

  user_data = var.user_data

  metadata_options {
    http_endpoint = "enabled" 
    http_tokens   = "required"
  }
}

resource "aws_key_pair" "jenkins_proj_public_key" {
  key_name   = "jenkins_proj_public_key"
  public_key = var.public_key
}


output "jenkins_instance_id" {
  value = aws_instance.jenkins_ec2.id
}
