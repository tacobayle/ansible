
data "template_file" "values" {
  template = file("templates/values.yml.template")
  vars = {
    avi_version = var.avi.controller.version
    controllerPrivateIp = cidrhost(var.nsx.config.segments_overlay[0].cidr, var.nsx.config.segments_overlay[0].avi_controller)
    avi_old_password =  jsonencode(var.avi_old_password)
    avi_password = jsonencode(var.avi_password)
    avi_username = jsonencode(var.avi_username)
    ntp = var.ntp.server
    dns = var.dns.nameserver
    nsx_password = var.nsx_password
    nsx_server = var.vcenter.dvs.portgroup.management.nsx_ip
    domain = var.dns.domain
    transport_zone_name = var.avi.config.transport_zone_name
    network_management = jsonencode(var.avi.config.network_management)
    networks_data = jsonencode(var.avi.config.networks_data)
    networks_backend = jsonencode(var.avi.config.networks_backend)
    sso_domain = var.vcenter.sso.domain_name
    vcenter_password = var.vcenter_password
    vcenter_ip = var.vcenter.dvs.portgroup.management.vcenter_ip
    content_library = var.avi.config.content_library_avi
    segments_overlay = jsonencode(var.nsx.config.segments_overlay)
  }
}

resource "null_resource" "ansible_avi" {

  provisioner "local-exec" {
    command = "cat > values.yml <<EOT\n${data.template_file.values.rendered}\nEOT"
  }

  provisioner "local-exec" {
    command = "ansible-playbook local.yml --extra-vars @values.yml"
  }
}
