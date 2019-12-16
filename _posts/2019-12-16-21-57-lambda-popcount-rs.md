---
layout: post
title: popcountするアプリ作った
date: 2019-12-16-21-57
---

aws lambdaのカスタムランタイムでRustが使えることは知ってたけどやったことがなかったので使ってみたかった。実際やってみると超簡単で、lambdaの関数作るところまではマッハで出来た。

[リポジトリ](https://github.com/kuisiba/lambda_popcount_rs)

```json
{
    "value": "12345"
}
```

みたいなのを送ると

```json
{
    "popcount": 6
}
```

みたいのが返ってくる。
u64としてパース出来ないvalueは弾くようになっている。
んでAPI Gatewayをぽちぽちやってアプリ完成。
API Gatewayは設定でめっちゃ詰まったからエヌユルさんに教えて貰いながらやった。

んで、今は簡単なシェルスクリプトを書いてコマンドとして使っている。リポジトリのpopcountってファイル。

```shell
#!/bin/sh

curl -X POST -H "Content-Type: application/json" -H "x-api-key:{API_KEY}" -d "{\"value\":\"${1}\"}" -s https://{API_ID}.execute-api.ap-northeast-1.amazonaws.com/{STAGE_NAME}/ | jq .popcount
```

立ってるビット数知りたいだけにしては大げさだけど、APIはやしておくとどこからでも叩けるからね。
