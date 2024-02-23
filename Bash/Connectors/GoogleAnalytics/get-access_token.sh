# コンシューマーキー
CLIENT_ID=""
# コンシューマーの秘密
CLIENT_SECRET=""
# 認証コード
CODE=""

curl -X POST https://oauth2.googleapis.com/token \
     -d "code=${CODE}" \
     -d "client_id=${CLIENT_ID}" \
     -d "client_secret=${CLIENT_SECRET}" \
     -d "redirect_uri=http://localhost:8080/oauth2/callback" \
     -d "grant_type=authorization_code" | jq


