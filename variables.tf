data "oci_identity_availability_domain" "adraul"{
 compartment_id = var.compartment_id
 ad_number = 1
}

variable shape {
 default = "VM.Standard.E2.2"
}

variable cidr_block {
 default = "12.0.0.0/16"
}

variable compartment_id {
 default = "myoci_compartment"
}


variable instance_display_name_id {
 default = "LinuxOS"
}

variable vcn_display_name_id {
 default = "dnsKSQ"
}

variable subnet_cidr_block {
 default = "12.0.0.0/24"
}

variable subnet_display_name {
 default = "subKSQ"
}

variable subnet_dns_name {
 default = "dnsubKSQ"
}

variable image {

default = "ocid1.image.oc1.us-sanjose-1.aaaaaaaact3ovmljern74ankjeb57iervxvlpcvqiqoahtkkswb7h4sfkcuq"
}

variable "service_ports"{
 default = [80,443,22]
}

variable "private_key_path" {
default = "/home/keys/eitan.pem"
}
