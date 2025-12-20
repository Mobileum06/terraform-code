variable "vms" {
    description = "A map of virtual machine names to create"
    type = map(object({
    name               =    string
    location           =    string  
    resource_group_name=    string
    size =                  string 
    admin_username   =      string
    admin_password  =       string
    nic_name        =       string
    
    os_disk = object({
        caching              = string
        storage_account_type = string
    })
    source_image_reference = object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
    })

  
}))
}