### setWebhook for telegram bot
output "setWebhook" {
    value = "https://api.telegram.org/bot${var.telegram_token}/setWebhook?url=https://functions.yandexcloud.net/${yandex_function.serverless.id}"
  
}