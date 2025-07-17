variable "name" {
  description = "MySQL Flexible Server 이름"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "sku_name" {
  description = "SKU 이름 (예: Standard_B1ms)"
  type        = string
  default     = "Standard_B1ms"
}

variable "zone" {
  description = "가용성 존"
  type        = string
  default     = null
}

variable "storage_gb" {
  description = "스토리지 크기 (GB)"
  type        = number
  default     = 20
}

variable "backup_retention_days" {
  description = "백업 보존 일수"
  type        = number
  default     = 7
}

variable "ha_enabled" {
  description = "고가용성 여부"
  type        = bool
  default     = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
