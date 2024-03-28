terraform {
  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "2.0.0"
    }
  }
}

provider "lxd" {
  # Configuration options
}

resource "lxd_network" "internal" {
  name = "internal"

  config = {
    "ipv4.address" = "10.206.7.1/24"
  }
}

resource "lxd_instance" "nginx" {
  name             = "nginx"
  image            = "ubuntu:22.04"
  wait_for_network = "true"
}

  device {
    name = "http"
    type = "nginx"
    properties = {
      listen = "tcp:0.0.0.0:80"      
      connect = "tcp:10.206.7.64:80"
    }
  }
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
