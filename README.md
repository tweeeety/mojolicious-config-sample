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

## config
#### file
```bash
$ tree
.
├── README.md
├── etc ← これ
│   ├── db.conf
│   ├── db_dev.conf
│   ├── db_prd.conf
│   ├── web.conf
│   ├── web_dev.conf
│   └── web_prd.conf
├── lib
├── public
├── script
├── t
└── templates

```

#### load
```perl
  my $self = shift;
  my $home = new Path::Class::File(__FILE__);
  my $root = $home->dir->resolve->absolute->parent->parent();

  # 環境によってsuffixを分ける
  my $suffix = $self->mode eq 'production' ? '_prd' : '_dev';
  for my $e ( qw/web db/ ) {
    my $f = $root->stringify . '/etc/' . $e . $suffix . '.conf';
    $self->plugin( 'Config', { 'file' => $f } );
  }
```

#### use
```perl
  $self->app->config->{WEB};
```

## see also
http://tweeeety.hateblo.jp/entry/2015/11/28/204356