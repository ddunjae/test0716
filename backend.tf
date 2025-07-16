terraform {
  backend "azurerm" {
    resource_group_name  = "test-0717-rg" //Storage 계정이 위치한 리소스 그룹 이름
    storage_account_name = "testconorstorage0717" //Storage 계정 이름
    container_name       = "tfstate"  //Storage 계정 내의 컨테이너 이름
    key                  = "prod.terraform.tfstate"
    //key :  Terraform에서 Azure Storage를 백엔드에 저장할 상태파일 이름과 경로
  }
}