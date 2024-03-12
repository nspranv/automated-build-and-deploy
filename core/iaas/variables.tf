variable "region" {
  description = "The region in which the resources will be deployed"
  type        = string
  default     = "us-west-2"
}

variable "project" {
  description = "The GCP project in which the resources will be deployed"
  type        = string
  default     = "my-dc-setup"
}

variable "credentials_file" {
  description = "The path to the GCP credentials file"
  type        = string
#   TODO: Update the default value to the path of your GCP credentials file
  default     = "path/to/credentials.json"
}
