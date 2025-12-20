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