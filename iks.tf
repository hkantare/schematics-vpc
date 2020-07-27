resource "ibm_container_vpc_cluster" "cloud-pairing" {
  name                            = var.customer-name
  flavor                          = "cx2.4x8"
  vpc_id                          = ibm_is_vpc.cloud-pairing.id
  disable_public_service_endpoint = false
  kube_version                    = "1.18"
  wait_till                       = "MasterNodeReady"
  resource_group_id               = data.ibm_resource_group.group.id

  zones {
    subnet_id = ibm_is_subnet.cloud-pairing[0].id
    name      = "${var.ibm-region}-1"
  }

  zones {
    subnet_id = ibm_is_subnet.cloud-pairing[1].id
    name      = "${var.ibm-region}-2"
  }

  zones {
    subnet_id = ibm_is_subnet.cloud-pairing[2].id
    name      = "${var.ibm-region}-3"
  }
}
