resource "digitalocean_droplet" "web" {
    image = "ubuntu-16-04-x64"
    name = "nexus"
    region = "blr1"
    size = "s-2vcpu-4gb"
    private_networking = true
    ssh_keys = [
      "69:f6:aa:f6:a2:94:58:f2:41:b0:fb:69:09:e6:87:dd"
    ]

connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }

#provisioner "remote-exec" {
#    inline = [
#      "export PATH=$PATH:/usr/bin",
#      # install nginx
#      "sudo apt-get update",
#      "sudo apt-get -y install nginx"
#      # install tomcat
#      # "sudo apt-get update",
#      # "sudo apt-get -y install apache2"
#    ]
#  }
}
output "droplet_ip_address" {
  value = "${digitalocean_droplet.web.ipv4_address}"
}

