terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "conor0test007170test"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate" // Terraform에서 Azure Storage를 백엔드에 저장할 상태파일 이름과 경로
  }
}