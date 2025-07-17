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

//windows -vm
variable "windows_vm_name" {
  type = string
  default = "test-vm-windows-0717"
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