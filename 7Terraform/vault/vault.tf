/*
# for Mac and Linux , please follow the below steps
1- Validate you have Vault installed by running:
vault version
2- In your terminal, run vault server -dev to start a Vault dev server. This will launch Vault in a
pre-configured state so we can easily use it for this lab. Note that you should never run Vault in a
production deployment by starting it this way.
3- Open a second terminal, and set the VAULT_ADDR environment variable. By default, this is set to
HTTPS, but since we’re using a dev server, TLS is not supported.
export VAULT_ADDR="http://127.0.0.1:8200"
4- Now, log in to Vault using the root token from the output of our Vault dev server,
but your root token and unseal key will be different.
5- Log in to Vault using the following command:
vault login <root token>
6- Now that we are logged into Vault, we can quickly add our sensitive values to be stored in Vault’s KV store, Use the following command to write the sensitive value to Vault:
vault kv put /secret/app phone_number=867-5309
7-Back in Terraform, let’s add the code to use Vault to retrieve our secrets. Create a new directory called terraform_vault and add a main.tf file. In your main.tf file, add the following code:
provider "vault" {
address = "http://127.0.0.1:8200"
token = <root token>
}
8- Now, add the following data block, which will use the Vault provider and token to retrieve the sensitive
values we need:
data "vault_generic_secret" "phone_number" {
path = "secret/app"
}
9- Finally, let’s add a new output block that uses the data retrieved from Vault. In your main.tf, add the
following code:
output "phone_number" {
value = data.vault_generic_secret.phone_number
}

# for windows use the same above steps, but set the environmental values using "set" instead of "export" , so the setps will be as:
from powersell terminal:
vault version
setx Path "path to valut binaries"
vault server -dev
set VAULT_ADDR="http://127.0.0.1:8200"
vault login <root token>
vault kv put /secret/app phone_number=867-5309

*/

# # Check Version 
# vault --Version
# 
# vault server -dev 
# 	-> you will get Env vault path 
# 	-> Use Token
# 		- Unseal Key: 0NgYw4ZtS6UBcZGdasM3IcOwW+AkDDzFyimlGM0hTjU=
# 		- Root Token: hvs.Z9Do9LtsXmMEHyeyl0dwGgdf


provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = "hvs.Z9Do9LtsXmMEHyeyl0dwGgdf"
}
data "vault_generic_secret" "phonebook" {
  path = "secret/phonebook"
}
data "vault_generic_secret" "db" {
  path = "secret/db"
}
output "phonebook_data" {
  value = data.vault_generic_secret.phonebook.data
  sensitive = true
}
output "db_data" {
  value = data.vault_generic_secret.db.data
  sensitive = true
}