data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment_id
  ad_number      = 1
}

resource "oci_core_vcn" "vcn1" {
  cidr_block     = var.cidr_block
  compartment_id = var.compartment_id
  display_name   = "CentosM"
  dns_label      = "Centosdns"
}

resource "oci_core_subnet" "regional_subnet" {
  cidr_block        = var.subnet_cidr_block
  display_name      = var.subnet_display_name
  dns_label         = var.subnet_dns_name
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.vcn1.id
  route_table_id  = oci_core_route_table.Centos_route_table.id
}

resource "oci_core_internet_gateway" "internet_gateway" {
 compartment_id = var.compartment_id
 display_name = "igw"
 vcn_id = oci_core_vcn.vcn1.id
}

resource "oci_core_route_table" "Centos_route_table"{
 compartment_id = var.compartment_id
 vcn_id = oci_core_vcn.vcn1.id
 display_name = "rt"
 route_rules {
 network_entity_id = oci_core_internet_gateway.internet_gateway.id
 destination = "0.0.0.0/0"
  }
}
