resource "ibm_is_vpc" "cloud-pairing" {
  name           = var.customer-name
  resource_group = data.ibm_resource_group.group.id
}

resource "ibm_is_public_gateway" "cloud-pairing" {
  count = 3

  name           = "${var.customer-name}-${count.index + 1}"
  vpc            = ibm_is_vpc.cloud-pairing.id
  zone           = "${var.ibm-region}-${count.index + 1}"
  resource_group = data.ibm_resource_group.group.id
}

resource "ibm_is_subnet" "cloud-pairing" {
  count = 3

  name                     = "${var.customer-name}-${count.index + 1}"
  vpc                      = ibm_is_vpc.cloud-pairing.id
  zone                     = "${var.ibm-region}-${count.index + 1}"
  total_ipv4_address_count = "256"
  public_gateway           = ibm_is_public_gateway.cloud-pairing[count.index].id
  resource_group           = data.ibm_resource_group.group.id
}

resource "ibm_is_security_group_rule" "worker-node-inbound" {
  group     = ibm_is_vpc.cloud-pairing.default_security_group
  direction = "inbound"
  
  tcp {
    port_min = 30000
    port_max = 32767
  }
}
