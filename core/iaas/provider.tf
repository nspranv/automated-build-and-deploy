terraform {
    required_providers {
        google = {
        source  = "hashicorp/google"
        version = "3.81.0"
        }
    }
}

# Configure the Google Cloud provider
provider "google" {
    region      = var.region
    project     = var.project
}
