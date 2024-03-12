terraform {
    required_providers {
        google = {
        source  = "hashicorp/google"
        version = "3.81.0"
        }
    }
}

provider "google" {
    credentials = file(var.credentials_file)
    project     = var.project
    region      = var.region
}
