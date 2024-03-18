# Get the latest ubuntu image from the GCP
data "google_compute_image" "latest_image" {
    family  = "ubuntu-2004-lts"
    project = "ubuntu-os-cloud"
}