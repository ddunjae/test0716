variable "name" {
  description = "NIC 이름"
  type        = string
}

variable "location" {
  description = "리전"
  type        = string
}

variable "resource_group_name" {
  description = "리소스 그룹"
  type        = string
}

variable "subnet_id" {
  description = "NIC이 연결될 서브넷 ID"
  type        = string
}

variable "private_ip_allocation" {
  description = "Private IP 할당 방식 (Dynamic | Static)"
  type        = string
  default     = "Dynamic"
}

variable "private_ip_address" {
  description = "Static IP 사용 시 설정할 주소"
  type        = string
  default     = null
}

variable "public_ip_id" {
  description = "Public IP 리소스 ID (옵션)"
  type        = string
  default     = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
