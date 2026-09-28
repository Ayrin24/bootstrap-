variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "sa_key_file" {
  type    = string
  default = "/home/mulen/key.json"
}

variable "bucket_name" {
  type    = string
  default = "tfstate-bucket-mulenko"
}

variable "ydb_name" {
  type    = string
  default = "state-lock-db"
}

variable "ydb_table_name" {
  type    = string
  default = "state-lock-table"
}
