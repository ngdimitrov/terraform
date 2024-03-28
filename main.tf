terraform {
  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "2.0.0"
    }
  }
}

provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true

  remote {
    name     = "lxd-server-1"
    scheme   = "https"
    address  = "192.168.3.112"
    password = "nik!"
    port     = "8443"
    default  = true
  }

}

resource "lxd_instance" "nginx" {
  name             = "nginx"
  image            = "ubuntu:22.04"
  wait_for_network = "true"
}

resource "lxd_instance" "wiki" {
  name             = "wiki"
  image            = "ubuntu:22.04"
  wait_for_network = "true"
}

resource "lxd_instance" "wiki2" {
  name             = "wiki2"
  image            = "ubuntu:22.04"
  wait_for_network = "true"
}

resource "lxd_instance" "db" {
  name             = "db"
  image            = "ubuntu:22.04"
  wait_for_network = "true"
}

resource "lxd_instance" "github" {
  name             = "github"
  image            = "ubuntu:22.04"
  wait_for_network = "true"
}
