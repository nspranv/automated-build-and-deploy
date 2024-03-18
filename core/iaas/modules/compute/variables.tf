variable "instance_name" {
  description = "The name of instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance"
  type        = string
}

variable "instance_image" {
  description = "The image of the instance"
  type        = string
}

variable "zone"{
    description = "The zone in which instance will be deployed"
    type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "instance_tags" {
  description = "The tags for the instance"
  type        = list(string)
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "is_enable_external_ip" {
  description = "Whether to enable external IP for the instance"
  type        = bool
}

variable "user_data_file_path" {
  description = "The path to the user data file"
  type        = string
  default = ""
}

variable "owner" {
  description = "The owner of the instance"
  type        = string
}

variable "public_key_path" {
  description = "The path to the public key"
  type        = string
}