variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "vm_size" {
  default = "Standard_D2s_v3"
}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
variable "nic_id" {}
variable "os_disk_type" {
  default = "Standard_LRS"
}
variable "image" {
  type = object({
    offer   = string
    sku     = string
    version = string
  })
}
variable "tags" {
  type    = map(string)
  default = {}
}
