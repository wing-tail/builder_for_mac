# Builder for Mac

## 概要
Macの開発環境を自動構築するスクリプトです。
Docker Desktopはサービスが料金に見合っていないため、Colima + Dockerでコンテナ環境を構築します。

## 前提条件
- macOS
- Homebrew、Git、Ansibleがインストール済み

## ディレクトリ構成

```
builder_for_mac/
├── README.md      # このファイル
├── roles/
│   ├── homebrew/  # パッケージ管理
│   └── vim/       # Vim設定
├── inventory/
│   └── hosts      # Ansibleインベントリ
└── set_up.yml     # メインのプレイブック
```

## セットアップ

```sh
# Homebrewのインストール（未インストールの場合）
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 必要なツールのインストール
$ brew install git ansible

# このリポジトリのクローン
$ git clone https://github.com/wing-tail/builder_for_mac.git
$ cd builder_for_mac

# 環境構築の実行
$ ansible-playbook -i inventory set_up.yml
```

## colima 起動コマンド
`.zshrc` に記載しておくと自動起動になります。

```sh
colima start --vm-type vz --vz-rosetta --profile x64 --arch x86_64 --cpu 8 --memory 16 --disk 256 --mount-type virtiofs --mount "~/workspace/colima:w" --dns 8.8.8.8

# colimaが起動していればdockerコマンドで普通にコンテナを起動できる
docker-compose up -d
```

## 設定概要

### Homebrewパッケージ
- 開発ツール: vim, ripgrep, tig, tree, jq, wget
- Docker関連: docker, docker-compose, colima
- クラウドCLI: awscli
- その他の開発/ユーティリティアプリ

### Homebrewアプリケーション（Cask）
- kitty (ターミナルエミュレータ)
- Visual Studio Code
- Cursor
- Google Chrome
- DeepL
- その他の開発/ユーティリティアプリ

### Vim設定
- dpp.vim (プラグインマネージャー)
- ddc.vim (自動補完)
- ddu.vim (ファジーファインダー)
- denops.vim (Deno統合)
- その他の最新設定
