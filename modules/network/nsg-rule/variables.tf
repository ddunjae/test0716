variable "resource_group_name" {
  description = "NSG가 존재하는 리소스 그룹"
  type        = string
}

variable "nsg_name" {
  description = "룰을 추가할 대상 NSG 이름"
  type        = string
}

variable "rules" {
  description = "생성할 NSG 룰 목록 (map 형태)"
  type = map(object({
    priority                   = number
    direction                  = string   # "Inbound" or "Outbound"
    access                     = string   # "Allow" or "Deny"
    protocol                   = string   # "Tcp", "Udp", "*"
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
