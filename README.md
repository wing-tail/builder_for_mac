# Builder for Mac

## 概要
Docker Desktopが有料化されるに当たって、サービスが料金に見合っていないため、Mac向けにDockerが動く仮想環境を準備します。

## 構成
- Mac上に仮想マシンを立ち上げ、そこに入って開発を行う想定です。
- ディレクトリ構成は以下のようになっています。
  - mac
    - macOSに開発用仮想マシンなどを導入するAnsibleスクリプトを収めたディレクトリです。
    - homebrew, git, ansibleがインストールされているMac環境で用います。
  - linux
    - Debianでの実行を想定した環境構築用シェルスクリプト、およびAnsibleスクリプトを収めたディレクトリです。
    - Debian仮想環境を立てるためのVagrantfileも含まれているので、これをコピーするだけで開発用のプロジェクトディレクトリが作成できます。
    - Debian上であれば環境構築用シェルスクリプトを直接実行することも可能です。

## 実行例

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 実行結果の標準出力に記載のパス用コマンドを実行
$ brew install git
$ brew install ansible
$ git clone https://github.com/wing-tail/builder_for_mac.git
$ cd builder_for_mac
$ ansible-playbook -i mac/inventory mac/set_up.yml
$ cp -r linux ~/project
$ cd ~/project
$ vagrant up
```
