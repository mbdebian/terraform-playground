# Idorg - Networking infrastructure
# Author: Manuel Bernal Llinares <mbdebian@gmail.com>

resource "google_compute_network" "vpc_network" {
    name = "eu"
    auto_create_subnetworks = true
}