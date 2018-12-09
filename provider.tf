variable "do_token" { }
variable "pub_key" { }
variable "pvt_key" { }
variable "ssh_fingerprint" { 
                     default = "69:f6:aa:f6:a2:94:58:f2:41:b0:fb:69:09:e6:87:dd"
}
provider "digitalocean" {
  token = "${var.do_token}"
}
