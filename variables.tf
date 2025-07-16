//Resource Group
variable "resource_group_name" {
    type = string
    default = "test-0717-rg"
}
variable "location" {
    type = string
    default = "koreacentral"
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