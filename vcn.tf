data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment_id
  ad_number      = 1
}

resource "oci_core_vcn" "vcn1" {
  cidr_block     = var.cidr_block
  compartment_id = var.compartment_id
  display_name   = "UnixM"
  dns_label      = "Unixdns"
}

resource "oci_core_subnet" "regional_subnet" {
  cidr_block        = var.subnet_cidr_block
  display_name      = var.subnet_display_name
  dns_label         = var.subnet_dns_name
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.vcn1.id
  route_table_id  = oci_core_route_table.Centos_route_table.id
  security_list_ids = [oci_core_security_list.sl.id]
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

resource "oci_core_security_list" "sl" {
compartment_id = var.compartment_id
vcn_id = oci_core_vcn.vcn1.id
display_name = "sl"

egress_security_rules{
destination = "0.0.0.0/0"
protocol = "6"
}

dynamic "ingress_security_rules"{
for_each = var.service_ports
content{
protocol = "6"
source = "0.0.0.0/0"
  tcp_options {
       max = ingress_security_rules.value
       min = ingress_security_rules.value
   }
 }
}

ingress_security_rules {
protocol = "6"
source = "12.0.0.0/16"
  }
}
