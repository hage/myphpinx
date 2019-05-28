# myphpinx -- MySQL + PHP + Nginx

これは MySQL + PHP + Nginx による開発環境を Docker にて素早く構築することを目的としています。ここにあるファイル群を雛形として環境構築を行います。素のままでも web ブラウザで https://localhost/ にアクセスしたら phpinfo および PDO による mysql アクセスのサンプルを見ることができます。

初回起動時および `make reset-db` 後はデータベースの再構築に起動後 1 分ほどかかります。それまでの間 web ブラウザによるアクセスや `make db` による mysql 起動はエラーになります。

`make up` で起動しますが、その前に `config.env.dist` を `config.env` にコピーしてください。データベースの設定情報等をここに記述しますが、とりあえず起動するにはコピーするだけで十分です。
