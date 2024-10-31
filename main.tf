### Data source
data "yandex_client_config" "client" {}


### Service account
resource "yandex_iam_service_account" "sa" {
  name        = "sa-yandexgpt"
  description = "service account for AI language models"
}


### API key
resource "yandex_iam_service_account_api_key" "api-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "API-key for AI language models"
}


### Role for MML
resource "yandex_resourcemanager_folder_iam_member" "languageModels_user" {
  folder_id = var.folder_id
  role      = "ai.languageModels.user"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}


### Role for serverless and public function mode
resource "yandex_function_iam_binding" "iam" {
  function_id = yandex_function.serverless.id
  role        = "functions.functionInvoker"
  members = [
    "system:allUsers",
  ]
}


### Serverless function for
resource "yandex_function" "serverless" {
  folder_id         = var.folder_id
  name              = "yandexgpt-function"
  user_hash         = "v.1"
  tags              = ["my-tag"]
  description       = "Call function Telegram bot"
  runtime           = "python312"
  entrypoint        = "index.handler"
  memory            = 256
  execution_timeout = 10

  service_account_id = yandex_iam_service_account.sa.id

  environment = {
    FOLDER_ID      = var.folder_id
    TELEGRAM_TOKEN = var.telegram_token,
    API_KEY        = yandex_iam_service_account_api_key.api-key.secret_key
  }

  content {
    zip_filename = "./index.zip"
  }
}






