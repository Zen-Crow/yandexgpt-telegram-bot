import requests
import json
import os


TELEGRAM_TOKEN = os.getenv("TELEGRAM_TOKEN")
SECRET_API_KEY = os.getenv("API_KEY")
FOLDER_ID = os.getenv("FOLDER_ID")



def handler(event, context):

    data = json.loads(event["body"])
    print(data)

    chat_id = data["message"]["chat"]["id"]
    text = data["message"]["text"]

    resp = requests.post(
        url="https://llm.api.cloud.yandex.net/foundationModels/v1/completion",
        headers={
            "Authorization": f"Api-Key {SECRET_API_KEY}",
            "x-folder-id": FOLDER_ID,
            "Content-Type": "application/json",
        },
        
        json={
            "modelUri": f"gpt://{FOLDER_ID}/yandexgpt-lite",
            "completionOptions": {
                "stream": False,
                "temperature": 0.6,
                "maxTokens": 2000,
            },
            "messages": [
                {
                    "role": "system",
                    "text": "Ты умный ассистент"
                },
                {
                    "role": "user", 
                    "text": text
                }
            ],
        },
    )

    answer = resp.json().get("result", {}).get("alternatives", [{}])[0].get("message", {}).get("text", "Извините, не удалось получить ответ.")

    requests.post(f'https://api.telegram.org/bot{TELEGRAM_TOKEN}/sendMessage', {
        'chat_id': chat_id,
        'text': answer
    })

    return {
        "statusCode": 200, 
        "body": "Happy Coding!"
    }
