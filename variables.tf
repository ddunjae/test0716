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
variable "web_app_name" {
  type = string
  default = "test0web0app00717"
}
variable "web_app_plan_name" {
  type = string
  default = "test0web0app0plan00717"
}
variable "sku_tier" {
  type    = string
  default = "Basic"
}

variable "sku_size" {
  type    = string
  default = "B1"
}
variable "docker_image" {
  description = "Docker 이미지 (예: nginx:latest)"
  type        = string
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "app_service_plan_name" {
  type = string
  default = "tes0pp0vice00717"
}
variable "app_service_name" {
  type = string
  default = "tes0pwebapp0717"
}

variable "storage_account_name" {
  type    = string
  default = "testconorstorage0717"
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type    = string
  default = "LRS"
}

variable "container_name" {
  type    = string
  default = "tfstate"
}
