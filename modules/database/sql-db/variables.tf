variable "name" {
  description = "SQL Database 이름"
  type        = string
}

variable "server_id" {
  description = "연결할 SQL Server의 ID"
  type        = string
}

variable "sku_name" {
  description = "SKU 이름 (예: Basic, S0, GP_Gen5_2)"
  type        = string
  default     = "Basic"
}

variable "collation" {
  description = "문자셋 정렬 방식"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "max_size_gb" {
  description = "최대 DB 크기 (GB)"
  type        = number
  default     = 2
}

variable "zone_redundant" {
  description = "Zone Redundant 여부"
  type        = bool
  default     = false
}

variable "read_scale" {
  description = "읽기 확장 사용 여부"
  type        = bool
  default     = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
