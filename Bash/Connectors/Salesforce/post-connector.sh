# FivetranのAPIキーとシークレットを設定
API_KEY=""
API_SECRET_KEY=""

# APIエンドポイント
URL="https://api.fivetran.com/v1/connectors"

# リクエストボディ
BODY='{
    "service": "salesforce",
    "group_id": "herring_idealness",
    "config": {
    	"schema": "test"
  	},
    "auth": {
        "client_access": {
            "client_id": "",
            "client_secret": ""
        },
        "refresh_token": ""
    }
}'

# APIリクエストの実行
curl -X POST "$URL" \
     -u "$API_KEY:$API_SECRET_KEY" \
     -H "Content-Type: application/json" \
     -d "$BODY" | jq