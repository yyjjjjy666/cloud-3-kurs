provider "google" {
  credentials = "${file("var.credentials")}"
  project = "${var.project}"
  region = "${var.region}"
  zone = "${var.zone}"
}

resource "resgroup" "virtualmachine" {
  name = "${var.rgname}"
  machine-type= "${var.mtype}"

  boot disc {
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

