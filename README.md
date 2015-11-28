# mojolicious-config-sample

## はじめに
Mojoliciousでconfigを使うサンプル

## 前提
下記が入っている前提です
>
* perl
    - 5.18.4
* plenv
* cpanm
* carton

## 動かすサンプル
mojolicious入れるところも一応書いておきます

```bash
# サンプルのclone
$ git clone git@github.com:tweeeety/mojolicious-config-sample.git

# Mojoliciousのインストール
$ echo "requires 'Mojolicious';" > cpanfile
$ echo "requires 'Path::Class';" >> cpanfile
$ plenv exec carton install
$ plenv rehash

# サンプルの起動
$ cd mojolicious-config-sample
$ carton exec morbo script/config_sample_web.psgi
Server available at http://127.0.0.1:3000
```
