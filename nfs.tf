resource "ibm_is_volume" "cloud-pairing" {
  name           = var.customer-name
  profile        = "general-purpose"
  zone           = "${var.ibm-region}-1"
  resource_group = data.ibm_resource_group.group.id
}
