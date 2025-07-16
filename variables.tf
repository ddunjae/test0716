//Resource Group
variable "resource_group_name" {
    type = string
    default = "test-0717-rg"
}
variable "location" {
    type = string
    default = "koreacentral"
}
//Virtual Network
variable "vnet_name" {
    type = string
    default = "test-conor-vnet"
}
variable "vnet_address_space" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}
//Subnet
variable "subnets" {
    type = map(object({
        address_prefixes = list(string)
    }))
    default = {
      "test-snet-1" = {
        address_prefixes = ["10.0.1.0/24"]
      }
    }
}

//SA
//Storage Account
variable "stoage_account_name" {
  type    = string
  default = "test0conor0st00717"  
}
variable "container_name" {
  type    = string
  default = "tfstate"
}