output "bucket_name" {
  value = yandex_storage_bucket.tfstate.bucket
}

output "ydb_endpoint" {
  value = yandex_ydb_database_serverless.lock_db.ydb_full_endpoint
}

output "ydb_table_name" {
  value = yandex_ydb_table.lock_table.path
}
output "ydb_document_api_endpoint" {
  value = yandex_ydb_database_serverless.lock_db.document_api_endpoint
}
