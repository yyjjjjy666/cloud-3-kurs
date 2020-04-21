provider "google" {
  credentials = "${file("${var.credentials}")}"
  project = "${var.project}"
  region = "${var.region}"
  zone = "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
  name = "${var.rgname}"
  machine_type = "${var.mtype}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "${google_compute_network.vpc_network.self_link}"
    access_config = {
    }
  }
}
resource "google_compute_network" "vpc_network" {
  name = "${var.nname}"
  auto_create_subnetworks = "true"
}

