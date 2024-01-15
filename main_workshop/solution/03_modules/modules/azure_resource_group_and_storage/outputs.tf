output "resource_group" {
  value = azurerm_resource_group.this
}

output "storage_account" {
  value     = azurerm_storage_account.this
  sensitive = true
}
