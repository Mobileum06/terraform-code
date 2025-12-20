variable "resource_groups" {
  description = "A map of resource group names to create"
  type = map(object({
    name       = string
    location   = string
    tags       = map(string)
    managed_by = optional(string)
  }))

  
}

variable "storage_accounts" {
  description = "A map of storage account names to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
  }

  variable "virtual_networks" {
  description = "A map of virtual network names to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
    subnets = map(object({
      name             = string
      address_prefixes  = list(string)
      
    }))
  }))
  
}

variable "public_ips" {
    description = "A map of public IP names to create"
    type = map(object({
        name                = string
        resource_group_name = string
        location            = string
        allocation_method   = string
        tags                = map(string)
    }))  
}

variable "network_interfaces" {
    description = "A map of network interface configurations"
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        subnet_id           = string
        private_ip_address_allocation = string
        public_ip  = string
    }))  
}

variable "network_security_groups" {
  description = "A map of network security group configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string   
      access                     = string
      protocol                   = string
      source_port_range          = string   
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
  
}

variable "vm_nsg_associations" {
    type=map(object({
        nic_name = string
        rg_name = string
        nsg_name = string
    }))
 
}

variable "kvs" {}
variable "vms" {} 
variable "sql_servers" {}
variable "sql_database" {}