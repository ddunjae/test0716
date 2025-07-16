variable "name" {
  description = "SQL Server 이름"
  type        = string
}

variable "resource_group_name" {
  description = "리소스 그룹"
  type        = string
}

variable "location" {
  description = "리전"
  type        = string
}

variable "version" {
  description = "SQL Server 버전"
  type        = string
  default     = "12.0"
}

variable "admin_login" {
  description = "관리자 계정명"
  type        = string
}

variable "admin_password" {
  description = "관리자 비밀번호"
  type        = string
  sensitive   = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
