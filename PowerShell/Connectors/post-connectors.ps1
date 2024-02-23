# APIキーとシークレットの設定
$apiUser = ""
$apiSecret = ""

# Base64でエンコード
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $apiUser, $apiSecret)))

# ヘッダーの準備
$headers = @{
    "Authorization" = "Basic $base64AuthInfo"
    "Content-Type" = "application/json"
}

# APIエンドポイント
$url = "https://api.fivetran.com/v1/connectors"

# リクエストボディ
$body = @{
    service = "google_analytics_4"
    group_id = "herring_idealness"
    config = @{
        schema = "test_google_analytics_ps"
        timeframe_months = "TWELVE"
        sync_mode = "SPECIFIC_ACCOUNTS"
        accounts = @("")
        properties = @("")
    }
    auth = @{
        client_access = @{
            client_id = ""
            client_secret = ""
        }
    }
} | ConvertTo-Json -Depth 10

# APIリクエストの実行
$response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body -AllowInsecureRedirect

# レスポンスの表示
$response | ConvertTo-Json