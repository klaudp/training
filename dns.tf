variable "dnsimple_token" {
  default = "klau.tf.dns"
}

variable "dnsimple_account" {
  default = "klau"
}

variable "dnsimple_domain" {
  default = "klau.tf"
}

# Configure the DNSimple provider
provider "dnsimple" {
  token   = "${var.dnsimple_token}"
  account = "${var.dnsimple_account}"
}

# Create a record
resource "dnsimple_record" "foobar" {
  domain = "${var.dnsimple_domain}"
  name   = "web${count.index+1}"

  # value  = "${aws_instance.web.*.public_ip}"
  type = "A"
  ttl  = 3600

  # Alternatively
  value = "${element(aws_instance.web.*.public_ip, count.index)}"
}
