variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "plan_name" {
  type = string
}

variable "sku_tier" {
  type    = string
  default = "Basic"
}

variable "sku_size" {
  type    = string
  default = "B1"
}


