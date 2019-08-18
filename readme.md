# myphpinx -- MySQL + PHP + Nginx

## 概要

これは MySQL + PHP + Nginx による開発環境を Docker にて素早く構築することを目的としています。ここにあるファイル群を雛形として環境構築を行います。素のままでも web ブラウザで https://localhost/ にアクセスしたら phpinfo および PDO による mysql アクセスのサンプルを見ることができます。

初回起動時および `make reset-db` 後はデータベースの再構築に起動後 1 分ほどかかります。それまでの間 web ブラウザによるアクセスや `make db` による mysql 起動はエラーになります。

`make up` で起動しますが、その前に `dot.env.dist` を `.env` にコピーしてください。データベースの設定情報等をここに記述しますが、とりあえず起動するにはコピーするだけで十分です。

`.env` の [`COMPOSE_PROJECT_NAME`エントリ](http://docs.docker.jp/compose/reference/envvars.html#id7) にプロジェクト名を設定すると生成されるコンテナ名がこの値に応じて設定されます。ここは Docker の環境でグローバルに見える部分ですのでプロジェクトに応じて設定した方が良いでしょう。

## 開発の手順

こんな感じでしょうか。

* このリポジトリを clone
* .git を消す
* 改めて `git init . && git add . && git commit -m 'initial commit'`
* プロジェクトに応じて Docker の設定を調整してコミット
* 開発開始
