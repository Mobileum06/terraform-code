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