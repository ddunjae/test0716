#App Service는 **웹 앱(PaaS)**를 빠르게 배포할 수 있는 서비스로, App Service Plan과 함께 구성된 모듈

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
  reserved = true  # Linux 전용
}

