/*
vault version
vault server -dev
export VAULT_ADDR="http://127.0.0.1:8200"  >>>>>> linux or MAC
set VAULT_ADDR="http://127.0.0.1:8200"  >>>>>> windows CMD
vault login <root token>
vault kv put /secret/app phone_number=867-5309
*/

provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = "hvs.aGyvpSsW6jRSfPKfkxMQhr5H"
}
data "vault_generic_secret" "phone_number" {
  path = "secret/app"
}

output "phone_number" {
  value     = data.vault_generic_secret.phone_number
  sensitive = "true"
}

data "vault_generic_secret" "db_password" {
  path = "secret/db_creds"
}

output "DB_secrets" {
  value     = data.vault_generic_secret.db_password.data_json
  sensitive = "true"
}
