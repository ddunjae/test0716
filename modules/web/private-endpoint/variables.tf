variable "name" {
  description = "Private Endpoint 리소스 이름"
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
  description = "Private Endpoint가 배치될 Subnet ID"
  type        = string
}

variable "appservice_id" {
  description = "Private Endpoint로 연결할 App Service ID"
  type        = string
}

variable "vnet_id" {
  description = "DNS Zone을 연결할 VNet ID"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
