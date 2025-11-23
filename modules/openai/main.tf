resource "azurerm_cognitive_account" "openai" {
  name                = "cog-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "OpenAI"
  sku_name            = var.sku_name
  custom_subdomain_name        = "openai-${var.project_name}"
  public_network_access_enabled = false
}

#private endpoint 응답 오류 문제로 지금은 주석처리, 추후 적용시 바로 윗줄 코드 false로 바꾸고 아래 주석 해제
#오류 원인은 지역/sku에서 private endpoint 미지원 이슈 혹은 cognitive account 생성 직후 private endpoint 생성 시도 문제로 추정


resource "azurerm_private_endpoint" "openai_pe" {
  name                = "pe-openai-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id  # Private endpoint subnet


  private_service_connection {
    name                           = "psc-openai-${var.project_name}"
    private_connection_resource_id = azurerm_cognitive_account.openai.id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "pdz-openai"
    private_dns_zone_ids = [var.openai_private_dns_zone_id]
  }

  depends_on = [ azurerm_cognitive_account.openai ]  # private endpoint는 cognitive account 생성 후에 생성되어야 함
}

