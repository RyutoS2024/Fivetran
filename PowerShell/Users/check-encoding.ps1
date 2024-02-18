# APIキーとシークレットの設定
$apiUser = "xxxxxxxx"
$apiSecret = "xxxxxxxxxxxxx"

# Base64でエンコード
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $apiUser, $apiSecret)))

$base64AuthInfo

# ヘッダーの準備
$headers = @{
    "Authorization" = "Basic $base64AuthInfo"
}

$headers