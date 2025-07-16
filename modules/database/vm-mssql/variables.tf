variable "name" {
  description = "VM 이름"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "nic_id" {
  description = "NIC ID"
  type        = string
}

variable "os_disk_type" {
  type    = string
  default = "Standard_LRS"
}

variable "image" {
  description = "SQL Server 이미지 정보"
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
