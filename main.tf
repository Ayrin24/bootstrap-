terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.15.0"
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = var.sa_key_file
}

# Bucket для хранения terraform.tfstate
resource "yandex_storage_bucket" "tfstate" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
}

# Serverless YDB для statelocking
resource "yandex_ydb_database_serverless" "lock_db" {
  name = var.ydb_name
}

# Таблица блокировок (совместима с DynamoDB API)
resource "yandex_ydb_table" "lock_table" {
  path              = var.ydb_table_name
  connection_string = yandex_ydb_database_serverless.lock_db.ydb_full_endpoint

  column {
    name     = "LockID"
    type     = "Utf8"
    not_null = true
  }

  primary_key = ["LockID"]
}
