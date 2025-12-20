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
      address_prefixes   = list(string)  
     
    }))
  }))
  }