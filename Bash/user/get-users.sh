# APIとAPI秘密鍵を設定する
API_KEY="xxxxxxxxx"
API_SECRET_KEY="xxxxxxxxxxxxxxxxx"

curl -X GET "https://api.fivetran.com/v1/users" -u $API_KEY:$API_SECRET_KEY | jq