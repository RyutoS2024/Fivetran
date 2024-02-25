# FivetranのAPIキーとシークレットを設定
API_KEY=$FIVETRAN_API_KEY
API_SECRET_KEY=$FIVETRAN_API_SECRET_KEY

# APIエンドポイント
URL="https://api.fivetran.com/v1/users"

# リクエストボディ
BODY='{
  "given_name": "John",
  "family_name": "White",
  "email": "john.white@mycompany.com",
  "phone": "+1234567890",
  "picture": "http://mycompany.com/avatars/john_white.png",
  "role": "Account Reviewer"
}'

# APIリクエストの実行
curl -X POST "$URL" \
     -u "$API_KEY:$API_SECRET_KEY" \
     -H "Content-Type: application/json" \
     -d "$BODY" | jq