variable "firewall_name" {
    description = "The name of firewall"
    type        = string
    default     = "core"
}

variable "vpc_name" {
    description = "The name of the VPC"
    type        = string
}

variable "allow_http_firewall_target_tags" {
    description = "The target tags for the HTTP firewall rule"
    type        = list(string)
}

variable "allow_ssh_firewall_target_tags" {
    description = "The target tags for the SSH firewall rule"
    type        = list(string)
}