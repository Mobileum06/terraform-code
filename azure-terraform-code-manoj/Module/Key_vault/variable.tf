variable "kvs" {
    description = "A map of Key Vault configurations"
    type = map(object({
        kv_name                = string
        location            = string
        resource_group_name = string
        sku_name            = string
        enabled_for_disk_encryption = bool
        soft_delete_retention_days = number
        purge_protection_enabled = bool
        
       
    }))
}