# Main Infrastructure file
# Author: Manuel Bernal Llinares <mbdebian@gmail.com>

provider "google" {
  project = "identifiers-org-2019"
  region  = "europe-west4"
  zone    = "europe-west4-c"
}