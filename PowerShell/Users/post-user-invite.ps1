# APIキーとシークレットの設定
$apiUser = "xxxxxxxx"
$apiSecret = "xxxxxxxxxxxxx"

# Base64でエンコード
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $apiUser, $apiSecret)))

# ヘッダーの準備
$headers = @{
    "Authorization" = "Basic $base64AuthInfo"
    "Content-Type" = "application/json"
}

# APIエンドポイント
$url = "https://api.fivetran.com/v1/users"

# リクエストボディ
$body = @{
    given_name = "John"
    family_name = "Black"
    email = "john.black@mycompany.com"
    phone = "+1234567890"
    picture = "http://mycompany.com/avatars/john_black.png"
    role = "Account Reviewer"
} | ConvertTo-Json

# APIリクエストの実行
$response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body -AllowInsecureRedirect

# レスポンスの表示
$response