#!/bin/bash

export TF_VAR_cloud_id=$(yc config get cloud-id)
export TF_VAR_folder_id=$(yc config get folder-id)
export TF_VAR_yc_token=$(yc iam create-token)
export TF_VAR_telegram_token=$TELEGRAM_BOT_TOKEN

echo "Переменные окружения установлены."
