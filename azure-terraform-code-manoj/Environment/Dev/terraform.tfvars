resource_groups = {
  "rg1" = {

   name = "rgs-vm1"
   location = "centralIndia"
   tags = {
     environment = "dev"
     project     = "project1" 
  }
  managed_by = "terraform"
}
}

storage_accounts = {
  "stg1" = {
    name                     = "stgvm1dev"
    resource_group_name      = "rgs-vm1"
    location                 = "centralIndia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      project     = "project1" 
    }
  }
}

virtual_networks = {
  "vnet1" = {
    name                = "vnet-vm1-dev"
    location            = "centralIndia"
    resource_group_name = "rgs-vm1"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      project     = "project1" 
    }
    subnets = {
      "subnet1" = {
        name           = "subnet-vm1-dev"
        address_prefixes = ["10.0.1.0/24"]
      },

    subnet2 = {
        name           = "subnet-vm2-dev"
        address_prefixes = ["10.0.2.0/24"]  
    } }}} 

public_ips = {
    "pip1" = {
        name                = "pip-vm1-dev"
        resource_group_name = "rgs-vm1"
        location            = "centralIndia"
        allocation_method   = "Static"
        tags = {
          environment = "dev"
          project     = "project1" 
        }
    }
    "pip2" = {
        name                = "pip-vm2-dev"
        resource_group_name = "rgs-vm1"
        location            = "centralIndia"
        allocation_method   = "Static"
        
tags = {
          environment = "dev"
          project     = "project1" 
        }
    }  }

network_interfaces = {
    "nic1" = {
        name                = "nic-vm1-dev"
        location            = "centralIndia"
        resource_group_name = "rgs-vm1"
        subnet_id           = "/subscriptions/6e06e212-633e-4e8c-8ab0-7ea51400a2e2/resourceGroups/rgs-vm1/providers/Microsoft.Network/virtualNetworks/vnet-vm1-dev/subnets/subnet-vm1-dev"
        private_ip_address_allocation = "Dynamic"
        public_ip = "pip-vm1-dev"
    }
    "nic2" = {
        name                = "nic-vm2-dev"
        location            = "centralIndia"
        resource_group_name = "rgs-vm1"
        subnet_id           = "/subscriptions/6e06e212-633e-4e8c-8ab0-7ea51400a2e2/resourceGroups/rgs-vm1/providers/Microsoft.Network/virtualNetworks/vnet-vm1-dev/subnets/subnet-vm2-dev"
        private_ip_address_allocation = "Dynamic"
        public_ip  = "pip-vm2-dev"
            }  }

network_security_groups = {
  "nsg1" = {
    name                = "nsg-vm1-dev"
    location            = "centralIndia"
    resource_group_name = "rgs-vm1"    
    security_rules = {
      "rule1" = {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                  = "Inbound"   
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      
    }
  }
  "nsg2" = {
    name                = "nsg-vm2-dev"
    location            = "centralIndia"
    resource_group_name = "rgs-vm1"    
    security_rules = {
      "rule1" = {
        name                       = "Allow-RDP"
        priority                   = 100
        direction                  = "Inbound"   
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      
    }
  }
}

vm_nsg_associations = {
  "forntend_association" = {
      nic_name = "nic-vm1-dev"
      nsg_name = "nsg-vm1-dev"
      rg_name  = "rgs-vm1"
    
  }
  "backend_association" = {
      nic_name = "nic-vm2-dev"
      nsg_name = "nsg-vm2-dev"
      rg_name  = "rgs-vm1"
    
  }
}

kvs = {
  "kv1" = {
  kv_name                        = "kv-vm1-dev-01"
  location                    = "centralIndia"
  resource_group_name         = "rgs-vm1"
  enabled_for_disk_encryption = "true"
  sku_name                    = "standard"
  soft_delete_retention_days  = "7"
  purge_protection_enabled    = "false"
   
    
  }
}

vms = {
    "vm1" = {
        name                  = "Frontend-vm1-dev"
        location              = "centralIndia"
        resource_group_name   = "rgs-vm1"
    
        size               = "Standard_D2s_v3"
        admin_username        = "adminuser"
        admin_password        = "P@ssword1234"
        disabled_password_authentication = false
        nic_name = "nic-vm1-dev"
        os_disk = {
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
        }
        source_image_reference = {
            publisher = "Canonical"
            offer     = "0001-com-ubuntu-server-jammy"
            sku       = "22_04-lts"
            version   = "latest"
        }
    }
    "vm2" = {
        name                  = "Backend-vm2-dev"
        location              = "centralIndia"
        resource_group_name   = "rgs-vm1"
        
        size               = "Standard_D2s_v3"
        admin_username        = "adminuser"
        admin_password        = "P@ssword1234"
        disabled_password_authentication = false
        nic_name = "nic-vm2-dev"
        os_disk = {
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
        }
        source_image_reference = {
            publisher = "Canonical"
            offer     = "0001-com-ubuntu-server-jammy"
            sku       = "22_04-lts"
            version   = "latest"
        }
    }     
}
sql_servers = {
    "sql1" = {
        name                         = "sqlserver-vm1-dev"
        resource_group_name          = "rgs-vm1"
        location                     = "centralIndia"
        version                      = "12.0"
        administrator_login          = "sqladminuser"
        administrator_login_password = "SqlP@ssword1234"
    }
}
sql_database = {
    "sqldb1" = {
        name                = "datahscsape"
        collation         = "SQL_Latin1_General_CP1_CI_AS"
        max_size_gb      =  2
        sku_name         = "Basic"
        license_type    = "BasePrice"
        enclave_type    = "VBS"
        rg_name          = "rgs-vm1"
        sql_server_name = "sqlserver-vm1-dev"
        
    }
}