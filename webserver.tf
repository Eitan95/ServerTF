resource "null_resource" "webserver" {
depends_on = [oci_core_instance.Machine]
provisioner "remote-exec"{
     connection {
 	type = "ssh"
	user = "opc"
	host = data.oci_core_vnic.VNIC1.public_ip_address
	private_key = tls_private_key.public_private_key_pair.private_key_pem
#"${file(var.private_key_path)}"
	script_path = "/home/opc/myssh.sh"
	agent = false
	timeout = "1m"
	}
 inline = ["echo '== 1. Installing HTTPD package with yum' ",
	  "sudo -u root yum -y -q install httpd",

    "echo '== 2. Disabling firewall and starting HTTPD service'",
    "sudo -u root service firewalld stop",
    "sudo -u root service httpd start"]
}
}
