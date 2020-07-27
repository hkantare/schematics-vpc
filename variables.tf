variable "ibm-region" {
  default = "eu-gb"
  type    = string
}

variable "customer-name" {
  default = "air-lassi"
  type    = string
}

variable "resource_group" {
  default = "pairing-saas"
  type    = string
}

data ibm_resource_group "group" {
  name = "default"
}
