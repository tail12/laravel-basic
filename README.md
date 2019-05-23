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


### docker-sync起動

```
$ docker-sync start
```

### docker-compose up

```
$ docker-compose -f docker-compose.yml -f docker-compose-sync.yml up -d nginx basic
```

### ブラウザでアクセス

`https://basic.local.com` にアクセスすることで接続できる。


