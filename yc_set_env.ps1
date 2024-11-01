# Получение переменных из Yandex Cloud CLI
$env:TF_VAR_cloud_id=$(yc config get cloud-id)
$env:TF_VAR_folder_id=$(yc config get folder-id)
$env:TF_VAR_yc_token=$(yc iam create-token)

$token = Read-Host -Prompt "Введите ваш Telegram токен"
$env:TF_VAR_telegram_token = $token


Write-Host "Переменные окружения установлены."