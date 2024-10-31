# Yandex GPT Telegram Bot

Этот проект представляет собой Telegram-бота, который использует модель yandexgpt-lite для обработки сообщений. Бот позволяет пользователям взаимодействовать с моделью, отправляя текстовые сообщения и получая ответы в режиме реального времени. Проект построен с использованием Terraform для управления инфраструктурой и Serverless Function Yandex для обработки запросов.


### Технологии
Yandex Cloud
Serverless Functions
Terraform
Python

### Установка

Клонируйте репозиторий:

git clone https://github.com/Zen-Crow/yandexgpt-telegram-bot.git

cd yandex-cloud-bot-with-terraform/dev

Установите переменные окружения из фала yc_set_env.ps1 для своей операционной системы.

команда в powershell:

    . .\yc_set_env.ps1


В переменной $TELEGRAM_BOT_TOKEN установите токен бота которого вы создали.


### Запуск проекта

    Инициализируйте Terraform:            terraform init

    Проверьте план развертывания:         terraform plan

    Примените конфигурацию Terraform:     terraform apply


### Последний шаг установка webHook'a

после завершения команды terraform apply вы получите команду:

setWebhook = "https://api.telegram.org/bot{ТЕЛЕГРАМ_ТОКЕН}/setWebhook?url=https://functions.yandexcloud.net/{CLOUD_FUNCTION_ID}"

Подружите ее с браузером или если вам нравится работать в терминале:

curl -X POST https://api.telegram.org/bot{ТЕЛЕГРАМ_ТОКЕН}/setWebhook?url=https://functions.yandexcloud.net/{CLOUD_FUNCTION_ID}


### Удаление ресурсов 

terraform destroy

### Удаление webHook'a

curl -X POST https://api.telegram.org/bot{ТЕЛЕГРАМ_ТОКЕН}/deleteWebhook?url=https://functions.yandexcloud.net/{CLOUD_FUNCTION_ID}


### Happy Coding!!!