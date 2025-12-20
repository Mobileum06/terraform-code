variable "sql_database" {
    description = "A map of SQL database configurations"
    type = map(object({
        name                = string
        collation          = string
        license_type       = string
        max_size_gb       = number
        sku_name          = string
        enclave_type      = string
        rg_name           = string
        sql_server_name  = string
       
    }))
  
}


  
