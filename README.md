# Builder for Mac

## 概要
Docker Desktopが有料化されるに当たって、サービスが料金に見合っていないため、Mac向けにDockerベースの開発環境を準備します。

## 構成
- Mac上に開発用の仮想マシンを立ち上げ、開発は仮想マシンに入って行う想定です。
- ディレクトリ構成は以下のようになっています。
  - mac
    - 開発用仮想マシンなどを導入するAnsibleスクリプトを収めたディレクトリです。
    - homebrew, git, ansibleがインストールされているMac環境で用います。
  - linux
    - Alpine Linuxに開発環境として必要なソフトウェアや設定を導入するAnsibleスクリプトを収めたディレクトリです。
    - 前項のスクリプトでインストールしたVagrantとVirtualBoxで立てたAlpine Linuxの仮想環境に対して実行します。
    - 依存関係は存在しないのでAlpine Linuxのセットアップとして、このディレクトリ配下のみを活用しても良いです。

## 実行例

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew install git
$ brew install ansible
$ git clone git@github.com:wing-tail/builder_for_mac.git
```
