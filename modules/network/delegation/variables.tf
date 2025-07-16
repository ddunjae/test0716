variable "name" {
  description = "Delegation 리소스 이름"
  type        = string
}

variable "subnet_id" {
  description = "대상 Subnet의 ID"
  type        = string
}

variable "service_name" {
  description = "위임할 서비스 이름 (예: Microsoft.DBforMySQL/flexibleServers)"
  type        = string
}

variable "actions" {
  description = "위임에 허용할 액션 목록"
  type        = list(string)
}
