resource "oci_core_instance" "CentosMachine" {
availability_domain = data.oci_identity_availability_domain.ad.name
compartment_id = var.compartment_id
shape = var.shape
display_name = var.instance_display_name_id

source_details {
#Required
source_id = "ocid1.image.oc1.us-sanjose-1.aaaaaaaahpitk7yc2u7tnujas2lgh2c6wnazujerfmfn4zol22grj3oaayna"
source_type = "image"
}

create_vnic_details{
subnet_id = oci_core_subnet.regional_subnet.id
 }

metadata = {
ssh_authorized_keys = file("/home/keys/eitan.pub")
}

}
