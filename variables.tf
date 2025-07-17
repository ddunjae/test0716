//Resource Group
variable "resource_group_name" {
    type = string
    default = "test-0717-rg"
}
variable "location" {
    type = string
    default = "koreacentral"
}
//VNET
variable "vnet1" {
  type = string
  default = "test-vnet-0717"
}
variable "vnet1_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
//SNET
variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {
    "test-subnet-1" = { address_prefixes = ["10.0.1.0/24"] }
    "test-subnet-2" = { address_prefixes = ["10.0.2.0/24"] }
    "test-subnet-3" = { address_prefixes = ["10.0.3.0/24"] }
  }
}


//NSG
variable "linux_nsg_name" {
  type = string
  default = "test-nsg-0717"
}
//NSG-Rule
variable "linux_nsg_rule" {
  type = string
  default = "value"
}
//Nic
variable "linux_nic_name" {
  type = string
  default = "test-vm-linux-0717"
}
//linux-vm
variable "linux_vm_name" {
  type = string
  default = "test-vm-linux-0717"
}
variable "linux_vm_size" {
  type = string
  default = "Standard_B1s"
}
variable "linux_vm_username" {
  type = string
  default = "azureuser"
}
variable "linux_vm_password" {
  type = string
  default = "Qwer1234!@#"
  sensitive = true
}

//windows-nsg
variable "windows_nsg_name" {
  type = string
  default = "test-windows-nsg-0717"
}
//Windows nic
variable "windows_nic_name" {
  type = string
  default = "test-vm-windows-nic-0717"
}

//windows -vm
variable "windows_vm_name" {
  type = string
  default = "twindows-0717"
}
variable "windows_vm_size" {
  type = string
  default = "Standard_B1s"
}
variable "windows_vm_username" {
  type = string
  default = "azureuser"
}
variable "windows_vm_password" {
  type = string
  default = "Qwer1234!@#"
  sensitive = true
}

//WEb App
variable "app_service_plan_name" {
  type = string
  default = "plan07170conor"
}

variable "app_service_plan_tier" {
  type    = string
  default = "Basic"
}

variable "app_service_plan_size" {
  type    = string
  default = "B1"
}

variable "app_service_name" {
  type = string
  default = "appseraicea0717"
}
variable "app_service_name2" {
  type = string
  default = "appseraicea0717"
}
variable "docker_image" {
  type        = string
  default = "nginx:latest"
  description = "Docker 이미지 (예: nginx:latest)"
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

//Storage Account
variable "stoage_account_name" {
  type    = string
  default = "testconorstorage0717"  
}
variable "stoage_account_tier" {
  type = string
  default = "Standard"
}
variable "stoage_account_replication_type" {
  type = string
  default = "LRS"
}
variable "container_name" {
  type    = string
  default = "tfstate"
}

//mssql-vm-nic
variable "mssql_vm_nic" {
  type = string
  default = "test-mssql-vm-nic-0717"
}

//mssql-vm-nsg
variable "mssql_vm_nsg_name" {
  type = string
  default = "test-mssql-vm-nsg-0717"
}
variable "mssql_vm_name" {
  default = "vm-mssql"
}
variable "mssql_vm_size" {
  default = "Standard_D2s_v3"
}
variable "mssql_vm_username" {
  default = "azureuser"
}
variable "mssql_vm_password" {
  default   = "Qwer1234!@#"
  sensitive = true
}
variable "mssql_os_disk_type" {
  default = "Standard_LRS"
}



//mysql-flexible-server
variable "mysql_flexible_server_name" {
  type = string
  default = "mysqloflex0conor0717"
}
variable "mysql_flexible_server_admin_username" {
  type = string
  default = "mysqladmin"
}
variable "mysql_flexible_server_admin_password" {
  type      = string
  default = "Qwer1234!@#"
  sensitive = true
}
variable "mysql_flexible_server_sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"  # ← 이처럼 접두사(GP_) 포함해야 함
}
variable "mysql_flexible_server_version" {
  type = string
  default = "8.0"
}
variable "mysql_flexible_server_zone" {
  type = string
  default = "1"
}
variable "mysql_flexible_server_storage_gb" {
  type = number
  default = 32
}
variable "mysql_flexible_server_backup_retention_days" {
  type = number
  default = 7
}
variable "mysql_flexible_server_ha_enabled" {
  type = bool
  default = false
}
