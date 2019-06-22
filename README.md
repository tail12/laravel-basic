# laravel-basic

Laravel用のDockerリポジトリ

## 使い方

### プロジェクト準備
```
$ git clone git@github.com:tail12/laravel-basic.git
$ cd laravel-basic
$ mkdir project-data
$ cd project-data
$ git clone {laravel-project}

$ cd ../
```

### 設定
`project-data`内にcloneしたlaravelプロジェクト名を設定する必要がある。
対象のファイルは次の通り
- docker-compose.yml
- nginx/sites-enabled/basic.local.com

変更する点は
```
project-basic -> laravelプロジェクト名
```

これでプロジェクトを読み込む設定は終わり。

### host名を設定する
`/etc/hosts`に次の一行を追記する。

```
127.0.0.1 basic.local.com
```
※管理者権限が必要なので、`sudo`で変更すること。

### docker-syncを利用しない場合

```
$docker-compose up -d nginx basic
```

### docker-syncを利用する場合
※docker-syncを利用するとdocker開発爆速になる
(docker-syncを利用しなくてもcachedを使っているのである程度は許容できるレベルではあるが…)
#### docker-sync起動

```
$ docker-sync start
```

#### docker-compose up

```
$ docker-compose -f docker-compose.yml -f docker-compose-sync.yml up -d nginx basic
```

#### ブラウザでアクセス

`https://basic.local.com` にアクセスすることで接続できる。


