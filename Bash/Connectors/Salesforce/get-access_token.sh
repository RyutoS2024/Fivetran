# コンシューマーキー
CLIENT_ID=""
# コンシューマーの秘密
CLIENT_SECRET=""
# 認証コード
CODE=""
# リダイレクトURI
REDIRECT_URI="http://localhost:8080/oauth2/callback"

# cURLを使用してリクエストの実行
curl -X POST "https://[私のドメイン].my.salesforce.com/services/oauth2/token" \
     -d "grant_type=authorization_code" \
     -d "client_id=${CLIENT_ID}" \
     -d "client_secret=${CLIENT_SECRET}" \
     -d "code=${CODE}" \
     -d "redirect_uri=${REDIRECT_URI}" | jq