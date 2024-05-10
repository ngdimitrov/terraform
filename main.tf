terraform {
  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "2.0.0"
    }
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
