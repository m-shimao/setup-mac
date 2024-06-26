# setuo mac

## 事前準備

```bash
# Xcode CLI インストール
xcode-select --install

# Homebrewインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew -v

# Ansible インストール後ターミナルを再起動するとコマンドを認識する
brew install ansible

# Ansible Galaxy からロールのインストールする
ansible-galaxy install -r requirements.yml

# inventory.ini ファイルを作成し、内容を環境固有にものに変更する
cp inventory.ini.example inventory.ini
vim inventory.ini

# ディレクトリを作成しておく
mkdir -p ~/.config/nvim

# Google日本語入力のインストールのために、Rosetta 2をインストールして、Xcodeのライセンスに同意しておく
softwareupdate --install-rosetta --agree-to-license
sudo xcodebuild -license accept
```

## 環境構築

- Ansibleを実行する
```bash
ansible-playbook playbook.yml -i inventory.ini -K
```

- NodeJSを設定（[参考](https://qiita.com/ucan-lab/items/0b854cfaa9d7c8ede106)）
```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 20.12.0
asdf global nodejs 20.12.0
```

- yarnインストール(asdfでインストールするとエラーになるのでcorepackで)
```
corepack enable yarn
asdf reshim
yarn --version
...
Do you want to continue? [Y/n] Y
```

- システム設定 -> キーボード -> テキスト入力 -> 入力ソースの編集でGoogle日本語入力を使用するように設定する

- Karabiner-Elementsを起動して、権限を付与したあとに左コマンドキーで英数、右コマンドキーでかな入力の切り替えの設定を有効化する

- Mac起動音を失くす
```bash
sudo nvram StartupMute=%01
```

- zsh-completionsの設定（[参考](https://zenn.dev/sprout2000/articles/bd1fac2f3f83bc)）
```
chmod go-w '/opt/homebrew/share'
chmod -R go-w '/opt/homebrew/share/zsh'
rm -f ~/.zcompdump; compinit
```

- Macを再起動する

## その他

- [参考記事](https://qiita.com/ucan-lab/items/d61e8c9d4892d6021e61)
