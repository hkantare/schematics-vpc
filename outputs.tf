output "volume_name" {
  value     = ibm_is_volume.cloud-pairing.name
  sensitive = true
}

output "volume_id" {
  value     = ibm_is_volume.cloud-pairing.id
  sensitive = true
}

output "ibm_region" {
  value = var.ibm-region
}
