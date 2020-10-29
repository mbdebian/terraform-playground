# Idorg - Networking infrastructure
# Author: Manuel Bernal Llinares <mbdebian@gmail.com>

resource "google_compute_network" "vpc_idorg_prod" {
    name = "vpc_idorg_production"
}
