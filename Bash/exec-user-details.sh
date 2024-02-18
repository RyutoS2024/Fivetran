# APIとAPI秘密鍵を設定する
API_KEY="xxxxxxxxx"
API_SECRET_KEY="xxxxxxxxxxxxxxxxx"

# "id": "waste_westerly" 
curl -X GET "https://api.fivetran.com/v1/users/waste_westerly" -u $API_KEY:$API_SECRET_KEY | jq