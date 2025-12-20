module "resource_group" {
source = "../../Module/resource_group"
resource_groups = var.resource_groups    
  
}

module "storage_account" {
  source = "../../Module/Storage_account"
  storage_accounts = var.storage_accounts
  depends_on = [ module.resource_group ]
}

module "networking" {
  source = "../../Module/Networking"
  virtual_networks = var.virtual_networks
  depends_on = [ module.resource_group ]
}
module "public_ips" {
source = "../../Module/public_ip"
public_ips = var.public_ips
depends_on = [ module.resource_group, module.networking]  
}
module "nic_card" {
source = "../../Module/NIC_Card"
network_interfaces = var.network_interfaces
depends_on = [ module.resource_group, module.networking, module.public_ips ]
} 

module "nsg_association" {
source = "../../Module/NSG_Association"
network_security_groups = var.network_security_groups
depends_on = [ module.resource_group, module.networking, module.nic_card ]  
}

module "nsg_nic_association" {
source = "../../Module/NIC_NGG_Association"
vm_nsg_associations = var.vm_nsg_associations
depends_on = [ module.resource_group, module.networking, module.nic_card, module.nsg_association]  
}
module "key_vault" {
source = "../../Module/Key_vault" 
kvs = var.kvs
depends_on = [ module.resource_group ]
}

module "vm" {
source = "../../Module/compute"
vms = var.vms
depends_on = [ module.resource_group, module.networking, module.nic_card, module.nsg_association, module.nsg_nic_association ] 
  
}

module "sql_server" {
 source = "../../Module/Sql_server"
 sql_servers = var.sql_servers
  depends_on = [ module.resource_group ] 
}
module "sql_database" {
 source = "../../Module/sql_data_base"
 sql_database = var.sql_database
  depends_on = [ module.resource_group, module.sql_server ] 
}