variable "sql_servers" {
    description = "A map of SQL server configurations"
    type = map(object({
        name                         = string
        resource_group_name          = string
        location                     = string
        version                      = string
        administrator_login          = string
        administrator_login_password = string
    }))
  
}