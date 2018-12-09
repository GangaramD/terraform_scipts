resource "digitalocean_droplet" "web" {
    image = "ubuntu-16-04-x64"
    name = "nexus"
    region = "blr1"
    size = "s-2vcpu-4gb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]

connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }

provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install python
      "sudo apt-get update",
      "sudo apt-get -y install python"
       # install tomcat
#      # "sudo apt-get update",
#      # "sudo apt-get -y install apache2"
#    ]
#  }
}
output "droplet_ip_address" {
  value = "${digitalocean_droplet.web.ipv4_address}"
}

