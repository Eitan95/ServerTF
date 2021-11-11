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
 default = "ocid1.compartment.oc1..aaaaaaaazrsru2d6smxolkfwvtym5rslplrhvr3jrbartiaqcleyutr73msa"
}


variable instance_display_name_id {
 default = "CentOS"
}

variable vcn_display_name_id {
 default = "dnsCentos"
}

variable subnet_cidr_block {
 default = "12.0.0.0/24"
}

variable subnet_display_name {
 default = "subCentos"
}

variable subnet_dns_name {
 default = "dnsubCentos"
}

variable image {
default = "ocid1.image.oc1.us-sanjose-1.aaaaaaaahpitk7yc2u7tnujas2lgh2c6wnazujerfmfn4zol22grj3oaayna"
}
