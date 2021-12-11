resource "oci_core_instance" "Machine" {
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
ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
#ssh_authorized_keys = file("/home/keys/eitan.pub")
}
}

data "oci_core_vnic_attachments" "VNIC1_attach"{
compartment_id = var.compartment_id
instance_id = oci_core_instance.Machine.id
}

data "oci_core_vnic" "VNIC1"{
vnic_id = data.oci_core_vnic_attachments.VNIC1_attach.vnic_attachments.0.vnic_id
}

output "LinuxServer"{
 value = [data.oci_core_vnic.VNIC1.public_ip_address]
}

output "generated_ssh_private_key"{
value = tls_private_key.public_private_key_pair.private_key_pem
sensitive = true
}
