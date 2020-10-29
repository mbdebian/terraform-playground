# Idorg - Networking infrastructure
# Author: Manuel Bernal Llinares <mbdebian@gmail.com>

resource "google_compute_network" "vpc_idorg_prod" {
  name                    = "vpc_idorg_production"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "eu_deployment" {
  name          = "eu-production-subnet"
  ip_cidr_range = "10.1.0.0/16"
  region        = "eu-west4"
  network       = google_compute_network.vpc_idorg_prod.id
}

resource "google_compute_subnetwork" "americas_deployment" {
  name          = "americas-production-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_idorg_prod.id
}

resource "google_compute_subnetwork" "asia_deployment" {
  name          = "asia-production-subnet"
  ip_cidr_range = "10.8.0.0/16"
  region        = "asia-east2"
  network       = google_compute_network.vpc_idorg_prod.id
}
