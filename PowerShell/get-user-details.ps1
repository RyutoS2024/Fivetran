# APIキーとシークレットの設定
$apiUser = "xxxxxxxx"
$apiSecret = "xxxxxxxxxxxxx"

# Base64でエンコード
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $apiUser, $apiSecret)))

# ヘッダーの準備
$headers = @{
    "Authorization" = "Basic $base64AuthInfo"
}

# APIエンドポイント
$url = "https://api.fivetran.com/v1/users/waste_westerly"

# GETリクエストの実行
$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers

# レスポンスの表示
$response | ConvertTo-Json | Write-Output