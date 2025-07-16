variable "name" {
  description = "Private Endpoint 이름"
  type        = string
}

variable "location" {
  description = "리소스 위치"
  type        = string
}

variable "resource_group_name" {
  description = "Private Endpoint가 속한 리소스 그룹"
  type        = string
}

variable "subnet_id" {
  description = "Private Endpoint가 연결될 Subnet의 ID"
  type        = string
}

variable "target_resource_id" {
  description = "Private Endpoint가 연결할 대상 PaaS 리소스의 ID"
  type        = string
}

variable "subresource_names" {
  description = "대상 리소스 내에서 연결할 서브 리소스 (예: 'blob', 'sqlServer')"
  type        = list(string)
}

variable "is_manual_connection" {
  description = "수동 승인 여부 (보통 false)"
  type        = bool
  default     = false
}

variable "nic_name" {
  description = "생성될 Private Endpoint NIC 이름"
  type        = string
  default     = null
}

variable "tags" {
  description = "태그"
  type        = map(string)
  default     = {}
}
