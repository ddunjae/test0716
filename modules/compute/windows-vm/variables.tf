variable "name" {
  description = "VM 이름"
  type        = string
}

variable "location" {
  description = "지역"
  type        = string
}

variable "resource_group_name" {
  description = "리소스 그룹 이름"
  type        = string
}

variable "vm_size" {
  description = "VM SKU"
  type        = string
  default     = "Standard_B2s"
}

variable "network_interface_ids" {
  description = "NIC ID 목록"
  type        = list(string)
}

variable "admin_username" {
  description = "Windows VM 관리자 계정"
  type        = string
}

variable "admin_password" {
  description = "Windows VM 관리자 패스워드"
  type        = string
  sensitive   = true
}

variable "os_disk_type" {
  description = "OS 디스크 SKU"
  type        = string
  default     = "Standard_LRS"
}

variable "timezone" {
  description = "Windows 타임존 (예: 'Korea Standard Time')"
  type        = string
  default     = "Korea Standard Time"
}

variable "image" {
  description = "이미지 참조 정보"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}
