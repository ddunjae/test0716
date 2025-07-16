variable "name" {
  description = "파일 공유 이름"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account 이름"
  type        = string
}

variable "quota" {
  description = "최대 크기(GB)"
  type        = number
  default     = 100
}

variable "enabled_protocol" {
  description = "활성화할 프로토콜 (SMB 또는 NFS)"
  type        = string
  default     = "SMB"
}

variable "metadata" {
  description = "파일 공유에 설정할 메타데이터"
  type        = map(string)
  default     = {}
}
