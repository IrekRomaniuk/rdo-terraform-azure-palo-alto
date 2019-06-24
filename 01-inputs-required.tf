variable "rg_name" {
  description                                       = "Resource group ID"
}

variable "vnet_name" {
  description                                       = "VNET Name"
}

variable "vnet_rg" {
  description                                       = "Resource group name that contains the vnet"
}

variable "subnet_management_id" {
  description                                       = "Subnet to add the management nic to"
}

variable "subnet_transit_private_id" {
  description                                       = "Subnet to add the transit private nic to"
}

variable "subnet_transit_public_id" {
  description                                       = "Subnet to add the transit public nic to"
}

variable "vm_name_prefix" {
  description                                       = "Prefix to name the VMs with"
}

variable "vm_username" {
  description                                       = "Username to provision the VM with"
}

variable "vm_password" {
  description                                       = "Password to provision the VM with"
}

variable "environment" {
  description                                       = "Environment like sbox / nonprod and prod"
}