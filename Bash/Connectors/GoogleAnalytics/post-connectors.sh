# FivetranのAPIキーとシークレットを設定
API_KEY=""
API_SECRET_KEY=""

# APIエンドポイント
URL="https://api.fivetran.com/v1/connectors"

# リクエストボディ
BODY='{
    "service": "google_analytics_4",
    "group_id": "herring_idealness",
    "config": {
    	"schema": "test_google_analytics_sh",
    	"timeframe_months": "TWELVE",
    	"sync_mode": "SPECIFIC_ACCOUNTS",
    	"accounts": [""],
    	"properties": [""],
        "reports": [
        	{
        		"table": "table_1",
        		"config_type": "CUSTOM",
        		"dimensions": ["date", "firstUserMedium"],
        		"metrics": ["newUsers", "totalRevenue", "sessions"],
        		"filter_field_name": "browser",
        		"filter_field_value": "chrome",
        		"rollback_window": 15
      		},
      		{
        		"table": "table_2",
        		"config_type": "PREBUILT",
        		"prebuilt_report": "USER_ACQUISITION_FIRST_USER_MEDIUM_REPORT"
      		}
		]
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