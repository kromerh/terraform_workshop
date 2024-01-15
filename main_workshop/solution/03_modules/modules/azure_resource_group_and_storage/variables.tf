variable "resource_group_name" {
  type        = string
  description = "Name der Resource Group"
}

variable "location" {
  type        = string
  description = "Azure Region für die Ressourcen"
}

variable "storage_account_name" {
  type        = string
  description = "Name des Storage Accounts"
}

variable "storage_account_tier" {
  type        = string
  description = "Leistungsstufe des Storage Accounts"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Replikationstyp des Storage Accounts"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags für die Ressourcen"
}
