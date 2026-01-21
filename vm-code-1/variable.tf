variable "resource_group_name" {
  type = string
  default = "myTFResourceGroup"
}

variable "location" {
  type = string   
  default = "West Europe"
}

variable "vm_name" {
  type = map(object({
    name = string
    nic_name = string
    ip_address = string
  }))

  default = {
    key1 = {
    name = "dev"
    nic_name = "dev-nic"
    ip_address = "dev-ip"
    }
    key2 = {
    name = "test"
    nic_name = "test-nic"
    ip_address = "test-ip"
    }
   
  }
}
