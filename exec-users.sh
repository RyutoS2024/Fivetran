# APIとAPI秘密鍵を設定する
API_KEY="xxxxx" //置き換える
API_SECRET_KEY="xxxxx" //置き換える

curl -X GET "https://api.fivetran.com/v1/users" -u $API_KEY:$API_SECRET_KEY | jq
