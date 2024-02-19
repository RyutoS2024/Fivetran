## APIリファレンス
https://fivetran.com/docs/rest-api

## Salesforceと連携する手順

### Salesforceで接続アプリケーションを作成する
- 各種設定
  - OAuth設定の有効化
  - コールバックURL（例：http://localhost:8080/oauth2/callback）
  - 選択したOAuth認証
    - データへのアクセスと管理（api）
    - ユーザーに代わっていつでも要求を実行（refresh_token, offline_access）
  - Webサーバーフローの秘密が必要にチェック
  - 更新トークンフローの秘密が必要にチェック

設定を保存し、コンシューマー鍵とコンシューマー秘密鍵を取得する

### コールバックURL用にローカルにWebサーバーを立てる
WebサーバーにはNginxを使う

dockerイメージをプルする

```
$ docker pull nginx:latest
```

Nginxコンテナを起動する

```
$ docker run --name my-nginx -p 8080:80 -d nginx
```

ホストのポート8080とコンテナのポート80をマッピングする。
ローカルマシンの8080ポートを経由してNginxサーバーにアクセスできるようになる

コンテナが起動するとブラウザで http://localhost:8080 を実行する
Ngixnウェルカムページが表示されればサーバーが正常に起動している

サーバー内に入る

```
$ docker exec -it my-nginx /bin/bash
```

http://localhost:8080/outh2/callback にアクセスしたときに認証成功画面を表示する

Nginxサーバー /etc/nginx/conf.d/default.conf （ルーティング）を編集する

```
server {
    listen       80;
    listen  [::]:80;
    server_name  localhost;

    # 既存のルートディレクトリの設定
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    # /oauth2/callback に対する新しい location ブロックを追加
    location /oauth2/callback {
        # ここに /oauth2/callback へのリクエストを処理するための設定を追加する
        root   /usr/share/nginx/html;
        # 指定されたファイルが存在する場合はファイルを提供し、存在しない場合は404エラーを返す
        try_files  /callback.html =404;
    }
    ....
}
```

/usr/share/nginx/html に callback.html を置く

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>認証成功</title>
</head>
<body>
    <h1>認証に成功しました</h1>
    <p>このページを閉じて、アプリケーションに戻ってください。</p>
</body>
</html>
```

以上の設定で、http://localhost:8080/oauth2/callback　にアクセスしたときに認証成功画面が表示される

ファイルを保存したらコンテナを停止し、再起動する。

### OAuth2.0Webサーバーフロー
#### 認証コードを取得する

URLを組み立てブラウザで実行する

```
https://["私のドメイン"の値]/services/oauth2/authorize?client_id=[接続アプリケーションのコンシューマ鍵の値]&redirect_uri=[接続アプリケーションのリダイレクトURLの値]&response_type=code
```

※ 私のドメインは「設定」→「私のドメイン」から確認できる

URLを実行すると「アクセスを許可しますか？」と表示されるので許可する

画面が遷移すると先ほど作成した認証成功画面が表示される。

code以下が認証コードである。
localhost:8080/oauth2/callback?code=xxxxxxxxxxxxxxxxx

#### アクセストークンとリフレッシュトークンを取得する
先ほど取得した認証コードを使いアクセストークンとリフレッシュトークンを取得する

```
curl -v https://["私のドメイン"の値]/services/oauth2/token -d 'grant_type=authorization_code' -d 'code=[認証コードの値]' -d 'client_id=[接続アプリケーションのコンシューマ鍵の値]' -d 'client_secret=[接続アプリケーションのコンシューマの秘密の値]' -d 'redirect_uri=[接続アプリケーションのリダイレクトURLの値]' -H "Content-Type:application/x-www-form-urlencoded"
```

実行するとアクセストークンとリフレッシュトークンを取得できる
